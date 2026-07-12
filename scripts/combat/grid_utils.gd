class_name GridUtils
extends RefCounted
## Grid-Mathematik für den Kampf-Prototyp.
## Quadratische Tiles, Manhattan-Distanz (GDD §5.1). Darstellung aktuell
## orthogonal von oben — echte iso-Projektion ist reine Render-Sache und
## kann später über cell_to_world/world_to_cell nachgezogen werden.

const TILE := 64

static func manhattan(a: Vector2i, b: Vector2i) -> int:
	return absi(a.x - b.x) + absi(a.y - b.y)

## Mittelpunkt einer Zelle in Weltkoordinaten (Einheiten sitzen zentriert).
static func cell_to_world(c: Vector2i) -> Vector2:
	return Vector2(c.x * TILE + TILE / 2.0, c.y * TILE + TILE / 2.0)

static func world_to_cell(p: Vector2) -> Vector2i:
	return Vector2i(floori(p.x / float(TILE)), floori(p.y / float(TILE)))

## Rechteck einer Zelle (für Board-Overlays).
static func cell_rect(c: Vector2i) -> Rect2:
	return Rect2(c.x * TILE, c.y * TILE, TILE, TILE)

const STEP_DIRS := [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]
