class_name CombatFormulas
extends RefCounted
## Schadensformeln des Prototyps — direkt aus GDD §5.2 abgeleitet.
## Bewusst zentral & rein, damit Playtest-Anpassungen an EINER Stelle passieren.
##
## Rohschaden:
##   Nahkampf physisch : STR(Einheit) + STR(Waffe)
##   Magisch (Nah/Fern): WIL(Einheit) + WIL(Waffe)   (reichweitenunabhängig, kein Falloff)
##   Fernkampf physisch: GES_gesamt * 0,75 + STR_gesamt * 0,25
##
## Reduktion pro Treffer (Reihenfolge: erst Flat, dann WID-%):
##   1) Flat-Abzug (Rüstung/Resistenz/Elementardiffusion), gesenkt um RD %
##   2) WID prozentual: WID / (WID + 100)  — selbstbegrenzend, kein Cap

const CRIT_CHANCE := 0.05
const CRIT_MULT := 1.5

static func flat_key(kind: String) -> String:
	match kind:
		"magisch":
			return "resistenz"
		"elementar":
			return "diffusion"
		_:
			return "ruestung"

static func raw_damage(stats: Dictionary, weapon: Dictionary) -> float:
	var style: String = weapon.get("attack_style", "melee")
	var kind: String = weapon.get("damage_kind", "physisch")
	if kind == "magisch":
		return float(stats.get("WIL", 0)) + float(weapon.get("wil", 0))
	if style == "ranged":
		var ges_total := float(stats.get("GES", 0)) + float(weapon.get("ges", 0))
		var str_total := float(stats.get("STR", 0)) + float(weapon.get("str", 0))
		return ges_total * 0.75 + str_total * 0.25
	# Nahkampf physisch
	return float(stats.get("STR", 0)) + float(weapon.get("str", 0))

## Wendet Flat-Reduktion (mit RD) und WID-% an. Gibt den reduzierten Wert (float) zurück.
static func mitigate(raw: float, defense: Dictionary, kind: String, rd_percent: float) -> float:
	var flat := float(defense.get(flat_key(kind), 0.0))
	var eff_flat := flat * (1.0 - clampf(rd_percent, 0.0, 100.0) / 100.0)
	var after_flat := maxf(0.0, raw - eff_flat)
	var wid := float(defense.get("WID", 0.0))
	var wid_reduction := wid / (wid + 100.0)
	return after_flat * (1.0 - wid_reduction)

## Trefferchance + Schadensmultiplikator für Fernkampf-Falloff (GDD §5.2).
## Innerhalb der Optimalzone 100 %; je Feld außerhalb (näher ODER weiter) −30 %
## auf Treffer UND Schaden. Gilt nur für Waffen mit falloff=true (Bögen/Armbrüste).
static func falloff(weapon: Dictionary, distance: int) -> Vector2:
	if not weapon.get("falloff", false):
		return Vector2(1.0, 1.0)
	var opt_min := int(weapon.get("range_optimal_min", 1))
	var opt_max := int(weapon.get("range_optimal_max", 1))
	var beyond := 0
	if distance > opt_max:
		beyond = distance - opt_max
	elif distance < opt_min:
		beyond = opt_min - distance
	if beyond <= 0:
		return Vector2(1.0, 1.0)
	var factor := maxf(0.0, 1.0 - 0.30 * beyond)
	return Vector2(factor, factor)

## Löst einen Angriff auf. Erwartet stats/defense/weapon als Dictionaries.
## Rückgabe: { hit:bool, crit:bool, damage:int, raw:float, hit_chance:float }
static func resolve_attack(attacker_stats: Dictionary, weapon: Dictionary,
		defender_defense: Dictionary, distance: int, rng: RandomNumberGenerator) -> Dictionary:
	var raw := raw_damage(attacker_stats, weapon)
	var fo := falloff(weapon, distance)
	var hit_chance: float = fo.x
	var dmg_mult: float = fo.y
	var res := {"hit": false, "crit": false, "damage": 0, "raw": raw, "hit_chance": hit_chance}
	if rng.randf() > hit_chance:
		return res
	res.hit = true
	var crit := rng.randf() < CRIT_CHANCE
	res.crit = crit
	var eff_raw := raw * dmg_mult
	if crit:
		eff_raw *= CRIT_MULT
	var kind: String = weapon.get("damage_kind", "physisch")
	var rd := float(weapon.get("rd", 0.0))
	var final := mitigate(eff_raw, defender_defense, kind, rd)
	var dmg := int(round(final))
	if eff_raw > 0.0 and dmg < 1:
		dmg = 1
	res.damage = dmg
	return res
