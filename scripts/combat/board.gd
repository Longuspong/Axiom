class_name Board
extends Node2D
## Zeichnet das Kampf-Grid + Overlays (Bewegungs-/Angriffsreichweite, aktive Zelle).
## Die Funktionsschicht (Terrain, GDD §5.1) wird prozedural eingefärbt —
## Platzhalter-Optik, echte Region-Tiles (Darstellungsschicht) folgen später.
## Der Controller setzt die Highlight-Listen und ruft queue_redraw().

var grid_size := Vector2i(12, 12)
var terrain: Terrain = null
var move_cells: Array = []
var attack_cells: Array = []
var active_cell := Vector2i(-1, -1)
var cursor_cell := Vector2i(-1, -1)


func _draw() -> void:
	for y in grid_size.y:
		for x in grid_size.x:
			_draw_cell(Vector2i(x, y))

	for c in move_cells:
		draw_rect(GridUtils.cell_rect(c), Color(0.30, 0.60, 1.0, 0.35))
	for c in attack_cells:
		draw_rect(GridUtils.cell_rect(c), Color(1.0, 0.30, 0.30, 0.40))

	if active_cell.x >= 0:
		draw_rect(GridUtils.cell_rect(active_cell), Color(1.0, 0.90, 0.30), false, 3.0)

	# Cursor liegt über allem (heller, dicker Rahmen).
	if cursor_cell.x >= 0:
		var cr := GridUtils.cell_rect(cursor_cell).grow(-2.0)
		draw_rect(cr, Color(1.0, 1.0, 1.0, 0.95), false, 4.0)


func _draw_cell(c: Vector2i) -> void:
	var r := GridUtils.cell_rect(c)
	var checker := (c.x + c.y) % 2 == 0
	var ftype := terrain.type_at(c) if terrain != null else "boden"
	match ftype:
		"dickicht":
			draw_rect(r, Color(0.24, 0.40, 0.22) if checker else Color(0.27, 0.44, 0.24))
			for i in 3:
				var p := r.position + Vector2(12 + i * 16, 44 - (i % 2) * 14)
				draw_circle(p, 6.0, Color(0.16, 0.30, 0.15))
		"pfad":
			draw_rect(r, Color(0.62, 0.52, 0.36) if checker else Color(0.66, 0.56, 0.39))
		"fluss":
			draw_rect(r, Color(0.25, 0.45, 0.75) if checker else Color(0.28, 0.49, 0.80))
			for i in 2:
				var y := r.position.y + 20.0 + i * 22.0
				draw_line(Vector2(r.position.x + 8, y), Vector2(r.position.x + 30, y),
						Color(0.75, 0.87, 1.0, 0.6), 2.0)
		"barriere":
			draw_rect(r, Color(0.36, 0.35, 0.34) if checker else Color(0.40, 0.39, 0.37))
			draw_circle(r.get_center() + Vector2(-8, 6), 13.0, Color(0.28, 0.27, 0.26))
			draw_circle(r.get_center() + Vector2(10, -6), 9.0, Color(0.31, 0.30, 0.29))
		"blockade":
			draw_rect(r, Color(0.45, 0.33, 0.20) if checker else Color(0.49, 0.36, 0.22))
			draw_line(r.position + Vector2(10, 10), r.end - Vector2(10, 10),
					Color(0.30, 0.21, 0.12), 6.0)
			draw_line(Vector2(r.end.x - 10, r.position.y + 10),
					Vector2(r.position.x + 10, r.end.y - 10), Color(0.30, 0.21, 0.12), 6.0)
			_draw_blockade_lp(c, r)
		"deckung":
			draw_rect(r, Color(0.30, 0.55, 0.28) if checker else Color(0.33, 0.59, 0.30))
			for i in 4:
				var bx := r.position.x + 10.0 + i * 12.0
				draw_line(Vector2(bx, r.end.y - 10), Vector2(bx + 4, r.position.y + 22),
						Color(0.20, 0.42, 0.18), 2.5)
		"effekt":
			draw_rect(r, Color(0.45, 0.38, 0.55) if checker else Color(0.49, 0.42, 0.59))
			draw_arc(r.get_center(), 14.0, 0.0, TAU, 24, Color(0.85, 0.75, 1.0, 0.8), 2.0)
		_:
			draw_rect(r, Color(0.36, 0.52, 0.31) if checker else Color(0.41, 0.58, 0.35))
	draw_rect(r, Color(0, 0, 0, 0.15), false, 1.0)


func _draw_blockade_lp(c: Vector2i, r: Rect2) -> void:
	if terrain == null:
		return
	var lp := int(terrain.blockade_lp.get(c, terrain.blockade_max_lp))
	var frac := clampf(float(lp) / float(terrain.blockade_max_lp), 0.0, 1.0)
	if frac >= 1.0:
		return
	var bar := Rect2(r.position + Vector2(8, 4), Vector2(r.size.x - 16, 5))
	draw_rect(bar, Color(0, 0, 0, 0.6))
	draw_rect(Rect2(bar.position, Vector2(bar.size.x * frac, bar.size.y)),
			Color(0.9, 0.6, 0.2))
