extends Node2D
## Skirmish-Kampfkern (Phase-1-Prototyp, Gefechtstyp „Elimination", GDD §5.1).
##
## Steuerung nach dem EINEN Grid-Cursor-Modell (§10.5, touch-/controller-/maus-fähig):
##   • Wessen Zug ist, bestimmt die Initiative — über der aktiven Einheit öffnet
##     automatisch ein Aktionsmenü (Bewegen / Angriff bzw. Zauber / Warten).
##   • Cursor bewegen: Maus, Pfeiltasten/WASD oder virtueller Joystick (Touch).
##   • Bestätigen: Linksklick · Enter/Leertaste · Button „Bestätigen" (Touch).
##   • Zurück:     Rechtsklick · Esc/Backspace · Button „Zurück" (Touch).
##   • Bewegen = freier Cursor über erreichbare Felder; Angriff = Ziele durchschalten.
##   • R = Gefecht neu starten.

const SETUP_PATH := "res://data/prototype/skirmish_setup.json"

enum State { IDLE, MENU, MOVE, TARGET, GAME_OVER }

var board: Board
var units: Array = []
var tracker := InitiativeTracker.new()
var rng := RandomNumberGenerator.new()

var state: State = State.IDLE
var active: Unit = null
var has_moved := false
var _targets: Array = []
var _target_idx := 0
var _log_lines: Array = []

# UI
var action_menu: ActionMenu = null
var joystick: VirtualJoystick = null
var _hud_status: Label
var _hud_hint: Label
var _hud_hover: Label
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
	_hud_hint = _make_label(layer, Vector2(16, 40), 13, Color(0.82, 0.88, 1.0))
	_hud_hint.text = "Cursor: Maus/Pfeile/Joystick  ·  Bestätigen: Klick/Enter/A  ·  Zurück: Rechtsklick/Esc/B  ·  R: neu"
	_hud_hover = _make_label(layer, Vector2(16, 64), 14, Color(1.0, 0.95, 0.75))

	_hud_log = _make_label(layer, Vector2(16, 640), 14, Color(0.95, 0.95, 0.85))
	_hud_log.size = Vector2(760, 220)

	_hud_banner = _make_label(layer, Vector2(0, 380), 40, Color(1, 1, 0.6))
	_hud_banner.size = Vector2(1600, 80)
	_hud_banner.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_hud_banner.visible = false

	# Touch-Joystick unten links
	joystick = VirtualJoystick.new()
	joystick.position = Vector2(40, 900 - 180 - 40)
	layer.add_child(joystick)

	# Touch-Buttons unten rechts
	var confirm_btn := _make_button(layer, "Bestätigen", Vector2(1436, 720), Vector2(140, 100),
			Color(0.22, 0.5, 0.28))
	confirm_btn.pressed.connect(_confirm)
	var back_btn := _make_button(layer, "Zurück", Vector2(1290, 745), Vector2(130, 75),
			Color(0.4, 0.28, 0.28))
	back_btn.pressed.connect(_back)

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

func _make_button(parent: Node, text: String, pos: Vector2, dim: Vector2, tint: Color) -> Button:
	var b := Button.new()
	b.text = text
	b.focus_mode = Control.FOCUS_NONE
	b.position = pos
	b.custom_minimum_size = dim
	b.size = dim
	b.add_theme_font_size_override("font_size", 18)
	b.add_theme_color_override("bg_color", tint)
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
		board.active_cell = u.grid_pos
		board.cursor_cell = Vector2i(-1, -1)
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
	_reset_ui()

func take_player_turn(u: Unit) -> void:
	has_moved = false
	open_menu(u)
	await turn_finished

func _finish_turn() -> void:
	state = State.IDLE
	_reset_ui()
	turn_finished.emit()

func _reset_ui() -> void:
	if action_menu != null:
		action_menu.visible = false
	if board != null:
		board.move_cells = []
		board.attack_cells = []
		board.cursor_cell = Vector2i(-1, -1)
		board.queue_redraw()
	if _hud_hover != null:
		_hud_hover.text = ""


# --------------------------------------------------------------------------
# Aktionsmenü + Aktionen
# --------------------------------------------------------------------------
func open_menu(u: Unit) -> void:
	state = State.MENU
	board.move_cells = []
	board.attack_cells = []
	board.cursor_cell = Vector2i(-1, -1)
	board.active_cell = u.grid_pos
	board.queue_redraw()

	var can_move := (not has_moved) and not _reachable_cells(u).is_empty()
	var targets := _targets_for(u)
	var is_magic: bool = u.weapon.get("damage_kind", "physisch") == "magisch"
	var acts := [
		{"id": "move", "label": "Bewegen", "glyph": "B", "enabled": can_move},
		{"id": "attack", "label": "Zauber" if is_magic else "Angriff",
			"glyph": "Z" if is_magic else "A", "enabled": not targets.is_empty()},
		{"id": "wait", "label": "Warten", "glyph": "W", "enabled": true},
	]
	if action_menu == null:
		action_menu = ActionMenu.new()
		add_child(action_menu)
	action_menu.visible = true
	action_menu.setup(acts, u.position + Vector2(0, -Unit.RADIUS - 22.0))
	_update_status()

func _activate_action(id: String) -> void:
	match id:
		"move":
			_begin_move()
		"attack":
			_begin_target()
		"wait":
			_finish_turn()

func _begin_move() -> void:
	state = State.MOVE
	if action_menu != null:
		action_menu.visible = false
	board.move_cells = _reachable_cells(active)
	board.attack_cells = []
	board.active_cell = active.grid_pos
	board.cursor_cell = active.grid_pos
	board.queue_redraw()
	_update_status()

func _begin_target() -> void:
	_targets = _targets_for(active)
	if _targets.is_empty():
		open_menu(active)
		return
	state = State.TARGET
	if action_menu != null:
		action_menu.visible = false
	_target_idx = 0
	board.move_cells = []
	board.attack_cells = _targets.map(func(t): return t.grid_pos)
	board.cursor_cell = _targets[0].grid_pos
	board.queue_redraw()
	_update_status()
	_update_hover()


# --------------------------------------------------------------------------
# Vereinheitlichte Eingabe (Cursor / Bestätigen / Zurück)
# --------------------------------------------------------------------------
func _confirm() -> void:
	match state:
		State.MENU:
			if action_menu != null and not action_menu.actions.is_empty():
				var a: Dictionary = action_menu.actions[action_menu.selected]
				if a.get("enabled", true):
					_activate_action(action_menu.current_id())
		State.MOVE:
			if board.cursor_cell == active.grid_pos:
				open_menu(active)
			elif board.move_cells.has(board.cursor_cell):
				active.grid_pos = board.cursor_cell
				active.refresh()
				has_moved = true
				open_menu(active)
		State.TARGET:
			if _target_idx >= 0 and _target_idx < _targets.size():
				var t: Unit = _targets[_target_idx]
				_do_attack(active, t)
				_finish_turn()

func _back() -> void:
	match state:
		State.MOVE, State.TARGET:
			open_menu(active)
		_:
			pass

func _cursor_input(dir: Vector2i) -> void:
	match state:
		State.MENU:
			if dir.x != 0 and action_menu != null:
				action_menu.move_selection(signi(dir.x))
				_update_status()
		State.MOVE:
			var c := board.cursor_cell + dir
			if in_bounds(c):
				board.cursor_cell = c
				board.queue_redraw()
				_update_hover()
		State.TARGET:
			if _targets.is_empty():
				return
			var step := signi(dir.x) if dir.x != 0 else signi(dir.y)
			if step != 0:
				_target_idx = (_target_idx + step + _targets.size()) % _targets.size()
				board.cursor_cell = _targets[_target_idx].grid_pos
				board.queue_redraw()
				_update_hover()

func _mouse_hover(world_pos: Vector2) -> void:
	match state:
		State.MENU:
			if action_menu != null:
				var idx := action_menu.index_at(world_pos)
				if idx >= 0 and action_menu.actions[idx].get("enabled", true):
					action_menu.selected = idx
					action_menu.queue_redraw()
					_update_status()
		State.MOVE:
			var c := GridUtils.world_to_cell(world_pos)
			if in_bounds(c):
				board.cursor_cell = c
				board.queue_redraw()
				_update_hover()
		State.TARGET:
			var c := GridUtils.world_to_cell(world_pos)
			for i in _targets.size():
				if _targets[i].grid_pos == c:
					_target_idx = i
					board.cursor_cell = c
					board.queue_redraw()
					_update_hover()
					break

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
		return
	if state != State.MENU and state != State.MOVE and state != State.TARGET:
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
			KEY_ESCAPE, KEY_BACKSPACE:
				_back()
	elif event is InputEventMouseMotion:
		_mouse_hover(get_global_mouse_position())
	elif event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_mouse_hover(get_global_mouse_position())
			_confirm()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_back()

func _process(delta: float) -> void:
	if joystick == null:
		return
	if state != State.MENU and state != State.MOVE and state != State.TARGET:
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

func _dominant(v: Vector2) -> Vector2i:
	if absf(v.x) >= absf(v.y):
		return Vector2i(int(signf(v.x)), 0)
	return Vector2i(0, int(signf(v.y)))


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
	l.add_theme_color_override("font_color",
			Color(1, 0.85, 0.3) if crit else Color(1, 0.9, 0.9))
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

func _targets_for(u: Unit) -> Array:
	var res: Array = []
	var reach := int(u.weapon.get("range_max", 1))
	for other in units:
		if other.team == u.team or not other.is_alive():
			continue
		if GridUtils.manhattan(u.grid_pos, other.grid_pos) <= reach:
			res.append(other)
	return res


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
	_reset_ui()
	_log(message)
	if _hud_banner != null:
		_hud_banner.text = message + "\n(R = neu starten)"
		_hud_banner.visible = true

func _update_status() -> void:
	if active == null or _hud_status == null:
		return
	var phase := ""
	match state:
		State.MENU:
			phase = "Aktion wählen"
		State.MOVE:
			phase = "Ziel-Feld wählen"
		State.TARGET:
			phase = "Angriffsziel wählen"
	var order := tracker.preview(5)
	var order_str := ""
	for u in order:
		order_str += u.abbr + " "
	var who := "%s (%s)" % [active.unit_name, "Spieler" if active.team == "player" else "Gegner"]
	_hud_status.text = "Am Zug: %s   ·   %s\nNächste: %s" % [who, phase, order_str]

func _update_hover() -> void:
	if _hud_hover == null:
		return
	var u := unit_at(board.cursor_cell)
	if u != null:
		_hud_hover.text = "%s   LP %d/%d   Speed %.1f   MOB %d   %s" % [
			u.unit_name, u.lp, u.max_lp, u.speed, u.mob, u.weapon.get("name", "")]
	else:
		_hud_hover.text = ""

func _log(line: String) -> void:
	_log_lines.append(line)
	while _log_lines.size() > 9:
		_log_lines.pop_front()
	if _hud_log != null:
		_hud_log.text = "\n".join(_log_lines)
