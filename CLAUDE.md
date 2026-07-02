# CLAUDE.md — Axiom Projekt-Kontext

Dieses Dokument ist die interne Referenz für Claude Code. Bei Sitzungsstart hier beginnen.

---

## Projekt

**Axiom** — 2D Top-Down Tactics Fantasy RPG  
**Engine:** Godot 4 | **Art Style:** HD Pixel Art, isometrisch, hell & farbenfroh  
**Repo:** `longuspong/axiom` | **Hauptbranch:** `main`

---

## Arbeitsweise

- Nutzer gibt Designinformationen schrittweise durch
- Ich trage alles in **`GDD.md`** ein — immer dasselbe Dokument, niemals ein neues anlegen
- Bei Widersprüchen mit bestehendem Inhalt: **vor dem Eintragen fragen**
- **Workflow: ganz normal über Pull Requests.** Pro Aufgabe ein Feature-Branch, committen, pushen, **Draft-PR** öffnen bzw. den bestehenden PR aktualisieren. **Kein Direkt-Push auf `main`, kein `--force`, kein `--amend`** — der Merge in `main` läuft ausschließlich über den PR. (Der frühere Direkt-auf-`main`-/Force-Workflow ist bewusst abgeschafft, weil dabei History überschrieben wurde und Arbeit verloren ging.)

### 📋 Ausgabeformat für Wertelisten (PFLICHT)

Wenn der Nutzer um eine **Ausgabe von Werten** bittet — **egal ob Waffen, Items, Gravuren, EPP/EXP oder Ähnliches** — meint er **immer** die **Excel-Listenform** wie in `itemliste_v5.xlsx` / `itemliste_v6.xlsx`:

- Tabelle mit denselben **Spalten** wie das jeweilige xlsx-Sheet (z. B. Waffen-Sheet: ID, Name, Klasse, Typ, Stufe, Material, Eigenart, Theme/Set, Slots, Slot 1–5, Grundkapazität, Max. Verfeinerung, Prim./Sek.-Attribut + Werte, Angriffe/Zug, Reichweite, Bauteile, Kauf-/Verkaufspreis)
- **Kategorie-Trennzeilen** wie im Original (z. B. `▸ SCHWERTER`)
- **Vollständig** (alle Einträge, keine Auslassungen), Quelle ist die jeweilige Daten-Datei (`data/weapons.json` usw.)
- Diese Form gilt ohne erneute Nachfrage als Standard, sobald nach „Ausgabe"/„Liste" solcher Werte gefragt wird

### ⚠️ Sitzungsende-Checkliste (PFLICHT wenn Nutzer „Sitzung schließen" sagt)

1. **Alle besprochenen Designentscheidungen** sind vollständig ins GDD eingetragen — nichts darf in der Konversation steckenbleiben
2. **GDD ist committed, auf den Feature-Branch gepusht und der PR aktualisiert** (nicht direkt auf `main`)
3. **CLAUDE.md ist aktualisiert** (GDD-Stand-Tabelle, letzte Sitzung, Kurzreferenz)
4. Kurze Bestätigung an den Nutzer: was wurde eingetragen, was ist noch offen
- Git-Config vor jedem Commit sicherstellen: `user.email = noreply@anthropic.com`, `user.name = Claude`

### Commit-Ablauf (immer so):
```bash
git config user.email noreply@anthropic.com
git config user.name Claude
git add GDD.md              # bzw. die geänderten data/-Dateien
git commit -m "..."          # aussagekräftige Commit-Message
git push -u origin <feature-branch>
# danach: Draft-PR öffnen, falls für den Branch noch keiner offen ist —
# sonst den bestehenden PR aktualisieren. Merge in main via PR.
```

> **Push-Ziel:** Immer auf den jeweiligen **Feature-Branch**; Änderungen landen über einen **Pull Request** in `main`. Nichts wird mehr direkt auf `main` gepusht oder mit `--force`/`--amend` überschrieben.

---

## GDD-Stand (aktuell: v0.9)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid+Speed+MOB ✅, Kampfsystem+Rohschaden+Mana+Statuseffekte ✅, Aggro/Threat ✅, Sichtsystem ✅, Klassen ✅, Attribute ✅, Bögen+Armbrüste ✅, Einhand/Zweihand+Offhands ✅, restl. Waffen/Skills ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ⚠️ Art Style ✅, Sprache/Plattform/Struktur fehlen |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt |

---

## Stand letzte Sitzung

Abgeschlossen in dieser Sitzung:
- **Einhand/Zweihand + Offhand-System** definiert (GDD §5.3): Einhand = Offhand/Dualwield, Zweihand = kein Offhand, +35 % Grundwerte (mit weapons.json abzustimmen)
- **`data/offhands.json` befüllt:** 12 Offhand-Typen × 7 Stufen = 84 Einträge + `offhandtypen` + Platzhalter-`stat_skalierung`. Klassen: Schild (Buckler/Turmschild), Magischer Fokus (Foliant/Energiekristall), Hilfsmittel (Kampfkette, Laterne, Fester Gürtel, Fackel, Signalhorn, Standarte, Rauchschwenker, Köderkolben). Jedes Offhand: genau 1 Hauptattribut, Eigenart fest, Gravur-Slots bis Stahl 1 / ab Titan 2
- **Zwei neue Systeme dokumentiert** (GDD §5.2): **Aggro/Threat** (Formel, Hysterese, Decay, Taunt, Guard, Präsenz-Aggro) und **Sichtsystem** (3 Zustände Offenbar/Unsichtbar/Scheinbar)

Frühere Sitzungen:
- Waffenliste (112 Waffen) + `itemliste_v6.xlsx`; Scaffold-JSONs für Rüstung
- Speed-System, Initiative, Mobilität, Rohschaden-Formeln, Mana-System, Armbrüste aufgeteilt

## Was als nächstes kommt

1. **Offhand-Werte kalibrieren** (Prim.-Werte/Slot-Kapazitäten = Platzhalter) + Stufe-7-Offhands
2. **Zweihand-Ausgleich (+35 %)** mit `data/weapons.json` final abstimmen
3. **Körperrüstung kalibrieren** (Defensivwerte/Eigenarten = Platzhalter) + **Kopf/Füße** designen → jeweilige JSONs füllen
4. **Stufe-7 (Stellar) Waffenwerte** ausarbeiten (aktuell Platzhalter `0`)
5. **Restliches Waffensystem** (Crafting, Aufwertung, Verfeinerung)

## Dateistruktur

| Datei | Inhalt |
|-------|--------|
| `GDD.md` | Einziges Designdokument |
| `data/weapons.json` | Waffendaten: Seltenheitsstufen, Klassen, Typen+Eigenarten, Stat-Skalierung, Slot-Templates, 112 Einzelwaffen (7 Stufen × 16 Typen), Gravuren |
| `data/offhands.json` | Offhand-Daten: Seltenheit, Gewichtsklassen, Gravuren, `offhandtypen` (12), `stat_skalierung` (Platzhalter), **84 Einträge** (12 Typen × 7 Stufen) |
| `data/kopfausruestung.json` | Kopf-Rüstung — **Scaffold**, `eintraege` noch leer |
| `data/koerperausruestung.json` | Körper-Rüstung: `ruestungstypen` (5), `stat_skalierung` (Platzhalter), **35 Einträge** (5 Typen × 7 Stufen) — Defensivwerte/Eigenarten = Entwurf |
| `data/fussausruestung.json` | Fuß-Rüstung — **Scaffold**, `eintraege` noch leer |
| `data/itemliste_v6.xlsx` | Gesamt-Excel (alle Sheets/Kategorien); JSONs sind die getrennte Coding-Datenbank |

> **Datenhaltung (PFLICHT):** Pro Ausrüstungskategorie eine eigene JSON (`weapons`, `offhands`, `kopf-`, `koerper-`, `fussausruestung`) — immer aktuell halten. Die **Excel darf alles gebündelt** enthalten, die JSONs bleiben getrennt (Coding-DB). Jede JSON ist self-contained (eigene Seltenheitsstufen + Gewichtsklassen + Gravuren + `item_schema`).

---

## Wichtige Design-Entscheidungen (Kurzreferenz)

| Thema | Entscheidung |
|-------|-------------|
| Grid | Quadratische Tiles, isometrisch dargestellt, Manhattan-Distanz |
| Art Style | HD Pixel Art, hell/freundlich, hoher Detailgrad |
| Speichersystem | Encrypted JSON (Godot FileAccess), 3 Slots |
| Auto-Save | Nach jeder Runde; beim Laden: fortsetzen oder abbrechen |
| Abbrechen-Kosten | Consumables verloren, kein Reward, zurück zu Bergheim |
| Klassen-Zuweisung | Waffenwahl im Prolog = Startklasse |
| Fraktionsbonus Menschen | „Gemeinschaft" — Regen pro Mensch auf dem Feld |
| Kampagnen-Loot | Einmal-Reward bei Erstabschluss, danach random; Zwischenlevel ohne fixen Reward |
| Aufträge | 3 Typen: vorgegeben, generisch, freischaltbar (Klassen-Arks) |
| Endlos-Modus | Ab Kampagne 10, physischer Loot-Pool, kein Magie-Loot |
| Trupp-Größe | Standard: 3 Einheiten |
| Max Level | 50 — linear bis ~25, straff ab 35, Level 46–50 ggf. challenge-gegattet |
| Schutz vs. Schild | Absorptions-Zauber = „Schutz"; Ausrüstung = „Schild" (gilt überall inkl. Gravuren) |
| Attribute | WIL, INT, VIT, WID, STR, GES — alle 3 Buchstaben Caps |
| Schadensreduktion | 3 Hebel: **WID** = prozentual (`WID/(WID+100)`, beide Typen), **Rüstung/Resistenz** = flacher Abzug pro Treffer (physisch/magisch, Squishy≈0), **RD** = Rüstungsdurchdringung (prozentual, senkt nur den Flat-Wert). WIL bleibt rein offensiv. Multi-Hit = höherer Gesamt-Rohschaden |
| Bögen-Reichweite | Notation `optimal/max` (z. B. 3–4/5); −30 % Schaden & Trefferchance pro Feld außerhalb der Optimalzone; Adlerauge +1 auf beide Grenzen |
| Armbrüste | Repetierarmbrust = E (einhändig, leicht); Kriegsarmbrust = B (beidhändig, schwer); beide 1–2 Felder optimal |
| Speed-System | Basiswert 1,0; Gewichtsklassen Schnell/Wendig/Ausgeglichen/Bedächtig/Träge; Waffe+Körper ±0,30; Kopf+Füße ±0,20; Max Bonus/Malus ±1,0 |
| Mobilität | MOB-Basiswert pro Klasse (max 5); nur durch Items/Skillnodes erhöhbar; Trait-Bewegung zählt nicht auf MOB an |
| Rohschaden Nahkampf | Physisch: STR(Einheit)+STR(Waffe)+Buffs; Magisch: WIL(Einheit)+WIL(Waffe)+Buffs |
| Rohschaden Fernkampf | GES×0,75 + STR×0,25 (alle Quellen summiert) |
| Mana | Standard 100; Regen 10/Zug (INT 10 Standard); aktive Gravur-Skills kosten Mana; passive Gravuren reservieren Mana in der Homezone |
| VIT/LP | 1 VIT = 6 LP (Faktor modellierbar) |
| Einhand/Zweihand | Einhand (E): Offhand ODER Dualwield; Zweihand (B): kein Offhand, dafür +35 % auf Grundwerte. **Festgelegt:** nicht in weapons.json eingerechnet, sondern globaler Aufschlag beim Anzeigen/Ausrüsten (`meta.zweihand_grundwert_bonus`); Infokarte zeigt Endwert + Bonus-Zeile |
| Offhands | Klasse+Typ wie Waffen, aber KEINE Waffen (Gimmicks). Genau 1 Hauptattribut, Eigenart fest = Identität, Gravuren modular. Gravur-Slots: bis Stahl 1, ab Titan 2. Daten: `data/offhands.json` (84 Einträge). Affinitäten = Empfehlung, frei kombinierbar |
| Aggro/Threat | Threat nur durch Aktionen (`base×coeff×proximity`); Hysterese 110/130 %, Decay 5 %, Taunt-Lock 3 Züge, Guard 50/50. Präsenz-Aggro nur über Ausrüstungs-Auren (§5.2) |
| Sichtsystem | Kein Fog of War. 3 Zustände: Offenbar / Unsichtbar / Scheinbar (≤2 Felder von Gegner aufgedeckt). Angriff/Zauber/Treffer → Offenbar (§5.2) |
