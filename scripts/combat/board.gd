class_name Board
extends Node2D
## Zeichnet das Kampf-Grid + Overlays (Bewegungs-/Angriffsreichweite, aktive Zelle).
## Der Controller setzt die Highlight-Listen und ruft queue_redraw().

var grid_size := Vector2i(12, 12)
var move_cells: Array = []
var attack_cells: Array = []
var active_cell := Vector2i(-1, -1)

func _draw() -> void:
	for y in grid_size.y:
		for x in grid_size.x:
			var r := GridUtils.cell_rect(Vector2i(x, y))
			var base := Color(0.36, 0.52, 0.31) if (x + y) % 2 == 0 else Color(0.41, 0.58, 0.35)
			draw_rect(r, base)
			draw_rect(r, Color(0, 0, 0, 0.15), false, 1.0)

	for c in move_cells:
		draw_rect(GridUtils.cell_rect(c), Color(0.30, 0.60, 1.0, 0.35))
	for c in attack_cells:
		draw_rect(GridUtils.cell_rect(c), Color(1.0, 0.30, 0.30, 0.40))

	if active_cell.x >= 0:
		draw_rect(GridUtils.cell_rect(active_cell), Color(1.0, 0.90, 0.30), false, 3.0)
