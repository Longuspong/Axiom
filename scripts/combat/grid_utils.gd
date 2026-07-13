class_name GridUtils
extends RefCounted
## Grid-Mathematik für den Kampf-Prototyp.
## Logik: quadratische Tiles, Manhattan-Distanz (GDD §5.1).
## Darstellung: isometrisch (2:1-Raute, 128×64, Diamond Down — wie das
## Terrain-Tileset). Die Umrechnung Zelle↔Welt läuft über die vom Board
## registrierte TileMapLayer (`iso_layer`); die manuelle Formel ist nur
## Fallback, falls noch keine Darstellungsschicht existiert.

const TILE_W := 128
const TILE_H := 64

## Ground-Layer der Darstellungsschicht — setzt Board.build().
static var iso_layer: TileMapLayer = null

static func manhattan(a: Vector2i, b: Vector2i) -> int:
	return absi(a.x - b.x) + absi(a.y - b.y)

## Mittelpunkt einer Zelle in Weltkoordinaten (Einheiten sitzen zentriert).
static func cell_to_world(c: Vector2i) -> Vector2:
	if is_instance_valid(iso_layer):
		return iso_layer.to_global(iso_layer.map_to_local(c))
	return Vector2((c.x - c.y) * TILE_W / 2.0, (c.x + c.y + 1) * TILE_H / 2.0)

static func world_to_cell(p: Vector2) -> Vector2i:
	if is_instance_valid(iso_layer):
		return iso_layer.local_to_map(iso_layer.to_local(p))
	var fx := p.x / float(TILE_W)
	var fy := p.y / float(TILE_H) - 0.5
	return Vector2i(roundi(fy + fx), roundi(fy - fx))

## Eckpunkte der Iso-Raute einer Zelle (für Overlay-Zeichnung).
## inset > 0 verkleinert die Raute (z. B. für den Cursor-Rahmen).
static func cell_polygon(c: Vector2i, inset := 0.0) -> PackedVector2Array:
	var ctr := cell_to_world(c)
	var hw := TILE_W / 2.0 - inset
	var hh := TILE_H / 2.0 - inset * 0.5
	return PackedVector2Array([
		ctr + Vector2(0, -hh), ctr + Vector2(hw, 0),
		ctr + Vector2(0, hh), ctr + Vector2(-hw, 0),
	])

const STEP_DIRS := [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]
