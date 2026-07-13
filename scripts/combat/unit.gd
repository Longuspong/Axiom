class_name Unit
extends Node2D
## Eine Kampfeinheit. Zeichnet sich prozedural (garantiertes Rendern ohne Sprites).
## Dauerhaft über dem Kopf sichtbar: Name, LP-Balken, Initiative-Balken.
## Mana + alle weiteren Werte erscheinen nur beim Inspizieren (Controller-HUD).
## Angreifbare Ziele tragen zusätzlich ein rotes Ziel-Symbol.

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
var max_mana: int = 100
var mana: int = 100
var initiative: float = 0.0
var grid_pos: Vector2i = Vector2i.ZERO
var targetable: bool = false      # zeigt Ziel-Symbol, wenn angreifbar
var revealed: bool = false        # hat auf Deckung angegriffen → Tarnung beendet (§5.1/§5.2)
var concealed: bool = false       # steht „Scheinbar" auf Deckung (setzt der Controller)
var turns_taken: int = 0          # für den Initiative-Gleichstand („wer noch nicht zog")

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
	max_mana = int(archetype.get("mana", 100))
	mana = max_mana
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

	# Name unter der Einheit (immer sichtbar)
	draw_string(font, Vector2(-44.0, RADIUS + 15.0), unit_name, HORIZONTAL_ALIGNMENT_CENTER,
			88.0, 12, Color(1, 1, 1))

	if is_alive():
		var bar_w := RADIUS * 2.0
		# LP-Balken (immer sichtbar)
		var lp_y := -RADIUS - 16.0
		var lp_frac := float(lp) / float(max_lp) if max_lp > 0 else 0.0
		draw_rect(Rect2(-RADIUS, lp_y, bar_w, 5.0), Color(0, 0, 0, 0.6))
		var lp_col := Color(0.25, 0.85, 0.35) if team == "player" else Color(0.9, 0.45, 0.3)
		draw_rect(Rect2(-RADIUS, lp_y, bar_w * lp_frac, 5.0), lp_col)
		# Initiative-Balken (immer sichtbar, direkt darunter)
		var init_y := -RADIUS - 9.0
		var init_frac := clampf(initiative / 100.0, 0.0, 1.0)
		draw_rect(Rect2(-RADIUS, init_y, bar_w, 3.0), Color(0, 0, 0, 0.6))
		draw_rect(Rect2(-RADIUS, init_y, bar_w * init_frac, 3.0), Color(0.95, 0.8, 0.25))

		# Ziel-Symbol (rotes Dreieck) über dem Kopf, wenn angreifbar
		if targetable:
			var tip_y := -RADIUS - 24.0
			var pts := PackedVector2Array([
				Vector2(-8.0, tip_y - 11.0),
				Vector2(8.0, tip_y - 11.0),
				Vector2(0.0, tip_y),
			])
			draw_colored_polygon(pts, Color(1.0, 0.25, 0.25))
			draw_polyline(PackedVector2Array([pts[0], pts[1], pts[2], pts[0]]),
					Color(0, 0, 0, 0.8), 1.5, true)
