class_name InitiativeTracker
extends RefCounted
## Initiative als Punkte-Leisten-Modell (GDD §5.1):
## Jede Einheit hat eine Leiste 0→100, füllt sich pro Tick um speed*10 Punkte.
## Bei ≥100 ist man dran; danach −100 (Überschuss bleibt). Gleichstand: höhere
## Geschwindigkeit zuerst. Alle Initiative-Effekte ziehen feste Punkte ab.

const FILL_FACTOR := 10.0
const THRESHOLD := 100.0

var units: Array = []

func setup(p_units: Array) -> void:
	units = p_units

func alive() -> Array:
	return units.filter(func(u): return u.is_alive())

## Tickt die Leisten hoch, bis eine Einheit dran ist, und gibt sie zurück.
func next_unit() -> Unit:
	var living := alive()
	if living.is_empty():
		return null
	var guard := 0
	while guard < 100000:
		guard += 1
		var ready := living.filter(func(u): return u.initiative >= THRESHOLD)
		if ready.is_empty():
			for u in living:
				u.initiative += u.speed * FILL_FACTOR
			continue
		ready.sort_custom(_cmp_ready)
		return ready[0]
	return living[0]

func _cmp_ready(a: Unit, b: Unit) -> bool:
	if a.initiative != b.initiative:
		return a.initiative > b.initiative
	return a.speed > b.speed

## Nach dem Zug aufrufen: Schwelle abziehen, Überschuss bleibt erhalten.
func consume(u: Unit) -> void:
	u.initiative -= THRESHOLD

## Vorschau der nächsten N Züge (nicht-mutierend), für die HUD-Anzeige.
func preview(count: int) -> Array:
	var living := alive()
	var sim := {}
	for u in living:
		sim[u] = u.initiative
	var order: Array = []
	var guard := 0
	while order.size() < count and guard < 100000:
		guard += 1
		var ready: Array = []
		for u in living:
			if sim[u] >= THRESHOLD:
				ready.append(u)
		if ready.is_empty():
			for u in living:
				sim[u] += u.speed * FILL_FACTOR
			continue
		var picked: Unit = ready[0]
		for u in ready:
			if sim[u] > sim[picked] or (sim[u] == sim[picked] and u.speed > picked.speed):
				picked = u
		order.append(picked)
		sim[picked] -= THRESHOLD
	return order
