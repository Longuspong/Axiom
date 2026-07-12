class_name ActionMenu
extends Node2D
## Schwebendes Aktionsmenü über einer Einheit: eine Reihe Symbol-Chips
## (Bewegen / Angriff bzw. Zauber / Warten). Auswahl per Cursor (Joystick/Tasten)
## oder direkt per Maus/Touch. position = Ankerpunkt (Weltkoordinate über der Einheit).

const CHIP_W := 58.0
const CHIP_H := 58.0
const GAP := 8.0

var actions: Array = []      # [{ id, label, glyph, enabled }]
var selected := 0

func setup(p_actions: Array, anchor_world: Vector2) -> void:
	actions = p_actions
	selected = _first_enabled()
	position = anchor_world
	queue_redraw()

func _first_enabled() -> int:
	for i in actions.size():
		if actions[i].get("enabled", true):
			return i
	return 0

func move_selection(step: int) -> void:
	if actions.is_empty() or step == 0:
		return
	var i := selected
	for _n in actions.size():
		i = (i + step + actions.size()) % actions.size()
		if actions[i].get("enabled", true):
			selected = i
			queue_redraw()
			return

func current_id() -> String:
	if selected >= 0 and selected < actions.size():
		return actions[selected].get("id", "")
	return ""

func _total_width() -> float:
	var n := actions.size()
	return n * CHIP_W + max(0, n - 1) * GAP

func chip_rect(i: int) -> Rect2:
	var start_x := -_total_width() / 2.0
	return Rect2(start_x + i * (CHIP_W + GAP), -CHIP_H, CHIP_W, CHIP_H)

func index_at(world_pos: Vector2) -> int:
	var local := world_pos - position
	for i in actions.size():
		if chip_rect(i).has_point(local):
			return i
	return -1

func _draw() -> void:
	var font := ThemeDB.fallback_font
	for i in actions.size():
		var r := chip_rect(i)
		var a: Dictionary = actions[i]
		var enabled: bool = a.get("enabled", true)
		var bg := Color(0.14, 0.16, 0.21, 0.94)
		if not enabled:
			bg = Color(0.11, 0.11, 0.13, 0.75)
		elif i == selected:
			bg = Color(0.22, 0.48, 0.88, 0.96)
		draw_rect(r, bg)
		draw_rect(r, Color(0, 0, 0, 0.65), false, 2.0)
		var fg := Color.WHITE if enabled else Color(0.55, 0.55, 0.55)
		draw_string(font, r.position + Vector2(0, r.size.y * 0.55), a.get("glyph", "?"),
				HORIZONTAL_ALIGNMENT_CENTER, r.size.x, 26, fg)
		draw_string(font, r.position + Vector2(0, r.size.y - 6.0), a.get("label", ""),
				HORIZONTAL_ALIGNMENT_CENTER, r.size.x, 11, fg)
