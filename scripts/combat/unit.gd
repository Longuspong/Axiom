class_name Unit
extends Node2D
## Eine Kampfeinheit. Hält Werte + zeichnet sich selbst (prozedural, damit der
## Prototyp ohne Sprite-Importe garantiert rendert). Farbe = Team (CLAUDE.md).

const RADIUS := 22.0
const COL_PLAYER := Color(0.29, 0.56, 0.89)
const COL_ENEMY := Color(0.89, 0.29, 0.29)

var unit_name: String = ""
var abbr: String = "?"
var team: String = "player"      # "player" | "enemy"
var stats: Dictionary = {}        # STR, GES, WIL, INT, VIT, WID
var defense: Dictionary = {}      # ruestung, resistenz, diffusion, WID
var weapon: Dictionary = {}
var mob: int = 3
var speed: float = 1.0
var max_lp: int = 1
var lp: int = 1
var initiative: float = 0.0
var grid_pos: Vector2i = Vector2i.ZERO

func setup(p_team: String, archetype: Dictionary, weapon_data: Dictionary, cell: Vector2i) -> void:
	team = p_team
	unit_name = archetype.get("name", "Einheit")
	abbr = archetype.get("abbr", "?")
	mob = int(archetype.get("mob", 3))
	speed = float(archetype.get("speed", 1.0))
	stats = (archetype.get("attributes", {}) as Dictionary).duplicate()
	defense = (archetype.get("defense", {}) as Dictionary).duplicate()
	defense["WID"] = stats.get("WID", 0)
	weapon = weapon_data.duplicate()
	max_lp = int(stats.get("VIT", 1)) * 6
	lp = max_lp
	grid_pos = cell
	refresh()

func is_alive() -> bool:
	return lp > 0

func take_damage(amount: int) -> void:
	lp = max(0, lp - amount)
	queue_redraw()

func refresh() -> void:
	position = GridUtils.cell_to_world(grid_pos)
	queue_redraw()

func _draw() -> void:
	var col := COL_PLAYER if team == "player" else COL_ENEMY
	if not is_alive():
		col = col.darkened(0.6)
	draw_circle(Vector2.ZERO, RADIUS, col)
	draw_arc(Vector2.ZERO, RADIUS, 0.0, TAU, 32, Color(0, 0, 0, 0.9), 2.0, true)

	var font := ThemeDB.fallback_font
	draw_string(font, Vector2(-RADIUS, 5.0), abbr, HORIZONTAL_ALIGNMENT_CENTER,
			RADIUS * 2.0, 13, Color.WHITE)

	# LP-Balken über der Einheit
	if is_alive():
		var bar_w := RADIUS * 2.0
		var frac := float(lp) / float(max_lp) if max_lp > 0 else 0.0
		var bar_y := -RADIUS - 10.0
		draw_rect(Rect2(-RADIUS, bar_y, bar_w, 5.0), Color(0, 0, 0, 0.6))
		var fill := Color(0.25, 0.85, 0.35) if team == "player" else Color(0.9, 0.45, 0.3)
		draw_rect(Rect2(-RADIUS, bar_y, bar_w * frac, 5.0), fill)
