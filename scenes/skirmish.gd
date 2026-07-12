extends Node2D
## Skirmish-Kampfkern (Phase-1-Prototyp, Gefechtstyp „Elimination", GDD §5.1).
## Grid + zwei Trupps + Initiative-Leiste + Bewegen/Reichweite + Angriff mit
## echten Schadensformeln (§5.2) + Sieg wenn ein Team ausgelöscht ist.
##
## Steuerung:
##   Linksklick  – blaue Zelle: hinbewegen · rote Einheit: angreifen
##   Leertaste   – aktuelle Phase überspringen (Bewegung bzw. Angriff)
##   R           – Gefecht neu starten
##
## Ablauf pro Zug: erst Bewegen (bis MOB), dann ein Angriff — beides optional.

const SETUP_PATH := "res://data/prototype/skirmish_setup.json"

enum State { IDLE, MOVE, ATTACK, GAME_OVER }

var board: Board
var units: Array = []
var tracker := InitiativeTracker.new()
var rng := RandomNumberGenerator.new()

var state: State = State.IDLE
var active: Unit = null
var _log_lines: Array = []

# HUD
var _hud_status: Label
var _hud_hint: Label
var _hud_log: Label
var _hud_banner: Label

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
	add_child(board)

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
			add_child(u)

func _build_camera(data: Dictionary) -> void:
	var cam := Camera2D.new()
	cam.position = Vector2(board.grid_size.x * GridUtils.TILE / 2.0,
			board.grid_size.y * GridUtils.TILE / 2.0)
	add_child(cam)
	cam.make_current()

func _build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)

	_hud_status = _make_label(layer, Vector2(16, 12), 18, Color.WHITE)
	_hud_hint = _make_label(layer, Vector2(16, 40), 14, Color(0.85, 0.9, 1.0))
	_hud_hint.text = "Linksklick: bewegen/angreifen  ·  Leertaste: Phase überspringen  ·  R: neu"

	_hud_log = _make_label(layer, Vector2(16, 640), 14, Color(0.95, 0.95, 0.85))
	_hud_log.size = Vector2(700, 220)

	_hud_banner = _make_label(layer, Vector2(0, 380), 40, Color(1, 1, 0.6))
	_hud_banner.size = Vector2(1600, 80)
	_hud_banner.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_hud_banner.visible = false

func _make_label(parent: Node, pos: Vector2, font_size: int, col: Color) -> Label:
	var l := Label.new()
	l.position = pos
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 4)
	parent.add_child(l)
	return l


# --------------------------------------------------------------------------
# Spielschleife
# --------------------------------------------------------------------------
func run_battle() -> void:
	while state != State.GAME_OVER:
		var u := tracker.next_unit()
		if u == null:
			break
		active = u
		board.active_cell = u.grid_pos
		board.queue_redraw()
		_update_status()
		if u.team == "player":
			await take_player_turn(u)
		else:
			await take_enemy_turn(u)
		if state == State.GAME_OVER:
			break
		tracker.consume(u)
		_check_win()
	active = null
	_clear_highlights()

func take_player_turn(u: Unit) -> void:
	state = State.MOVE
	_show_move_range(u)
	await turn_finished

func _finish_turn() -> void:
	state = State.IDLE
	_clear_highlights()
	turn_finished.emit()


# --------------------------------------------------------------------------
# Spieler-Eingabe
# --------------------------------------------------------------------------
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
		return
	if state != State.MOVE and state != State.ATTACK:
		return
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		_skip_phase()
	elif event is InputEventMouseButton and event.pressed \
			and event.button_index == MOUSE_BUTTON_LEFT:
		_handle_click(GridUtils.world_to_cell(get_global_mouse_position()))

func _skip_phase() -> void:
	if state == State.MOVE:
		_enter_attack_phase(active)
	elif state == State.ATTACK:
		_finish_turn()

func _handle_click(cell: Vector2i) -> void:
	if state == State.MOVE:
		if cell == active.grid_pos:
			_enter_attack_phase(active)
		elif _cell_in(cell, board.move_cells):
			active.grid_pos = cell
			active.refresh()
			board.active_cell = cell
			_enter_attack_phase(active)
	elif state == State.ATTACK:
		var target := unit_at(cell)
		if target != null and target.team != active.team and target.is_alive() \
				and _cell_in(cell, board.attack_cells):
			_do_attack(active, target)
			_finish_turn()

func _enter_attack_phase(u: Unit) -> void:
	state = State.ATTACK
	board.move_cells = []
	board.attack_cells = _attackable_targets(u)
	board.queue_redraw()
	_update_status()
	if board.attack_cells.is_empty():
		# Nichts in Reichweite -> Zug direkt beenden.
		_finish_turn()


# --------------------------------------------------------------------------
# Gegner-KI (einfach: auf nächsten Spieler zu, angreifen wenn in Reichweite)
# --------------------------------------------------------------------------
func take_enemy_turn(u: Unit) -> void:
	await get_tree().create_timer(0.35).timeout
	if state == State.GAME_OVER:
		return
	var target := _nearest_opponent(u)
	if target == null:
		return
	var reach := int(u.weapon.get("range_max", 1))
	if GridUtils.manhattan(u.grid_pos, target.grid_pos) > reach:
		var dest := _best_step_toward(u, target)
		if dest != u.grid_pos:
			u.grid_pos = dest
			u.refresh()
			board.active_cell = dest
			board.queue_redraw()
			await get_tree().create_timer(0.30).timeout
			if state == State.GAME_OVER:
				return
	if GridUtils.manhattan(u.grid_pos, target.grid_pos) <= reach:
		_do_attack(u, target)
		await get_tree().create_timer(0.25).timeout

func _nearest_opponent(u: Unit) -> Unit:
	var best: Unit = null
	var best_d := 1 << 30
	for other in units:
		if other.team == u.team or not other.is_alive():
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
	var dist := GridUtils.manhattan(attacker.grid_pos, defender.grid_pos)
	var res := CombatFormulas.resolve_attack(attacker.stats, attacker.weapon,
			defender.defense, dist, rng)
	if not res.hit:
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

func _spawn_floater(on_unit: Unit, amount: int, crit: bool) -> void:
	var l := Label.new()
	l.text = str(amount) + ("!" if crit else "")
	l.add_theme_font_size_override("font_size", 22 if crit else 18)
	l.add_theme_color_override("font_color", Color(1, 0.85, 0.3) if crit else Color(1, 0.9, 0.9))
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 4)
	l.position = on_unit.position + Vector2(-8, -40)
	l.z_index = 100
	add_child(l)
	var tw := create_tween()
	tw.tween_property(l, "position", l.position + Vector2(0, -28), 0.7)
	tw.parallel().tween_property(l, "modulate:a", 0.0, 0.7)
	tw.tween_callback(l.queue_free)


# --------------------------------------------------------------------------
# Reichweiten / Grid-Abfragen
# --------------------------------------------------------------------------
func unit_at(cell: Vector2i) -> Unit:
	for u in units:
		if u.is_alive() and u.grid_pos == cell:
			return u
	return null

func in_bounds(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.y >= 0 \
			and cell.x < board.grid_size.x and cell.y < board.grid_size.y

## BFS: alle erreichbaren freien Zellen innerhalb MOB Schritten (Einheiten blocken).
func _reachable_cells(u: Unit) -> Array:
	var result: Array = []
	var dist := {u.grid_pos: 0}
	var frontier: Array = [u.grid_pos]
	while not frontier.is_empty():
		var cur: Vector2i = frontier.pop_front()
		var d: int = dist[cur]
		if d >= u.mob:
			continue
		for step in GridUtils.STEP_DIRS:
			var nxt: Vector2i = cur + step
			if not in_bounds(nxt) or dist.has(nxt):
				continue
			if unit_at(nxt) != null:
				continue
			dist[nxt] = d + 1
			frontier.append(nxt)
			result.append(nxt)
	return result

func _attackable_targets(u: Unit) -> Array:
	var res: Array = []
	var reach := int(u.weapon.get("range_max", 1))
	for other in units:
		if other.team == u.team or not other.is_alive():
			continue
		if GridUtils.manhattan(u.grid_pos, other.grid_pos) <= reach:
			res.append(other.grid_pos)
	return res

func _show_move_range(u: Unit) -> void:
	board.move_cells = _reachable_cells(u)
	board.attack_cells = []
	board.active_cell = u.grid_pos
	board.queue_redraw()
	_update_status()

func _clear_highlights() -> void:
	if board == null:
		return
	board.move_cells = []
	board.attack_cells = []
	board.active_cell = Vector2i(-1, -1)
	board.queue_redraw()


# --------------------------------------------------------------------------
# Sieg / HUD
# --------------------------------------------------------------------------
func _team_count(team_name: String) -> int:
	return units.filter(func(u): return u.team == team_name and u.is_alive()).size()

func _check_win() -> void:
	if _team_count("enemy") == 0:
		_end_game("SIEG — alle Gegner besiegt!")
	elif _team_count("player") == 0:
		_end_game("NIEDERLAGE — Trupp ausgelöscht.")

func _end_game(message: String) -> void:
	state = State.GAME_OVER
	_clear_highlights()
	_log(message)
	if _hud_banner != null:
		_hud_banner.text = message + "\n(R = neu starten)"
		_hud_banner.visible = true

func _update_status() -> void:
	if active == null or _hud_status == null:
		return
	var phase := ""
	match state:
		State.MOVE:
			phase = "Bewegen"
		State.ATTACK:
			phase = "Angreifen"
		_:
			phase = ""
	var order := tracker.preview(5)
	var order_str := ""
	for u in order:
		order_str += u.abbr + " "
	var who := "%s (%s)" % [active.unit_name, "Spieler" if active.team == "player" else "Gegner"]
	_hud_status.text = "Am Zug: %s   %s\nNächste: %s" % [who, phase, order_str]

func _log(line: String) -> void:
	_log_lines.append(line)
	while _log_lines.size() > 9:
		_log_lines.pop_front()
	if _hud_log != null:
		_hud_log.text = "\n".join(_log_lines)

func _cell_in(cell: Vector2i, arr: Array) -> bool:
	return arr.has(cell)
