class_name Terrain
extends RefCounted
## Funktionsschicht der Map — die 8 Gelände-/Feld-Funktionstypen aus GDD §5.1.
## Liest die "terrain"-Zeilen aus dem Setup-JSON (Legende + Zeichen-Zeilen) und
## beantwortet Begehbarkeit, Bewegungskosten (Float, BP-Budget §5.1), Tarnung
## (Deckung → „Scheinbar" §5.2) und Zerstörbarkeit (Blockade → wird Boden).
##
## Effekt-Felder (Typ 7) sind hier bewusst noch NICHT verdrahtet — ihr
## Nutzlast-Katalog (effect_id, §9.6/§5.2) ist laut §11 noch offen.

const FIELD_TYPES := {
	"boden": {"walkable": true, "cost": 1.0, "conceals": false, "destructible": false},
	"dickicht": {"walkable": true, "cost": 1.5, "conceals": false, "destructible": false},
	"pfad": {"walkable": true, "cost": 0.5, "conceals": false, "destructible": false},
	"fluss": {"walkable": false, "cost": -1.0, "conceals": false, "destructible": false},
	"barriere": {"walkable": false, "cost": -1.0, "conceals": false, "destructible": false},
	"blockade": {"walkable": false, "cost": -1.0, "conceals": false, "destructible": true},
	"effekt": {"walkable": true, "cost": 1.0, "conceals": false, "destructible": false},
	"deckung": {"walkable": true, "cost": 1.0, "conceals": true, "destructible": false},
}

const LABELS := {
	"boden": "Boden", "dickicht": "Dickicht", "pfad": "Pfad", "fluss": "Fluss",
	"barriere": "Barriere", "blockade": "Blockade", "effekt": "Effekt-Feld",
	"deckung": "Deckung",
}

var size := Vector2i.ZERO
var cells: Array = []             # Array[Array[String]] — Funktionstyp je Zelle
var blockade_lp: Dictionary = {}  # Vector2i → verbleibende LP
var blockade_max_lp: int = 30


func setup(terrain_data: Dictionary, grid_size: Vector2i) -> void:
	size = grid_size
	blockade_max_lp = int(terrain_data.get("blockade_lp", 30))
	var legend: Dictionary = terrain_data.get("legend", {})
	var rows: Array = terrain_data.get("rows", [])
	cells = []
	for y in size.y:
		var row: Array = []
		var line: String = str(rows[y]) if y < rows.size() else ""
		for x in size.x:
			var ch := line[x] if x < line.length() else "."
			var ftype: String = str(legend.get(ch, "boden"))
			if not FIELD_TYPES.has(ftype):
				ftype = "boden"
			row.append(ftype)
			if ftype == "blockade":
				blockade_lp[Vector2i(x, y)] = blockade_max_lp
		cells.append(row)


func type_at(c: Vector2i) -> String:
	if c.x < 0 or c.y < 0 or c.x >= size.x or c.y >= size.y:
		return "barriere"
	return cells[c.y][c.x]


func walkable(c: Vector2i) -> bool:
	return bool(FIELD_TYPES[type_at(c)].walkable)


func cost(c: Vector2i) -> float:
	return float(FIELD_TYPES[type_at(c)].cost)


func conceals(c: Vector2i) -> bool:
	return bool(FIELD_TYPES[type_at(c)].conceals)


func is_blockade(c: Vector2i) -> bool:
	return type_at(c) == "blockade"


## Fügt einer Blockade Schaden zu. Gibt true zurück, wenn sie zerstört wurde —
## das Feld wird dann zu Boden (begehbar, Kosten 1,0; GDD §5.1 Typ 6).
func damage_blockade(c: Vector2i, amount: int) -> bool:
	if not is_blockade(c):
		return false
	var lp := int(blockade_lp.get(c, blockade_max_lp)) - amount
	if lp <= 0:
		blockade_lp.erase(c)
		cells[c.y][c.x] = "boden"
		return true
	blockade_lp[c] = lp
	return false
