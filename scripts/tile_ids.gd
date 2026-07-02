## Automatisch generiert von tools/generate_tileset.py — nicht von Hand editieren.
## Atlas-Koordinaten aller Terrain-Tiles + Verbindungsmasken (N=1, E=2, S=4, W=8).
class_name TileIds

const GROUND_SRC := 0
const TALL_SRC := 1

const GRASS_A := Vector2i(0, 0)
const GRASS_B := Vector2i(1, 0)
const GRASS_FLOWERS_A := Vector2i(2, 0)
const GRASS_FLOWERS_B := Vector2i(3, 0)
const SAND_A := Vector2i(4, 0)
const SAND_B := Vector2i(5, 0)
const DIRT := Vector2i(6, 0)
const FIELD := Vector2i(7, 0)
const LAKE_EDGE_N := Vector2i(0, 5)
const LAKE_EDGE_E := Vector2i(1, 5)
const LAKE_EDGE_S := Vector2i(2, 5)
const LAKE_EDGE_W := Vector2i(3, 5)
const LAKE_OUT_NE := Vector2i(4, 5)
const LAKE_OUT_SE := Vector2i(5, 5)
const LAKE_OUT_SW := Vector2i(6, 5)
const LAKE_OUT_NW := Vector2i(7, 5)
const LAKE_IN_NE := Vector2i(0, 6)
const LAKE_IN_SE := Vector2i(1, 6)
const LAKE_IN_SW := Vector2i(2, 6)
const LAKE_IN_NW := Vector2i(3, 6)
const WATER_FULL := Vector2i(4, 6)
const WATER_DEEP := Vector2i(5, 6)
const WATER_LILY := Vector2i(6, 6)
const WATER_ROCKS := Vector2i(7, 6)
const MOUNTAIN_A := Vector2i(0, 0)
const MOUNTAIN_SNOW := Vector2i(1, 0)
const CLIFF := Vector2i(2, 0)
const BOULDER := Vector2i(3, 0)
const SCRUB_A := Vector2i(0, 1)
const SCRUB_B := Vector2i(1, 1)
const TREE_ROUND := Vector2i(2, 1)
const TREE_PINE := Vector2i(3, 1)

## Index = Bitmaske der Verbindungen (N=1, E=2, S=4, W=8)
const RIVER: Array[Vector2i] = [
	Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(5, 1), Vector2i(6, 1), Vector2i(7, 1), Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2), Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(7, 2),
]
const ROAD: Array[Vector2i] = [
	Vector2i(0, 3), Vector2i(1, 3), Vector2i(2, 3), Vector2i(3, 3), Vector2i(4, 3), Vector2i(5, 3), Vector2i(6, 3), Vector2i(7, 3), Vector2i(0, 4), Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(7, 4),
]
