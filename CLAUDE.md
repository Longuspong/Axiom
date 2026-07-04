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

## GDD-Stand (aktuell: v0.15)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid+Speed+MOB ✅, Kampfsystem+Rohschaden+Mana+Statuseffekte ✅, Trefferchance+Krit+Ausweichen ✅, Aggro/Threat ✅, Sichtsystem ✅, Klassen ✅, Attribute ✅, Bögen+Armbrüste ✅, Einhand/Zweihand+Offhands ✅, Gravurensystem-Rahmen (§5.7) ✅, Stellar-Waffen (Stufe 7) ✅, restl. Waffensystem (Gravuren-Katalog/Crafting) + Skills ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ⚠️ Art Style ✅, GDScript ✅, Plugins ✅, Game Feel ✅, Tileset-Specs ✅, Projektstruktur ✅, Placeholder-Assets (§10.4) ✅, Zielplattform fehlt |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt, inkl. Phasenplan & Phase-0-Abschlusskriterien |

---

## Stand letzte Sitzung

Abgeschlossen in dieser Sitzung (2026-07-04 — **Stellar-Kalibrierung**, Phase-0-Punkt „Stufe-7-Waffen" erledigt):
- **Stufe-7-Waffen (Stellar) kalibriert** (`weapons.json` **v8** + Excel, GDD §5.3 „Waffensystem — Stellar-Stufe"): Prim-Reihen fortgeschrieben ~×1,35 (62→**84**, 74→**100**, 52→**70**; Sek analog 38→52, 28→38, 40→54, 52→70); Slots = 5 wie Diamant, **Grundkapazität +2 über Diamant** (Basis 9/11/12 je Klassengruppe — der Stellar-Unlock für L4/L5-Signatur-Gravuren), Verfeinerung 3×; Verkauf 1000, kein Kaufpreis (nur Loot/Craft)
- **Stellar-Eigenarten ✦**: Typ-Eigenart bleibt, verstärkt (z. B. Frontmann +15→25 %, Dopplereffekt 2×65→2×80 %, Kriegsarmbrust 50→75 % RD; volle Tabelle §5.3); in `waffentypen` als `stellar_eigenart`/`stellar_eigenart_effekt`, Zahlen Balancing-Vorbehalt
- **Lichtresonanz** (verstecktes Story-Flag): alle S7-Waffen tragen `Lichtresonanz: true` — Stellar-Licht durchdringt die Schattenrüstung der Endfraktion; NICHT auf der Item-Karte, Interaktionsregel folgt beim Story-/Endfraktions-Design (Phase 1); Erklärung in `meta.lichtresonanz`
- **Sek-WID eingedampft** (Budget-Ausnahme aufgelöst, rückwirkend S1–7): **Jagdbogen & Langbogen Sek WID→STR** (Nutzer-Entscheidung: alle Bogenwaffen = GES/STR, Werte-Reihe unverändert); **Hammer** als einzige WID-Waffe auf Körper-Rüstungs-Tier **3/5/7/10/13/17/23** (statt 6…40), als `sek_wid_werte` hinterlegt
- **Zepter → Zweihand (B)** (Nutzer-Entscheidung; GDD sagte schon B, Einträge standen auf E): alle 7 Stufen Hand=B, Grundkapazität mit Zweihand-Bonus = 2/3/4/7/8/9/**11**
- Excel-Altlast bereinigt: Stat-Skalierung-Sheet Zeile „Dolche"→„Stichwaffen"; Waffentypen-Sheet um Stellar-Eigenart-Spalten ergänzt; Kriegsgeräte-Sek als „typabhängig" + eigene WID-Zeile

Frühere Sitzungen:
- **Rüstungskalibrierung (2026-07-04, PR #14 gemergt — Phase-0-Punkt „Rüstung" erledigt):**
  - **Slot-Kapazitäten & Verfeinerung final**: Max. Verfeinerung in allen drei Rüstungs-JSONs war versehentlich `= Stufe` (bis 7×) → korrigiert auf **1× Kupfer / 2× Eisen / 3× ab Stahl** (wie Waffen/Offhands, 84 Einträge inkl. Zubehör); Grundkapazität = Stufe + Slots 1 bis Stahl / 2 ab Titan vom Nutzer bestätigt
  - **Attributsbudget-Prinzip entschieden (GDD §5.3)**: **2/5 aus Rüstung : 3/5 aus Skilltree** (Annahme ~70 Punkte pro fokussiertem Attribut über Attributsnodes) → Voll-Set (Körper+Kopf+Füße) auf ein Attribut = **47 auf Stufe 7**
  - **Rüstung kalibriert (JSONs v1.3 + Excel, alle 147 Einträge inkl. Stufe 7)**: Prim-Tiers halbiert — Körper 3/5/7/10/13/17/**23**, Kopf/Füße 2/3/4/5/7/9/**12** (gilt auch für Zubehör); Flat-Basis Körper 2/3/4/5/6/8/**10**, Kopf/Füße 1/2/2/3/4/5/**6** (Anker: Voll-Platte ≈ 25 % eines gleichstufigen Einzeltreffers = §5.2-Beispiel; Voll-Platte S6 = 32 Flat, unter der Nutzer-Obergrenze ~50); VIT/LP unverändert + S7 = 47/28; **WID-Defensivzeile gestrichen** (Double-Dip mit Platte-Prim — WID nur noch über Prim-Wert + Skilltree), WID-Spalte auch aus der Excel entfernt
  - **Bewusste Budget-Ausnahmen dokumentiert (§5.3)**: WID-Offhands (Turmschild/Fester Gürtel) bleiben außerhalb des 2/5-Budgets (Trade-off); Waffen-Sek-WID (bis 40) wird bei der Stufe-7-Waffen-Kalibrierung eingedampft
  - **Zweihand-Grundkapazität entschieden & eingerechnet**: +1 bis Stahl / +2 ab Titan (mehr Kapazität, nicht mehr Slots) — 36 B-Waffen Stufe 1–6 in `weapons.json` v7.1 + Excel; Stufe-7-B-Waffen folgen mit der Stellar-Kalibrierung. Altlast bereinigt: `slot_templates`-Klasse Dolche→Stichwaffen (JSON + Excel)
  - **Sitzungsproblem GELÖST**: GitHub-**Default-Branch** des Repos war der Uralt-Branch `claude/repo-access-permissions-l4kamm` (GDD-v0.6-Stand) — deshalb startete jede neue Claude-Code-Sitzung veraltet und der Stop-Hook meldete die main-History als „neu". Nutzer hat den Default-Branch auf **`main`** umgestellt und den beim ersten Fix-Versuch versehentlich entstandenen Umbenennungs-Rest `Main` (großes M, v0.6) gelöscht. **Neue Sitzungen starten ab jetzt auf dem aktuellen Stand.**
  - PR **#14** (`claude/phase-0-armor-calibration-2tyhyf`) — **gemergt** (2026-07-04)

- **Phase-0-Abschlussplan, Excel v7 & Rettung gestrandeter Branches (2026-07-03):**
  - **Gravur-Kostenmodell entschieden (GDD §5.7)**: Kapazitätskosten **rein Level-basiert** (L1=2, L2=4, L3=6, L4=8, L5=10; L4/L5 nur Spezial), passender typisierter Slot halbiert, Flex/unpassender Slot = volle Kosten. Typ-Basiskosten gestrichen, `[prüfen]`-Marker aufgelöst, Beispiele korrigiert. Nutzer-Klarstellung als Beispiel ergänzt: Kapazität 1 + Aktiv-Slot → nur Aktiv-Gravur L1 passt (2→1)
  - **Offhands kalibriert (GDD §5.3, `offhands.json` v1.3)**: Prim.-Wert **3/5/7/10/14/18/24** = Sekundärslot-Tier ≈ 50 % des Zweihand-Äquivalents (Ø 0,35×(Prim+Sek) über alle Waffenklassen = 5/8/12/18/25/35) — Mehrwert liegt in Eigenart + Slots. Grundkapazität = Stufe (1–7), Max. Verfeinerung 1×/2×/3×+ analog Waffen. Stufe-7-Offhands damit ausgearbeitet; alle 84 Einträge + Excel-Sheet aktualisiert. **Phase-0-Punkt 1 erledigt**
  - **Branch-Putz**: PR #12 gemergt (main = v0.12-Stand); alle überholten Remote-Branches gelöscht (5 gerettete Quellen + gemergte/überholte, inkl. `bold-dijkstra`)
  - **Phasenplan definiert (GDD §11)**: Phase 0 = Vorüberlegung & Design, Phase 1 = Playtest & Integration (startet mit Skilltree/Godot-MVP). Abschlusskriterien-Checkliste für Phase 0 eingetragen (Zuordnung = Vorschlag, vom Nutzer zu bestätigen); Playtest-abhängige Punkte explizit nach Phase 1 verschoben
  - **`data/itemliste_v7.xlsx` erstellt** (ersetzt v6): Waffen-Sheet aus weapons.json v7 neu aufgebaut (Bogen-Notation `optimal/max`, z. B. `3–4/5`), neue Sheets **Offhands** (84), **Kopf-/Körper-/Fußausrüstung** (je 49, Köcher/Buchrolle im Körper-Slot), Referenz-Sheet **Offhand- & Rüstungstypen** (33 Typen). Verifiziert: alle IDs deckungsgleich mit den JSONs
  - **Techstack in GDD §10.3 übernommen** (aus dem nie gemergten Branch `claude/game-content-roadmap-jotfhn`): Sprache **GDScript**, Audio nativ (AudioStreamPlayer + Bus), Plugins Dialogue Manager + Phantom Camera 2D, Game-Feel-Kernpatterns
  - **Gestrandete Branch-Inhalte gerettet** (Nutzer-Auftrag „rette und übernehme"):
    - **Gravurensystem → GDD §5.7** (aus `waffenkiste-engraving-discussion-h9m12r`): Typen, Mana-Reservierung, Slots & Energie, Verfeinerung (Tabelle an Datenstand v7 angepasst: Kupfer 1× / Eisen 2× / Stahl+ 3×), Seltenheit, Leveling, Crafting-Vorschau. Kostenmodell-Widerspruch im Beispiel entdeckt → vom Nutzer entschieden (Level-basiert, s. o.)
    - **Placeholder-Assets + GDD §10.4** (aus `game-content-roadmap-jotfhn`): `assets/placeholder/` (Tiny-RPG Soldat/Ork/Pfeil, Taverne 126 Items). Die dortigen CLAUDE.md-Workflow-Regeln (direkt-main/force) wurden bewusst NICHT übernommen (obsolet)
    - **Terrain-Tileset v1 + Godot-Skelett** (aus `isometric-map-tileset-mtfwuq`, neuester Stand HD-2D + Brücke/Furt): `assets/tiles/`, `docs/TILESET.md`, `scenes/map_demo`, `scripts/tile_ids.gd`, `tools/generate_tileset.py` + `render_preview.py`; Tileset-Specs → GDD §10.1, Projektstruktur → §10.3
    - **Yggdrasil-Skilltree-Editor** (aus `skilltree-editor-setup-iokofy`): `addons/yggdrasil/` (Editor-Plugin fürs erste Code-Projekt)
    - **`project.godot` von Hand gemergt** (Tileset-Branch + Skilltree-Branch: main_scene map_demo, Display-Settings, Yggdrasil aktiviert, Godot 4.3); `.gitignore` konsolidiert (`.uid`/`.import` werden committet)
    - **Pixelart-/Sprite-Strategie übernommen** (aus `pixelart-generator-prompt-yyyhrv`): siehe Abschnitt „Placeholder-Sprites" unten + GDD §10.4
    - **NICHT übernommen (überholt):** `bold-dijkstra-i0i9vs` (altes Waffensystem, komplett von v7-Daten überholt), CLAUDE.md-Workflow-Commits der Roadmap. Die geretteten Quell-Branches können nach dem Merge gelöscht werden
- **Phase-0-Audit & Widerspruchsbereinigung (2026-07-03):**
  - **Vollaudit aller Daten**: 112 Waffen + 84 Offhands + 147 Rüstungsteile rechnerisch gegen Skalierungstabellen geprüft — null Wertabweichungen
  - **Neue Systeme definiert (GDD §5.2)**: Trefferchance (100 % Basis; Fernkampf-Falloff = Trefferchance, −30 %/Feld, Max-Reichweite = harte Grenze; Ausweichen Basis 0 %, nur aus Quellen), Krit (5 % Basis, ×1,5 Rohschaden, keine Backstab/Flanken-Kopplung), WID **kein Cap** (Formel selbstbegrenzend), Kälte-Reaktionsmalus **−10 %/Stapel**
  - **Eigenarten-Grundregel**: niemals aktiv, immer passiv/reaktiv/automatisch. Umgestellt: Spruchrolle (auto alle 7 Züge: nächster Zauber gratis), Signalhorn „Sammeln" (auto alle 5 Züge), Windsohle neu = **„Aufwind"** (Zugbeginn ohne angrenzenden Gegner → +1 MOB); Fackel „Hetzjagd" final **+0,2 Speed**
  - **Alle 21 Rüstungs-/Zubehör-Eigenarten abgesegnet** — `[Entwurf]`-Marker entfernt (Zahlenwerte bleiben Balancing-Vorbehalt)
  - **Widersprüche bereinigt**: Bogen-Gewichtsklassen (Daten-Version gilt: Kriegsarmbrust Bedächtig, Jagdbogen Wendig, Langbogen Ausgeglichen), Krieger Σ80 = Absicht dokumentiert, Armbrüste bewusst identisches Distanzprofil, `stat_skalierung`-Schlüssel „Dolche"→„Stichwaffen", toter `rueckenausruestung`-Verweis korrigiert, Schütze-/Assassinen-Tabellen an reale Waffentypen angepasst, §11-ToDos dedupliziert & kategorisiert
  - **weapons.json v7**: Bogenwaffen tragen jetzt `Reichweite optimal` + `Reichweite max` als strukturierte Felder (28 Einträge + 4 Typdefinitionen)
- Modulare Ausrüstungs-/Skilltree-Philosophie festgehalten (GDD §5.3): Jede Klasse kann alles, ein universeller Skilltree mit klassenabhängigem Einstiegspunkt, früh empfohlene Pfade ohne Zwang. Offen: Attributsvoraussetzungen für starke Kombos (in Evaluation)
- Einhand/Zweihand + Offhand-System definiert (GDD §5.3): Einhand = Offhand/Dualwield, Zweihand = kein Offhand, +35 % Grundwerte (mit weapons.json abzustimmen)
- `data/offhands.json` befüllt: 12 Offhand-Typen × 7 Stufen = 84 Einträge + `offhandtypen` + Platzhalter-`stat_skalierung`. Klassen: Schild (Buckler/Turmschild), Magischer Fokus (Foliant/Energiekristall), Hilfsmittel (Kampfkette, Laterne, Fester Gürtel, Fackel, Signalhorn, Standarte, Rauchschwenker, Köderkolben). Jedes Offhand: genau 1 Hauptattribut, Eigenart fest, Gravur-Slots bis Stahl 1 / ab Titan 2
- Zwei neue Systeme dokumentiert (GDD §5.2): Aggro/Threat (Formel, Hysterese, Decay, Taunt, Guard, Präsenz-Aggro) und Sichtsystem (3 Zustände Offenbar/Unsichtbar/Scheinbar)
- Waffenliste (112 Waffen) + `itemliste_v6.xlsx`; Scaffold-JSONs für Rüstung
- Speed-System, Initiative, Mobilität, Rohschaden-Formeln, Mana-System, Armbrüste aufgeteilt

## Was als nächstes kommt

Ziel: **Phase 0 beenden** (Abschlusskriterien in GDD §11). Reihenfolge:

1. **Restliches Waffensystem** (Gravuren-Katalog, Crafting-Details, Aufwertung; Systemrahmen + Kostenmodell stehen in §5.7)
2. **Skilltree-Struktur designen** — danach Umsetzung in Godot (Yggdrasil-Editor liegt bereit) = Start Phase 1. Muss die Annahme **~70 Punkte pro fokussiertem Attribut** einlösen (Rüstungskalibrierung hängt daran, §5.3)
3. **Techn. Rest:** Zielplattform festlegen; Charakter-Sprites generieren (Pixellab.ai-Prompt unten)

> Vorab ggf.: **Stellar-PR mergen** (Stellar-Kalibrierung, Branch `claude/next-steps-planning-9xa685`, Stand dieser Sitzung). Damit sind von den Phase-0-Kriterien nur noch Gravuren-Katalog/Crafting, Skilltree-Struktur und Zielplattform offen.

## Dateistruktur

| Datei | Inhalt |
|-------|--------|
| `GDD.md` | Einziges Designdokument |
| `data/weapons.json` | Waffendaten (**v8, vollständig kalibriert inkl. Stufe 7/Stellar**): Seltenheitsstufen, Klassen, Typen+Eigenarten (inkl. `stellar_eigenart`/`stellar_eigenart_effekt`), Stat-Skalierung (S7 befüllt, `sek_wid_werte` für Hammer), Slot-Templates, 112 Einzelwaffen (7 Stufen × 16 Typen, S7 mit `Lichtresonanz: true`), Gravuren; Bogenwaffen mit `Reichweite optimal`/`Reichweite max`, alle Bögen GES/STR, Zepter = B |
| `data/offhands.json` | Offhand-Daten (v1.3, **kalibriert**): Seltenheit, Gewichtsklassen, Gravuren, `offhandtypen` (12, inkl. `material_form`/`genus`), `stat_skalierung` (3/5/7/10/14/18/24), **84 Einträge** (12 Typen × 7 Stufen, inkl. Stellar) |
| `data/kopfausruestung.json` | Kopf-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Zielvisier, Diadem), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, **v1.3 kalibriert** (2026-07-04) |
| `data/koerperausruestung.json` | Körper-Slot: `ruestungstypen` (5 Rüstungs-Archetypen) + `zubehoer_typen` (2: Köcher, Buchrolle = Gimmicks ohne Defensivwerte), **49 Einträge** (35 Rüstung + 14 Zubehör) — **v1.3 kalibriert** (2026-07-04) |
| `data/fussausruestung.json` | Fuß-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Steigeisen, Windsohle), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, `MOB-Bonus`-Feld, **v1.3 kalibriert** (2026-07-04) |
| `data/itemliste_v7.xlsx` | Gesamt-Excel (alle Sheets/Kategorien inkl. Offhands + Kopf-/Körper-/Fußausrüstung + Typen-Referenz); JSONs sind die getrennte Coding-Datenbank |
| `project.godot` | Godot-4.3-Projekt (main_scene: map_demo, Yggdrasil-Plugin aktiviert) |
| `addons/yggdrasil/` | Skilltree-Editor-Plugin (fürs erste Code-Projekt) |
| `assets/tiles/` + `docs/TILESET.md` | Terrain-Tileset v1 (prozedural generiert, Specs in GDD §10.1) |
| `assets/placeholder/` | MVP-Placeholder (Tiny-RPG Soldat/Ork/Pfeil, Taverne) — GDD §10.4 |
| `scenes/`, `scripts/`, `tools/` | Map-Demo, Tile-IDs, Tileset-Generator + Preview-Renderer (Python) |

> **Datenhaltung (PFLICHT):** Pro Ausrüstungskategorie eine eigene JSON (`weapons`, `offhands`, `kopf-`, `koerper-`, `fussausruestung`) — immer aktuell halten. Die **Excel darf alles gebündelt** enthalten, die JSONs bleiben getrennt (Coding-DB). Jede JSON ist self-contained (eigene Seltenheitsstufen + Gewichtsklassen + Gravuren + `item_schema`).

---

## Placeholder-Sprites (Stand: Sitzung 2026-06-26, gerettet 2026-07-03)

### Strategie
- **Ein grayscale Sprite** für alle Charaktertypen → Godot `modulate` für Farb-Differenzierung
- Spieler: Blau (`Color(0.29, 0.56, 0.89)`) | Gegner: Rot (`Color(0.89, 0.29, 0.29)`)
- Format: 4 ISO-Richtungen (S, N, O, W), Sprite-Sheet 2×2 Grid

```gdscript
# Spieler
sprite.modulate = Color(0.29, 0.56, 0.89)
# Gegner
sprite.modulate = Color(0.89, 0.29, 0.29)
```

### Tools ausprobiert
| Tool | Status | Ergebnis |
|------|--------|----------|
| Pixellab.ai | ❌ Tokens leer | Bestes Tool für Pixel-Sprites (8-Richtungen direkt wählbar) — für nächste Sitzung mit Tokens nutzen |
| DALL-E / OpenAI | ⚠️ nicht getestet | Detaillierte 4-Richtungs-Prompts wurden vorbereitet |
| LibreSprite | ⏳ geplant | Manuell; Tutorial-Links vorhanden |
| Claude | ❌ nicht möglich | Text-LLM, kann keine Bilder generieren |

### Pixellab.ai-Prompt (für nächste Sitzung)
```
Isometric pixel art character sprite, generic humanoid placeholder, 
grayscale/desaturated only (no color), 32x32 or 48x48 pixels,
top-down isometric 3/4 view, 4 directions: South (facing viewer), 
North (facing away), East (facing right), West (facing left),
clean simple silhouette, thick 1px black outline, suitable for 
tactical RPG, HD pixel art style, no background, transparent
```

### Nächster Schritt Sprites
→ Pixellab.ai mit neuen Tokens aufrufen, obigen Prompt verwenden, alle 4 Richtungen generieren → in Godot als SpriteFrames einbinden. (Übergangslösung: Tiny-RPG-Sprites aus `assets/placeholder/` mit Spiegeln + Richtungsindikator, siehe GDD §10.4)

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
| Einhand/Zweihand | Einhand (E): Offhand ODER Dualwield; Zweihand (B): kein Offhand, dafür +35 % auf Grundwerte **+ Grundkapazität +1 bis Stahl / +2 ab Titan (entschieden 2026-07-04, in weapons.json v7.1 eingerechnet; Slots unverändert; Ziel: E+Offhand bleibt knapp vorn)**. **Festgelegt:** nicht in weapons.json eingerechnet, sondern globaler Aufschlag beim Anzeigen/Ausrüsten (`meta.zweihand_grundwert_bonus`); Infokarte zeigt Endwert + Bonus-Zeile |
| Offhands | Klasse+Typ wie Waffen, aber KEINE Waffen (Gimmicks). Genau 1 Hauptattribut, Eigenart fest = Identität, Gravuren modular. Gravur-Slots: bis Stahl 1, ab Titan 2. Daten: `data/offhands.json` (84 Einträge, 12 Typen). Affinitäten = Empfehlung, frei kombinierbar. Köcher & Buchrolle liegen im **Körper-Slot** (`koerperausruestung.json`), nicht als Offhand — funktionieren so auch mit Zweihandwaffen. **Bewusster Trade-off:** Zubehör und Körperrüstung teilen sich einen Slot (entweder/oder) |
| Item-Namensregel | Reine Metallgegenstände: „`<Material> <Typ>`" (z. B. „Kupfer Buckler"). Nicht-Metall-Items (Pergament/Leder/Kristall/Holz) werden mit dem Seltenheits-Metall **beschlagen**/**bearbeitet**: „stahlbeschlagener Foliant", „kupferbearbeiteter Köcher". Adjektiv-Endung nach Genus (Nom.): m=-er, f=-e, n=-es. Steuerfelder pro Typ: `material_form` (pur\|beschlagen\|bearbeitet) + `genus` |
| Attributs-Split | **2/5 aus Rüstung : 3/5 aus Skilltree** (Annahme ~70 Punkte pro fokussiertem Attribut über Attributsnodes) — Voll-Set (Körper+Kopf+Füße) auf ein Attribut = 47 auf Stufe 7. Bewusste Ausnahmen: WID-Offhands (Turmschild/Fester Gürtel) außerhalb des Budgets; Waffen-Sek-WID wird bei Stellar-Kalibrierung eingedampft (§5.3) |
| Rüstungskalibrierung | **Final (2026-07-04, §5.3):** Prim-Tiers Körper `3,5,7,10,13,17,23` / Kopf+Füße `2,3,4,5,7,9,12` (auch Zubehör); Flat-Basis (Rüstung=Resistenz) Körper `2,3,4,5,6,8,10` / Kopf+Füße `1,2,2,3,4,5,6` × Archetyp-Multiplikator (Anker: Voll-Platte ≈ 25 % eines gleichstufigen Einzeltreffers; S6-Set = 32 Flat < Obergrenze ~50); VIT/LP `6…47` / `4…28`; **WID-Defensivzeile gestrichen** (WID nur über Prim + Skilltree); Kapazität = Stufe, Slots 1 bis Stahl / 2 ab Titan, Verfeinerung 1×/2×/3× |
| Aggro/Threat | Threat nur durch Aktionen (`base×coeff×proximity`); Hysterese 110/130 %, Decay 5 %, Taunt-Lock 3 Züge, Guard 50/50. Präsenz-Aggro nur über Ausrüstungs-Auren (§5.2) |
| Sichtsystem | Kein Fog of War. 3 Zustände: Offenbar / Unsichtbar / Scheinbar (≤2 Felder von Gegner aufgedeckt). Angriff/Zauber/Treffer → Offenbar (§5.2) |
| Trefferchance | Kein genereller Trefferwurf — 100 % Basis. Fernkampf: Falloff **ist** die Trefferchance (−30 % Treffer & Schaden pro Feld außerhalb der Optimalzone, beide Richtungen); Max-Reichweite = harte Grenze (Feld nicht anwählbar). Ausweichen: Basis 0 %, nur aus expliziten Quellen (§5.2) |
| Krit | 5 % Basis-Kritchance, ×1,5 Rohschaden (vor Reduktion); erhöhbar nur durch Quellen; garantierte Krits = 100 %. Keine generelle Backstab/Flanken-Kopplung (§5.2) |
| WID-Cap | **Kein Cap** — `WID/(WID+100)` begrenzt sich asymptotisch selbst; Balancing über WID-Verfügbarkeit (§5.2) |
| Kälte | Zusätzlich zu Einfrier-Chance: **−10 % Reaktionswert pro Stapel** (10 Stapel = Reaktionen deaktiviert) (§5.2) |
| Eigenarten-Regel | **Niemals aktiv** — immer passiv/reaktiv/automatisch (Auto-Trigger ggf. mit CD); aktivierbare Effekte nur über Gravuren. Spruchrolle: auto alle 7 Züge; Signalhorn: auto alle 5 Züge; Windsohle = „Aufwind" (Zugstart ohne angrenzenden Gegner → +1 MOB); Fackel = +0,2 Speed (§5.3) |
| Krieger Σ80 | Startattribute Krieger Σ 80 (alle anderen Σ 75) ist Absicht — Tank-Fundament, Ausgleich: nur MOB 3 (§5.3) |
| Armbrüste-Profil | Kriegs- & Repetierarmbrust bewusst identisch 1–2/3; Differenzierung über Hand/Gewicht/Eigenart (§5.3) |
| Bogen-Reichweite (Daten) | Bogenwaffen in weapons.json mit Feldern `Reichweite optimal` (z. B. „3–4") + `Reichweite max` (z. B. 5); Anzeige-Notation `3–4/5` daraus abgeleitet |
| Gravur-Kosten | Kapazitätskosten **rein Level-basiert**: L1=2, L2=4, L3=6, L4=8, L5=10 (L4/L5 nur Spezial/Signatur). Passender typisierter Slot halbiert; Flex/unpassender Slot = volle Kosten. Kein Typ-Basiskosten-Faktor (§5.7) |
| Offhand-Werte | **Kalibriert:** Prim.-Wert 3/5/7/10/14/18/24 (= Sekundärslot-Tier, ≈ 50 % des Zweihand-Äquivalents), Grundkapazität = Stufe (1–7), Max. Verfeinerung 1×/2×/3× (Stahl+ = 3×), Slots 1 bis Stahl / 2 ab Titan (§5.3) |
| Stellar-Waffen (S7) | **Kalibriert (2026-07-04, §5.3 „Stellar-Stufe"):** Prim 84 (62er-Reihe) / 100 (Kampfaxt) / 70 (52er-Reihe), Sek analog (52/38/54/70); 5 Slots wie Diamant, **Grundkapazität +2 über Diamant** (Basis 9/11/12 je Klassengruppe = Unlock für L4/L5-Signatur-Gravuren), B-Waffen nochmal +2; Verfeinerung 3×; **Stellar-Eigenart ✦** = verstärkte Typ-Eigenart (Tabelle §5.3); verstecktes Flag `Lichtresonanz: true` — durchdringt Schattenrüstung der Endfraktion, nicht auf Item-Karte, Regel folgt beim Story-Design (Phase 1); kein Kaufpreis (nur Loot/Craft), Verkauf 1000 |
| Bogen-Sekundärattribut | **Alle Bogenwaffen GES (prim) / STR (sek)** (2026-07-04): Jagd- & Langbogen von WID auf STR umgestellt (Werte-Reihe unverändert) — passt zur Fernkampfformel GES×0,75 + STR×0,25 |
| Waffen-Sek-WID | **Eingedampft (2026-07-04):** nur noch der Hammer trägt Sek-WID, Reihe = Körper-Rüstungs-Tier 3/5/7/10/13/17/23 (statt 6…40) — `sek_wid_werte` in weapons.json; Budget-Ausnahme aus §5.3 damit aufgelöst |
| Zepter | **Zweihand (B), alle 7 Stufen** (2026-07-04): +35 %-Anzeige-Bonus greift, Grundkapazität 2/3/4/7/8/9/11 (Dateneinträge standen vorher fälschlich auf E; GDD sagte schon immer B) |
