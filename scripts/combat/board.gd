class_name Board
extends Node2D
## Darstellungsschicht des Kampf-Grids (GDD §5.1: Trennung Funktions-/
## Darstellungsschicht). Rendert die Funktionstypen isometrisch mit dem
## Terrain-Tileset (assets/tiles/terrain_tileset.tres) und zeichnet die
## Overlays (Bewegungs-/Angriffsreichweite, aktive Zelle, Cursor) als
## Iso-Rauten darüber. Der Controller setzt die Highlight-Listen und ruft
## queue_redraw(); die TileMapLayer liegen auf z_index < 0, damit die
## Overlays (eigenes _draw) über den Tiles landen.
##
## Tileset v1 hat noch keine eigenen Kacheln für Blockade/Deckung/Effekt
## (docs/TILESET.md) — Platzhalter-Zuordnung: Blockade = Findling,
## Deckung = Laubbaum, Effekt-Feld = Blumenwiese.

const TILESET := preload("res://assets/tiles/terrain_tileset.tres")

var grid_size := Vector2i(12, 12)
var terrain: Terrain = null
var move_cells: Array = []
var attack_cells: Array = []
var active_cell := Vector2i(-1, -1)
var cursor_cell := Vector2i(-1, -1)

var _ground: TileMapLayer
var _props: TileMapLayer

const BITS := {
	Vector2i(0, -1): 1, Vector2i(1, 0): 2, Vector2i(0, 1): 4, Vector2i(-1, 0): 8,
}


## Baut die Tile-Darstellung auf — aufrufen, nachdem terrain gesetzt ist.
func build() -> void:
	_ground = TileMapLayer.new()
	_ground.tile_set = TILESET
	_ground.z_index = -10
	add_child(_ground)
	_props = TileMapLayer.new()
	_props.tile_set = TILESET
	_props.y_sort_enabled = true
	_props.z_index = -9
	add_child(_props)
	GridUtils.iso_layer = _ground
	for y in grid_size.y:
		for x in grid_size.x:
			_set_tile(Vector2i(x, y))
	queue_redraw()


## Zelle neu rendern, wenn sich ihr Funktionstyp ändert (Blockade → Boden).
## Nachbarn mitziehen, damit Fluss-/Pfad-Verbindungsmasken stimmen.
func rebuild_cell(c: Vector2i) -> void:
	_set_tile(c)
	for d in GridUtils.STEP_DIRS:
		var n: Vector2i = c + d
		if n.x >= 0 and n.y >= 0 and n.x < grid_size.x and n.y < grid_size.y:
			_set_tile(n)
	queue_redraw()


# --------------------------------------------------------------------------
# Funktionstyp → Tile (Darstellungsschicht)
# --------------------------------------------------------------------------
func _set_tile(c: Vector2i) -> void:
	_props.erase_cell(c)
	var ftype := terrain.type_at(c) if terrain != null else "boden"
	match ftype:
		"pfad":
			if _ford_axis(c) == "ew":
				_ground.set_cell(c, TileIds.GROUND_SRC, TileIds.FORD_EW)
			elif _ford_axis(c) == "ns":
				_ground.set_cell(c, TileIds.GROUND_SRC, TileIds.FORD_NS)
			else:
				_ground.set_cell(c, TileIds.GROUND_SRC, TileIds.ROAD[_conn_mask(c, "pfad")])
		"fluss":
			_ground.set_cell(c, TileIds.GROUND_SRC, TileIds.RIVER[_conn_mask(c, "fluss")])
		"dickicht":
			_ground.set_cell(c, TileIds.TALL_SRC,
					TileIds.SCRUB_A if _cell_hash(c) % 2 == 0 else TileIds.SCRUB_B)
		"barriere":
			_ground.set_cell(c, TileIds.TALL_SRC,
					TileIds.CLIFF if _cell_hash(c) % 3 != 0 else TileIds.MOUNTAIN_A)
		"blockade":
			_ground.set_cell(c, TileIds.GROUND_SRC, _grass(c))
			_props.set_cell(c, TileIds.TALL_SRC, TileIds.BOULDER)
		"deckung":
			_ground.set_cell(c, TileIds.GROUND_SRC, _grass(c))
			_props.set_cell(c, TileIds.TALL_SRC, TileIds.TREE_ROUND)
		"effekt":
			_ground.set_cell(c, TileIds.GROUND_SRC,
					TileIds.GRASS_FLOWERS_A if _cell_hash(c) % 2 == 0 else TileIds.GRASS_FLOWERS_B)
		_:
			_ground.set_cell(c, TileIds.GROUND_SRC, _grass(c))


func _grass(c: Vector2i) -> Vector2i:
	return TileIds.GRASS_A if _cell_hash(c) % 5 != 0 else TileIds.GRASS_B


func _cell_hash(c: Vector2i) -> int:
	return ((c.x * 73856093) ^ (c.y * 19349663)) & 0xFFFF


## Furt = Pfad-Feld mitten im Fluss (§5.1-Map): Wasser auf gegenüberliegenden
## Seiten. Rückgabe "ew"/"ns" = Richtung des begehbaren Decks, "" = keine Furt.
func _ford_axis(c: Vector2i) -> String:
	if terrain == null or terrain.type_at(c) != "pfad":
		return ""
	if terrain.type_at(c + Vector2i(0, -1)) == "fluss" \
			and terrain.type_at(c + Vector2i(0, 1)) == "fluss":
		return "ew"
	if terrain.type_at(c + Vector2i(-1, 0)) == "fluss" \
			and terrain.type_at(c + Vector2i(1, 0)) == "fluss":
		return "ns"
	return ""


## Bitmaske der verbundenen Nachbarn (N=1, E=2, S=4, W=8) für Fluss/Pfad.
## Fluss verbindet auch durch die Furt hindurch (das Wasser fließt weiter).
func _conn_mask(c: Vector2i, kind: String) -> int:
	var mask := 0
	for d: Vector2i in BITS:
		var n: Vector2i = c + d
		var t := terrain.type_at(n)
		if t == kind or (kind == "fluss" and _ford_axis(n) != ""):
			mask |= BITS[d]
	return mask


# --------------------------------------------------------------------------
# Overlays (über den Tiles, unter den Einheiten)
# --------------------------------------------------------------------------
func _draw() -> void:
	# Dezentes Zellraster fürs Grid-Gefühl auf den Iso-Tiles.
	for y in grid_size.y:
		for x in grid_size.x:
			_draw_diamond_outline(Vector2i(x, y), Color(0, 0, 0, 0.10), 1.0)

	for c in move_cells:
		draw_colored_polygon(GridUtils.cell_polygon(c, 3.0), Color(0.30, 0.60, 1.0, 0.35))
	for c in attack_cells:
		draw_colored_polygon(GridUtils.cell_polygon(c, 3.0), Color(1.0, 0.30, 0.30, 0.40))

	if active_cell.x >= 0:
		_draw_diamond_outline(active_cell, Color(1.0, 0.90, 0.30), 3.0)

	# Cursor liegt über allem (heller, dicker Rahmen).
	if cursor_cell.x >= 0:
		_draw_diamond_outline(cursor_cell, Color(1.0, 1.0, 1.0, 0.95), 4.0, 5.0)

	if terrain != null:
		for c in terrain.blockade_lp.keys():
			_draw_blockade_lp(c)


func _draw_diamond_outline(c: Vector2i, col: Color, width: float, inset := 0.0) -> void:
	var pts := GridUtils.cell_polygon(c, inset)
	pts.append(pts[0])
	draw_polyline(pts, col, width, true)


func _draw_blockade_lp(c: Vector2i) -> void:
	var lp := int(terrain.blockade_lp.get(c, terrain.blockade_max_lp))
	var frac := clampf(float(lp) / float(terrain.blockade_max_lp), 0.0, 1.0)
	if frac >= 1.0:
		return
	var ctr := GridUtils.cell_to_world(c)
	var bar := Rect2(ctr + Vector2(-24, -52), Vector2(48, 5))
	draw_rect(bar, Color(0, 0, 0, 0.6))
	draw_rect(Rect2(bar.position, Vector2(bar.size.x * frac, bar.size.y)),
			Color(0.9, 0.6, 0.2))
