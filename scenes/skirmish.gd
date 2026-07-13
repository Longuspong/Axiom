extends Node2D
## Skirmish-Kampfkern (Phase-1-Prototyp, Gefechtstyp „Elimination", GDD §5.1).
##
## Zug-Modell (Nutzer-Vorgabe): Wer dran ist, ist einfach dran — KEIN Aktionsmenü.
##   • Sofort werden alle begehbaren Felder blau markiert (Bewegung bis MOB,
##     Pfad wird automatisch als günstigster Weg gewählt).
##   • Angreifbare Gegner (in Waffenreichweite) tragen ein rotes Ziel-Symbol
##     über dem Kopf und werden rot markiert.
##   • Pro Zug: einmal bewegen + einmal angreifen (Reihenfolge frei), dann endet
##     der Zug automatisch bzw. per Button „Zug beenden" (nichts getan = gewartet).
##   • Einheiten außer Reichweite lassen sich nur inspizieren (Detail-Panel).
##   • Immer über dem Kopf: Name, LP, Initiative. Mana + Details nur beim Inspizieren.
##
## Steuerung (ein Grid-Cursor für Maus/Tastatur/Touch, §10.5):
##   Cursor: Maus · Pfeile/WASD · virtueller Joystick (unten links)
##   Bestätigen: Linksklick · Enter/Leertaste · Button „Bestätigen"
##   Zug beenden: Button „Zug beenden" · Taste E
##   R: neu starten

const SETUP_PATH := "res://data/prototype/skirmish_setup.json"

enum State { IDLE, ACTIVE, GAME_OVER }

var board: Board
var terrain: Terrain
var _units_root: Node2D = null
var units: Array = []
var tracker := InitiativeTracker.new()
var rng := RandomNumberGenerator.new()

var state: State = State.IDLE
var active: Unit = null
var has_moved := false
var has_attacked := false
var _log_lines: Array = []

# UI
var joystick: VirtualJoystick = null
var _hud_status: Label
var _hud_hint: Label
var _hud_hover: Label
var _hud_inspect: Label
var _hud_log: Label
var _hud_banner: Label

# Joystick-Schrittwiederholung
const REPEAT_DELAY := 0.16
const DEADZONE := 0.5
var _rep_t := 0.0
var _last_dir := Vector2i.ZERO

signal turn_finished


func _ready() -> void:
	rng.randomize()
	var data := _load_setup()
	if data.is_empty():
		push_error("Skirmish: Setup konnte nicht geladen werden.")
		return
	_build_board(data)
	_build_units(data)
	_build_camera(data)
	_build_hud()
	tracker.setup(units)
	_refresh_concealment()
	_log("Gefecht beginnt — %d gegen %d." % [_team_count("player"), _team_count("enemy")])
	run_battle()


# --------------------------------------------------------------------------
# Aufbau
# --------------------------------------------------------------------------
func _load_setup() -> Dictionary:
	if not FileAccess.file_exists(SETUP_PATH):
		return {}
	var f := FileAccess.open(SETUP_PATH, FileAccess.READ)
	if f == null:
		return {}
	var parsed = JSON.parse_string(f.get_as_text())
	f.close()
	return parsed if parsed is Dictionary else {}

func _build_board(data: Dictionary) -> void:
	board = Board.new()
	var g: Dictionary = data.get("grid", {})
	board.grid_size = Vector2i(int(g.get("width", 12)), int(g.get("height", 12)))
	terrain = Terrain.new()
	terrain.setup(data.get("terrain", {}), board.grid_size)
	board.terrain = terrain
	add_child(board)
	board.build()
	# Einheiten-Container mit Y-Sortierung (untere Iso-Reihen verdecken obere).
	_units_root = Node2D.new()
	_units_root.y_sort_enabled = true
	add_child(_units_root)

func _build_units(data: Dictionary) -> void:
	var archetypes: Dictionary = data.get("archetypes", {})
	var weapons: Dictionary = data.get("weapons", {})
	var teams: Dictionary = data.get("teams", {})
	for team_name in ["player", "enemy"]:
		for entry in teams.get(team_name, []):
			var arch: Dictionary = archetypes.get(entry.get("archetype", ""), {})
			if arch.is_empty():
				continue
			var weapon: Dictionary = weapons.get(arch.get("weapon", ""), {})
			var pos_arr: Array = entry.get("pos", [0, 0])
			var cell := Vector2i(int(pos_arr[0]), int(pos_arr[1]))
			var u := Unit.new()
			u.setup(team_name, arch, weapon, cell)
			units.append(u)
			_units_root.add_child(u)

func _build_camera(data: Dictionary) -> void:
	var cam := Camera2D.new()
	# Iso-Raute: Zellen (0,0) und (max,max) liegen beide auf der vertikalen
	# Mittelachse — ihr Mittelwert ist das Kartenzentrum.
	var lo := GridUtils.cell_to_world(Vector2i.ZERO)
	var hi := GridUtils.cell_to_world(board.grid_size - Vector2i.ONE)
	cam.position = (lo + hi) / 2.0
	cam.zoom = Vector2(0.85, 0.85)  # Luft für hohe Tiles (Bäume/Klippen) am Rand
	add_child(cam)
	cam.make_current()

func _build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)

	_hud_status = _make_label(layer, Vector2(16, 12), 18, Color.WHITE)
	_hud_hint = _make_label(layer, Vector2(16, 40), 13, Color(0.82, 0.88, 1.0))
	_hud_hint.text = "Cursor: Maus/Pfeile/Joystick  ·  Bestätigen: Klick/Enter/Leertaste  ·  Zug beenden: Button/E  ·  R: neu"
	_hud_hover = _make_label(layer, Vector2(16, 64), 14, Color(1.0, 0.95, 0.75))

	_hud_inspect = _make_label(layer, Vector2(1170, 150), 14, Color(0.9, 0.95, 1.0))
	_hud_inspect.size = Vector2(420, 320)
	_hud_inspect.visible = false

	_hud_log = _make_label(layer, Vector2(16, 660), 14, Color(0.95, 0.95, 0.85))
	_hud_log.size = Vector2(760, 200)

	_hud_banner = _make_label(layer, Vector2(0, 380), 40, Color(1, 1, 0.6))
	_hud_banner.size = Vector2(1600, 80)
	_hud_banner.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_hud_banner.visible = false

	# Touch-Joystick unten links
	joystick = VirtualJoystick.new()
	joystick.position = Vector2(40, 900 - 180 - 40)
	layer.add_child(joystick)

	# Touch-Buttons unten rechts
	var confirm_btn := _make_button(layer, "Bestätigen", Vector2(1436, 700), Vector2(140, 70))
	confirm_btn.pressed.connect(_confirm)
	var end_btn := _make_button(layer, "Zug beenden", Vector2(1436, 782), Vector2(140, 70))
	end_btn.pressed.connect(_on_end_turn)

func _make_label(parent: Node, pos: Vector2, font_size: int, col: Color) -> Label:
	var l := Label.new()
	l.position = pos
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 4)
	parent.add_child(l)
	return l

func _make_button(parent: Node, text: String, pos: Vector2, dim: Vector2) -> Button:
	var b := Button.new()
	b.text = text
	b.focus_mode = Control.FOCUS_NONE
	b.position = pos
	b.custom_minimum_size = dim
	b.size = dim
	b.add_theme_font_size_override("font_size", 18)
	parent.add_child(b)
	return b


# --------------------------------------------------------------------------
# Spielschleife
# --------------------------------------------------------------------------
func run_battle() -> void:
	while state != State.GAME_OVER:
		var u := tracker.next_unit()
		if u == null:
			break
		active = u
		# Initiative-Balken aller Einheiten aktualisieren (Zug-Schnappschuss)
		for x in units:
			x.queue_redraw()
		board.active_cell = u.grid_pos
		board.cursor_cell = Vector2i(-1, -1)
		board.queue_redraw()
		if u.team == "player":
			await take_player_turn(u)
		else:
			await take_enemy_turn(u)
		if state == State.GAME_OVER:
			break
		tracker.consume(u)
		_check_win()
	active = null
	_reset_ui()


func take_player_turn(u: Unit) -> void:
	has_moved = false
	has_attacked = false
	state = State.ACTIVE
	board.cursor_cell = u.grid_pos
	_refresh_highlights()
	await turn_finished

func _on_end_turn() -> void:
	if state == State.ACTIVE:
		_finish_turn()

func _finish_turn() -> void:
	state = State.IDLE
	_reset_ui()
	turn_finished.emit()

func _reset_ui() -> void:
	for u in units:
		u.targetable = false
		u.queue_redraw()
	if board != null:
		board.move_cells = []
		board.attack_cells = []
		board.cursor_cell = Vector2i(-1, -1)
		board.queue_redraw()
	if _hud_hover != null:
		_hud_hover.text = ""
	if _hud_inspect != null:
		_hud_inspect.visible = false


# --------------------------------------------------------------------------
# Aktions-Highlights (erreichbare Felder + Angriffsziele)
# --------------------------------------------------------------------------
func _refresh_highlights() -> void:
	for u in units:
		u.targetable = false
	board.move_cells = _reachable_cells(active) if not has_moved else []
	var tcells: Array = []
	if not has_attacked:
		for t in _targets_for(active):
			t.targetable = true
			tcells.append(t.grid_pos)
		# Blockaden in Waffenreichweite sind ebenfalls angreifbar (§5.1 Typ 6)
		for c in _blockade_targets(active):
			tcells.append(c)
	board.attack_cells = tcells
	board.active_cell = active.grid_pos
	board.queue_redraw()
	for u in units:
		u.queue_redraw()
	_update_status()


# --------------------------------------------------------------------------
# Vereinheitlichte Eingabe
# --------------------------------------------------------------------------
func _confirm() -> void:
	if state != State.ACTIVE:
		return
	var cell := board.cursor_cell
	if cell.x < 0:
		return
	# 1) Angriff auf markiertes Ziel (Einheit oder Blockade)
	if not has_attacked and board.attack_cells.has(cell):
		var target := unit_at(cell)
		if target != null:
			_do_attack(active, target)
			has_attacked = true
			_after_action()
			return
		if terrain.is_blockade(cell):
			_attack_blockade(active, cell)
			has_attacked = true
			_after_action()
			return
	# 2) Bewegung auf erreichbares Feld
	if not has_moved and board.move_cells.has(cell):
		active.grid_pos = cell
		active.revealed = false  # neue Position → Tarnung auf Deckung wieder möglich
		active.refresh()
		has_moved = true
		_refresh_concealment()
		_after_action()
		return
	# 3) Sonst: inspizieren, falls dort eine Einheit steht
	var u := unit_at(cell)
	if u != null:
		_inspect(u)

func _after_action() -> void:
	if state == State.GAME_OVER:
		return
	if has_moved and has_attacked:
		_finish_turn()
	else:
		_refresh_highlights()

func _cursor_input(dir: Vector2i) -> void:
	if state != State.ACTIVE:
		return
	var c := board.cursor_cell + dir
	if in_bounds(c):
		board.cursor_cell = c
		board.queue_redraw()
		_update_hover()

func _mouse_hover(world_pos: Vector2) -> void:
	if state != State.ACTIVE:
		return
	var c := GridUtils.world_to_cell(world_pos)
	if in_bounds(c):
		board.cursor_cell = c
		board.queue_redraw()
		_update_hover()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
		return
	if state != State.ACTIVE:
		return
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_LEFT, KEY_A:
				_cursor_input(Vector2i(-1, 0))
			KEY_RIGHT, KEY_D:
				_cursor_input(Vector2i(1, 0))
			KEY_UP, KEY_W:
				_cursor_input(Vector2i(0, -1))
			KEY_DOWN, KEY_S:
				_cursor_input(Vector2i(0, 1))
			KEY_ENTER, KEY_KP_ENTER, KEY_SPACE:
				_confirm()
			KEY_E:
				_on_end_turn()
			KEY_ESCAPE:
				if _hud_inspect != null:
					_hud_inspect.visible = false
	elif event is InputEventMouseMotion:
		_mouse_hover(get_global_mouse_position())
	elif event is InputEventMouseButton and event.pressed \
			and event.button_index == MOUSE_BUTTON_LEFT:
		_mouse_hover(get_global_mouse_position())
		_confirm()

func _process(delta: float) -> void:
	if joystick == null or state != State.ACTIVE:
		_rep_t = 0.0
		_last_dir = Vector2i.ZERO
		return
	var v := joystick.direction
	if v.length() < DEADZONE:
		_rep_t = 0.0
		_last_dir = Vector2i.ZERO
		return
	var dir := _dominant(v)
	if dir != _last_dir:
		_cursor_input(dir)
		_last_dir = dir
		_rep_t = 0.0
	else:
		_rep_t += delta
		if _rep_t >= REPEAT_DELAY:
			_rep_t = 0.0
			_cursor_input(dir)

## Analoge Bildschirm-Richtung → Grid-Schritt. Die Grid-Achsen liegen auf dem
## Bildschirm diagonal (Iso Diamond Down: +x = unten rechts, +y = unten links),
## also die Stick-Richtung auf beide Achsen projizieren und die stärkere nehmen.
const ISO_AXIS_X := Vector2(0.894, 0.447)   # normiert (64, 32)
const ISO_AXIS_Y := Vector2(-0.894, 0.447)  # normiert (−64, 32)

func _dominant(v: Vector2) -> Vector2i:
	var ax := v.dot(ISO_AXIS_X)
	var ay := v.dot(ISO_AXIS_Y)
	if absf(ax) >= absf(ay):
		return Vector2i(int(signf(ax)), 0)
	return Vector2i(0, int(signf(ay)))


# --------------------------------------------------------------------------
# Gegner-KI
# --------------------------------------------------------------------------
func take_enemy_turn(u: Unit) -> void:
	_reset_ui()
	board.active_cell = u.grid_pos
	board.queue_redraw()
	await get_tree().create_timer(0.35).timeout
	if state == State.GAME_OVER:
		return
	# „Scheinbar"-Einheiten (Deckung, §5.2) sind nicht anvisierbar — die KI läuft
	# dann zur nächstgelegenen verborgenen Einheit (und deckt sie ggf. ≤2 Felder auf).
	var target := _nearest_opponent(u, false)
	if target == null:
		target = _nearest_opponent(u, true)
	if target == null:
		return
	var reach := int(u.weapon.get("range_max", 1))
	if GridUtils.manhattan(u.grid_pos, target.grid_pos) > reach:
		var dest := _best_step_toward(u, target)
		if dest != u.grid_pos:
			u.grid_pos = dest
			u.revealed = false
			u.refresh()
			_refresh_concealment()
			board.active_cell = dest
			board.queue_redraw()
			await get_tree().create_timer(0.30).timeout
			if state == State.GAME_OVER:
				return
	if not target.concealed \
			and GridUtils.manhattan(u.grid_pos, target.grid_pos) <= reach:
		_do_attack(u, target)
		await get_tree().create_timer(0.25).timeout

## include_concealed=false liefert nur anvisierbare (offenbare) Gegner.
func _nearest_opponent(u: Unit, include_concealed: bool) -> Unit:
	var best: Unit = null
	var best_d := 1 << 30
	for other in units:
		if other.team == u.team or not other.is_alive():
			continue
		if not include_concealed and other.concealed:
			continue
		var d := GridUtils.manhattan(u.grid_pos, other.grid_pos)
		if d < best_d:
			best_d = d
			best = other
	return best

func _best_step_toward(u: Unit, target: Unit) -> Vector2i:
	var best := u.grid_pos
	var best_d := GridUtils.manhattan(u.grid_pos, target.grid_pos)
	for c in _reachable_cells(u):
		var d := GridUtils.manhattan(c, target.grid_pos)
		if d < best_d:
			best_d = d
			best = c
	return best


# --------------------------------------------------------------------------
# Angriffsauflösung
# --------------------------------------------------------------------------
func _do_attack(attacker: Unit, defender: Unit) -> void:
	attacker.revealed = true  # Angreifen beendet die Tarnung sofort (§5.1 Deckung)
	var dist := GridUtils.manhattan(attacker.grid_pos, defender.grid_pos)
	var res := CombatFormulas.resolve_attack(attacker.stats, attacker.weapon,
			defender.defense, dist, rng)
	if not res.hit:
		_refresh_concealment()
		_log("%s verfehlt %s (Chance %d%%)." % [attacker.abbr, defender.abbr,
				int(round(res.hit_chance * 100.0))])
		return
	defender.take_damage(res.damage)
	_spawn_floater(defender, res.damage, res.crit)
	var crit := "  KRIT!" if res.crit else ""
	_log("%s trifft %s für %d%s  (LP %d/%d)" % [attacker.abbr, defender.abbr,
			res.damage, crit, defender.lp, defender.max_lp])
	if not defender.is_alive():
		_log("» %s wurde besiegt." % defender.abbr)
	_refresh_concealment()
	_check_win()

## Blockade (§5.1 Typ 6): trägt LP, beide Teams können sie zerschlagen;
## zerstört → Feld wird Boden. Ohne Defensivwerte, Falloff/Krit gelten normal.
func _attack_blockade(attacker: Unit, cell: Vector2i) -> void:
	attacker.revealed = true
	var dist := GridUtils.manhattan(attacker.grid_pos, cell)
	var res := CombatFormulas.resolve_attack(attacker.stats, attacker.weapon,
			{}, dist, rng)
	if not res.hit:
		_refresh_concealment()
		_log("%s verfehlt die Blockade (Chance %d%%)." % [attacker.abbr,
				int(round(res.hit_chance * 100.0))])
		return
	var destroyed := terrain.damage_blockade(cell, res.damage)
	if destroyed:
		_log("%s zerschlägt die Blockade — der Weg ist frei." % attacker.abbr)
		board.rebuild_cell(cell)  # Feld wird Boden → Tile-Darstellung nachziehen
	else:
		_log("%s trifft die Blockade für %d (LP %d/%d)." % [attacker.abbr, res.damage,
				int(terrain.blockade_lp.get(cell, 0)), terrain.blockade_max_lp])
	_refresh_concealment()
	board.queue_redraw()

func _spawn_floater(on_unit: Unit, amount: int, crit: bool) -> void:
	var l := Label.new()
	l.text = str(amount) + ("!" if crit else "")
	l.add_theme_font_size_override("font_size", 22 if crit else 18)
	l.add_theme_color_override("font_color",
			Color(1, 0.85, 0.3) if crit else Color(1, 0.9, 0.9))
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 4)
	l.position = on_unit.position + Vector2(-8, -46)
	l.z_index = 100
	add_child(l)
	var tw := create_tween()
	tw.tween_property(l, "position", l.position + Vector2(0, -28), 0.7)
	tw.parallel().tween_property(l, "modulate:a", 0.0, 0.7)
	tw.tween_callback(l.queue_free)


# --------------------------------------------------------------------------
# Grid-Abfragen
# --------------------------------------------------------------------------
func unit_at(cell: Vector2i) -> Unit:
	for u in units:
		if u.is_alive() and u.grid_pos == cell:
			return u
	return null

func in_bounds(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.y >= 0 \
			and cell.x < board.grid_size.x and cell.y < board.grid_size.y

## Erreichbare Felder als Dijkstra über Float-Bewegungskosten (GDD §5.1):
## MOB ist ein Bewegungspunkte-Budget, Feldkosten kommen aus der Funktionsschicht
## (Pfad 0,5 · Boden 1,0 · Dickicht 1,5); unbegehbare Typen + Einheiten blocken.
func _reachable_cells(u: Unit) -> Array:
	var budget := float(u.mob)
	var result: Array = []
	var dist := {u.grid_pos: 0.0}
	var frontier: Array = [u.grid_pos]
	while not frontier.is_empty():
		# Zelle mit den geringsten Kosten zuerst expandieren (Grid ist klein,
		# lineare Suche statt Heap reicht hier völlig).
		var best_i := 0
		for i in frontier.size():
			if dist[frontier[i]] < dist[frontier[best_i]]:
				best_i = i
		var cur: Vector2i = frontier.pop_at(best_i)
		for step in GridUtils.STEP_DIRS:
			var nxt: Vector2i = cur + step
			if not in_bounds(nxt) or not terrain.walkable(nxt):
				continue
			if unit_at(nxt) != null:
				continue
			var nd: float = dist[cur] + terrain.cost(nxt)
			if nd > budget + 0.001:
				continue
			if dist.has(nxt) and dist[nxt] <= nd:
				continue
			var first_visit := not dist.has(nxt)
			dist[nxt] = nd
			if first_visit:
				result.append(nxt)
			if not frontier.has(nxt):
				frontier.append(nxt)
	return result

func _targets_for(u: Unit) -> Array:
	var res: Array = []
	var reach := int(u.weapon.get("range_max", 1))
	for other in units:
		if other.team == u.team or not other.is_alive():
			continue
		if other.concealed:
			continue  # „Scheinbar" (Deckung §5.1) = nicht anvisierbar
		if GridUtils.manhattan(u.grid_pos, other.grid_pos) <= reach:
			res.append(other)
	return res

func _blockade_targets(u: Unit) -> Array:
	var res: Array = []
	var reach := int(u.weapon.get("range_max", 1))
	for c in terrain.blockade_lp.keys():
		if GridUtils.manhattan(u.grid_pos, c) <= reach:
			res.append(c)
	return res


# --------------------------------------------------------------------------
# Deckung / „Scheinbar" (§5.1 Typ 8 + §5.2 Sichtsystem)
# --------------------------------------------------------------------------
## Scheinbar, solange die Einheit auf Deckung steht, seit dem Betreten nicht
## angegriffen hat und kein Gegner im Umkreis von 2 Feldern (Manhattan) steht.
func _is_concealed(u: Unit) -> bool:
	if not terrain.conceals(u.grid_pos) or u.revealed:
		return false
	for other in units:
		if other.team != u.team and other.is_alive() \
				and GridUtils.manhattan(u.grid_pos, other.grid_pos) <= 2:
			return false
	return true

## Nach jeder Positions-/Kampfänderung aufrufen — aktualisiert Status + Optik
## (Scheinbar = halbtransparent; echte Unsichtbarkeit für den Gegner-Spieler
## gibt es im PvE-Prototyp bewusst nicht, die KI ignoriert Scheinbare stattdessen).
func _refresh_concealment() -> void:
	for u in units:
		var c: bool = u.is_alive() and _is_concealed(u)
		if c != u.concealed:
			u.concealed = c
			u.modulate.a = 0.45 if c else 1.0
			u.queue_redraw()


# --------------------------------------------------------------------------
# Inspizieren
# --------------------------------------------------------------------------
func _inspect(u: Unit) -> void:
	if _hud_inspect == null:
		return
	var s: Dictionary = u.stats
	var text := "◆ %s  (%s)\n" % [u.unit_name, "Spieler" if u.team == "player" else "Gegner"]
	text += "LP  %d / %d\n" % [u.lp, u.max_lp]
	text += "Mana  %d / %d\n" % [u.mana, u.max_mana]
	text += "Initiative  %d / 100    Speed %.1f\n" % [int(u.initiative), u.speed]
	text += "MOB  %d\n" % u.mob
	text += "STR %d   GES %d   WIL %d\n" % [int(s.get("STR", 0)), int(s.get("GES", 0)), int(s.get("WIL", 0))]
	text += "INT %d   VIT %d   WID %d\n" % [int(s.get("INT", 0)), int(s.get("VIT", 0)), int(s.get("WID", 0))]
	text += "Waffe  %s (%s, Reichw. %d)\n" % [u.weapon.get("name", "?"),
			u.weapon.get("damage_kind", "?"), int(u.weapon.get("range_max", 1))]
	text += "Rüstung %d   Resistenz %d   Diffusion %d" % [
			int(u.defense.get("ruestung", 0)), int(u.defense.get("resistenz", 0)),
			int(u.defense.get("diffusion", 0))]
	_hud_inspect.text = text
	_hud_inspect.visible = true


# --------------------------------------------------------------------------
# Sieg / HUD
# --------------------------------------------------------------------------
func _team_count(team_name: String) -> int:
	return units.filter(func(u): return u.team == team_name and u.is_alive()).size()

func _check_win() -> void:
	if state == State.GAME_OVER:
		return
	if _team_count("enemy") == 0:
		_end_game("SIEG — alle Gegner besiegt!")
	elif _team_count("player") == 0:
		_end_game("NIEDERLAGE — Trupp ausgelöscht.")

func _end_game(message: String) -> void:
	var was_player_turn := state == State.ACTIVE
	state = State.GAME_OVER
	_reset_ui()
	_log(message)
	if _hud_banner != null:
		_hud_banner.text = message + "\n(R = neu starten)"
		_hud_banner.visible = true
	if was_player_turn:
		# Ein laufender Spielerzug wartet auf turn_finished — auflösen,
		# damit run_battle den Game-Over-Zustand sieht und sauber endet.
		turn_finished.emit()

func _update_status() -> void:
	if active == null or _hud_status == null:
		return
	var avail: Array = []
	if not has_moved:
		avail.append("Bewegen")
	if not has_attacked:
		avail.append("Angriff")
	var avail_str := ", ".join(avail) if not avail.is_empty() else "—"
	var order := tracker.preview(5)
	var order_str := ""
	for u in order:
		order_str += u.abbr + " "
	var who := "%s (%s)" % [active.unit_name, "Spieler" if active.team == "player" else "Gegner"]
	_hud_status.text = "Am Zug: %s   ·   Verfügbar: %s\nNächste: %s" % [who, avail_str, order_str]

func _update_hover() -> void:
	if _hud_hover == null or active == null:
		return
	var cell := board.cursor_cell
	var field := _field_info(cell)
	var u := unit_at(cell)
	if u != null:
		var role := ""
		if board.attack_cells.has(u.grid_pos):
			role = "  [Ziel — Bestätigen zum Angriff]"
		elif u.team != active.team:
			role = "  [außer Reichweite — Bestätigen zum Inspizieren]"
		var hidden := "  · Scheinbar" if u.concealed else ""
		_hud_hover.text = "%s   LP %d/%d%s%s   ·   %s" % [u.unit_name, u.lp, u.max_lp,
				hidden, role, field]
	else:
		_hud_hover.text = field

## Feld-Kurzinfo für die Hover-Zeile: Funktionstyp + Bewegungskosten (§5.1) —
## macht die Bruchkosten (0,5/1,5) sichtbar, finale UI-Darstellung folgt (§11).
func _field_info(cell: Vector2i) -> String:
	if terrain == null or not in_bounds(cell):
		return ""
	var ftype := terrain.type_at(cell)
	var label: String = Terrain.LABELS.get(ftype, ftype)
	if terrain.is_blockade(cell):
		return "Feld: %s (LP %d/%d)" % [label,
				int(terrain.blockade_lp.get(cell, 0)), terrain.blockade_max_lp]
	if not terrain.walkable(cell):
		return "Feld: %s (unbegehbar)" % label
	return "Feld: %s (%s BP)" % [label, str(terrain.cost(cell)).replace(".", ",")]

func _log(line: String) -> void:
	_log_lines.append(line)
	while _log_lines.size() > 9:
		_log_lines.pop_front()
	if _hud_log != null:
		_hud_log.text = "\n".join(_log_lines)
