@tool
extends Node2D
## Demo-Szene: baut eine Beispielkarte aus dem Terrain-TileSet auf.
## Dient als Referenz-Implementierung für die Tile-Auswahl:
## Verbindungsmasken für Fluss/Strasse, Ufer-Übergänge für Seen.
##
## Karten-Zeichen:
##   .  Gras (automatische Varianten)    F  Blumenwiese
##   D  Acker                            r  Fluss (Auto-Verbindung)
##   R  Strasse (Auto-Verbindung)        W  See (Auto-Ufer)
##   M  Berg    C  Klippe/Plateau        B  dichtes Gestrüpp
##   T  Laubbaum    P  Nadelbaum         O  Findling

const MAP: Array[String] = [
	"MMMM..........r.....",
	"MMC....T......r..P..",
	"MC..F...BB....r.....",
	"C......T......r...T.",
	"..T..FF.......r.....",
	"...........O..rr....",
	"RRRRRRRRRRRRR..r...P",
	"...T........R..r.B..",
	".....BB.....R..r....",
	".P..........R..r....",
	"............R..rWWW.",
	"..DDD.......R...WWWW",
	"..DDD..T....R...WWWW",
	"..DDD.......R...WWW.",
	"............R.......",
	"............RRRRRRRR",
]

const DIRS := {"N": Vector2i(0, -1), "E": Vector2i(1, 0), "S": Vector2i(0, 1), "W": Vector2i(-1, 0)}
const DIAGS := {"NE": Vector2i(1, -1), "SE": Vector2i(1, 1), "SW": Vector2i(-1, 1), "NW": Vector2i(-1, -1)}
const BITS := {"N": 1, "E": 2, "S": 4, "W": 8}
const OPPOSITE := {"N": "S", "S": "N", "E": "W", "W": "E"}

const LAKE_EDGE := {"N": TileIds.LAKE_EDGE_N, "E": TileIds.LAKE_EDGE_E,
		"S": TileIds.LAKE_EDGE_S, "W": TileIds.LAKE_EDGE_W}
const LAKE_OUT := {"NE": TileIds.LAKE_OUT_NE, "SE": TileIds.LAKE_OUT_SE,
		"SW": TileIds.LAKE_OUT_SW, "NW": TileIds.LAKE_OUT_NW}
const LAKE_IN := {"NE": TileIds.LAKE_IN_NE, "SE": TileIds.LAKE_IN_SE,
		"SW": TileIds.LAKE_IN_SW, "NW": TileIds.LAKE_IN_NW}

@onready var ground: TileMapLayer = $Ground
@onready var props: TileMapLayer = $Props


func _ready() -> void:
	build_map()


func build_map() -> void:
	ground.clear()
	props.clear()
	for y in MAP.size():
		for x in MAP[y].length():
			_place(x, y, MAP[y][x])


func _place(x: int, y: int, c: String) -> void:
	var pos := Vector2i(x, y)
	match c:
		".":
			ground.set_cell(pos, TileIds.GROUND_SRC, _grass_variant(x, y))
		"F":
			ground.set_cell(pos, TileIds.GROUND_SRC,
					TileIds.GRASS_FLOWERS_A if _cell_hash(x, y) % 2 == 0 else TileIds.GRASS_FLOWERS_B)
		"D":
			ground.set_cell(pos, TileIds.GROUND_SRC, TileIds.FIELD)
		"r":
			ground.set_cell(pos, TileIds.GROUND_SRC, TileIds.RIVER[_conn_mask(x, y, "rW")])
		"R":
			ground.set_cell(pos, TileIds.GROUND_SRC, TileIds.ROAD[_conn_mask(x, y, "R")])
		"W":
			ground.set_cell(pos, TileIds.GROUND_SRC, _lake_tile(x, y))
		"M":
			ground.set_cell(pos, TileIds.TALL_SRC,
					TileIds.MOUNTAIN_A if _cell_hash(x, y) % 2 == 0 else TileIds.MOUNTAIN_SNOW)
		"C":
			ground.set_cell(pos, TileIds.TALL_SRC, TileIds.CLIFF)
		"B":
			ground.set_cell(pos, TileIds.TALL_SRC,
					TileIds.SCRUB_A if _cell_hash(x, y) % 2 == 0 else TileIds.SCRUB_B)
		"T":
			ground.set_cell(pos, TileIds.GROUND_SRC, _grass_variant(x, y))
			props.set_cell(pos, TileIds.TALL_SRC, TileIds.TREE_ROUND)
		"P":
			ground.set_cell(pos, TileIds.GROUND_SRC, _grass_variant(x, y))
			props.set_cell(pos, TileIds.TALL_SRC, TileIds.TREE_PINE)
		"O":
			ground.set_cell(pos, TileIds.GROUND_SRC, _grass_variant(x, y))
			props.set_cell(pos, TileIds.TALL_SRC, TileIds.BOULDER)


func _grass_variant(x: int, y: int) -> Vector2i:
	return TileIds.GRASS_A if _cell_hash(x, y) % 5 != 0 else TileIds.GRASS_B


func _cell_at(x: int, y: int, default: String) -> String:
	if y >= 0 and y < MAP.size() and x >= 0 and x < MAP[y].length():
		return MAP[y][x]
	return default


func _is_water(c: String) -> bool:
	return c == "r" or c == "W"


## Bitmaske der verbundenen Nachbarn (N=1, E=2, S=4, W=8).
## Am Kartenrand wird nur geradeaus weitergeführt (kein Stich-Arm zum Rand).
func _conn_mask(x: int, y: int, chars: String) -> int:
	var mask := 0
	var offmap: Array[String] = []
	for side: String in DIRS:
		var d: Vector2i = DIRS[side]
		var c := _cell_at(x + d.x, y + d.y, "")
		if c == "":
			offmap.append(side)
		elif chars.contains(c):
			mask |= BITS[side]
	for side in offmap:
		if mask & BITS[OPPOSITE[side]]:
			mask |= BITS[side]
	return mask


## Wählt das passende See-Tile anhand der Land-Nachbarn
## (Kante / Aussenecke / Innenecke / offenes Wasser).
func _lake_tile(x: int, y: int) -> Vector2i:
	var land: Array[String] = []
	for side: String in DIRS:
		var d: Vector2i = DIRS[side]
		if not _is_water(_cell_at(x + d.x, y + d.y, "W")):
			land.append(side)
	if land.size() == 1:
		return LAKE_EDGE[land[0]]
	if land.size() == 2:
		for corner: String in LAKE_OUT:
			if land.has(corner[0]) and land.has(corner[1]):
				return LAKE_OUT[corner]
		return TileIds.WATER_FULL  # gegenüberliegende Ufer: besser Fluss-Tiles nutzen
	if land.is_empty():
		for corner: String in DIAGS:
			var d: Vector2i = DIAGS[corner]
			if not _is_water(_cell_at(x + d.x, y + d.y, "W")):
				return LAKE_IN[corner]
		return TileIds.WATER_FULL
	return TileIds.WATER_FULL


func _cell_hash(x: int, y: int) -> int:
	return ((x * 73856093) ^ (y * 19349663)) & 0xFFFF
