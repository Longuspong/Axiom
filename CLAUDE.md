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

## GDD-Stand (aktuell: v0.25)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid+**Initiative-Leisten-Modell (§5.1)** ✅, **Gefechtstypen & Map-Größen (§5.1) ✅**, **Gelände-/Feld-Funktionstypen (§5.1) ✅**, Kampfsystem+Rohschaden+Mana+Statuseffekte ✅, Trefferchance+Krit+Ausweichen ✅, **Schadenstyp Elementarschaden+Elementardiffusion+Elementar-Durchdringung+Elementare Zusatzeffekte (§5.2) ✅**, Magisch-Fernkampf-Formel final ✅, Aggro/Threat ✅, Sichtsystem ✅, Klassen ✅, Attribute ✅, Bögen+Armbrüste ✅, Einhand/Zweihand+Offhands ✅, **Gravur-Schema (4 Achsen) + visuelle Kodierung (§5.7) ✅**, Stellar-Waffen (Stufe 7) ✅, Crafting/Resonanz-Matrix (§5.8) ✅ inkl. Drop & Herkunft, **Skilltree-Struktur-Grundlage (§5.4) ✅**; **4 Elemente stehen**, **Gravuren-Katalog in Arbeit** (STR/GES fertig, alle-6-Paletten-Vorschlag `docs/gravuren_vorschlag.md` wartet auf Nutzer-Review) + Materialliste (Vorschlag `docs/materialliste_vorschlag.md` wartet auf Review) + Skilltree-Notable/Keystone-Listen ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits; ⚠️ **Lex Tactica (§8.5) Struktur + Grundstock ✅** (7 Rubriken, Wiki-Card, Entdeckungs-Freischaltung, Materialien/Rohlinge/Kampf-Kodex befüllt), Rubriken 3–5/7 + UI noch offen |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ✅ Art Style, GDScript, Plugins, Game Feel, Tileset-Specs, Projektstruktur, Placeholder-Assets (§10.4), Zielplattform (§10.5, 2026-07-04) |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt, inkl. Phasenplan & Phase-0-Abschlusskriterien |

---

## Stand letzte Sitzung

Abgeschlossen in dieser Sitzung (2026-07-12 — **Materialliste-Vorschlag + Gefechtstypen/Map-Design + Endlos-Modus-Ausbau**, PR **#23** offen `claude/phase-0-planning-3qnda3`):
- **Materialliste-Vorschlag erstellt** (`docs/materialliste_vorschlag.md`, PR #23, gleiches Review-Muster wie der Gravuren-Vorschlag): Drop-Leitprinzip „Der Drop spiegelt den Träger", Flavor-Texte für alle 7 Barren + 38 Aspektsplitter + 4 Essenzen + 12 Bauteile, Gegner-Level-Bänder pro Barren-Stufe, Drop-Matrix nach Gegner-Archetyp (Standard/Schütze/Zauberkundig/Bruiser/Elite/Boss), Entscheidungsvorlage Zubehör-Aspektsplitter (Option A = craftbar, +6 Splitter, empfohlen) — **wartet auf Nutzer-Review**, danach Übertrag in §8.5/§5.8 + `data/materials.json`
- **Nutzer-Brainstorming „Game Modi & Map-Design" geprüft und eingearbeitet** (hochgeladenes Dokument, vorab auf Widersprüche zum GDD-Stand geprüft, drei Klärungsfragen gestellt und vom Nutzer beantwortet):
  - **Gefechtstypen & Map-Größen neu definiert (§5.1)**: Skirmish (~10×10–12×12, Elimination), Basecamp (20×20, Angriff/Verteidigung), Flaggenraub/„Capture the Flag" (NPC-Flaggenträger + begrenzte gegnerische Nachschub-Reserve statt Respawn, Zeitbonus). **Klärung nötig, weil das Brainstorming Basecamp/Skirmish fälschlich als „bestehende Modi" bezeichnete** — Nutzer bestätigt: alle drei sind **reines PvE** (Gefechtstyp-Bausteine für Kampagnen/Aufträge/Endlos-Modus), kein eigener PvP-Modus
  - **Endlos-Modus ausgebaut (§9.6)**: Wellen-Struktur (min. 5 zum Abschluss, Abbruch ohne Loot-Mitnahme), Regionswahl-Verzweigung (2 Richtungen am Anfang → 3 ab Tiefe X: Bergminen/Ebene/Schlachtfeld) mit variabler Event-Häufigkeit pro Region, Meta-Progression (Run ab Welle 5 verlassen zum Craften), Schadensskalierung als Tank-Meta-Bremse. Roguelike-Perk-Auswahl bewusst verworfen (Buff-Pool-Balance-Problem)
  - **Speed-Werte im Brainstorming wichen von §5.1 ab** (dort „Speed 1 = 1 Pkt/Tick, Minimum 0,5" vs. GDD „Speed×10 Pkt/Tick, kein harter Floor) — Nutzer bestätigt §5.1 bleibt Single Source of Truth, keine Änderung an den Speed-Formeln
  - **Wichtige Revision:** Die bisherige Endlos-Modus-Regel „Orks droppen keine Magie" (physischer Loot-Pool) ist **aufgehoben** — Nutzer-Klarstellung: Loot soll generell auch magische Gegenstände enthalten, „Orks haben keine Magier" wurde verworfen. Nachgezogen in §9.6, §5.8 (Crafting-Umwandlung-Begründung + Essenzen-Drop-Zeile), §8.5 (Lex-Rubrik-1-Essenzen-Hinweis)
- **GDD → v0.24**
- PR **#23** (`claude/phase-0-planning-3qnda3`) gepusht — wartet auf Merge durch den Nutzer; PR-Aktivität wird beobachtet (Subscription aktiv)

Sitzung davor (2026-07-11 — **Review-Nacharbeit + Lex-Ausbau + Gravuren-System/-Katalog + Initiative-Modell**, PR **#21** offen `claude/sonnet-review-improvements-lqb5io`):
- **Review des Sonnet-Stands** (PRs #17–#20): Design & Daten geprüft — konsistent (Kriegsgeräte-WID-Tier, Datei-Versionen, §5.2/§5.4-Verweise). **§5.4 geglättet**: „~Level 25"-Marke für Attributsnodes entkoppelt (mathematisch inkonsistent mit „1 Punkt/Level"), stattdessen Leitplanke **WID soll die 100er-Marke (50 % Reduktion) erst spät überschreiten**. **GDD → v0.23**
- **Lex Tactica (§8.5) von Konzept zu Struktur+Grundstock ausgebaut**: 7 Rubriken (Materialien · Bauteile & Prägungen · Ausrüstung · Gravuren · Bestiarium · Kampf-Kodex · Welt & Lore), knappe-Wiki-Card-Template, Freischaltung „Entdeckung" (automatisch bei Erstbegegnung; Bestiarium progressiv). Befüllt: Barren-Stufen, **vollständige Aspektsplitter-Liste** (16 Waffen + 12 Offhands + 5 Rüstungs-Archetypen + 5 Gravurtypen; Zubehör offen; Namensregel „Item-Identität + Aspektsplitter"), **4 Essenzen mit Namen** (Pyros/Kryos/Gaios/Fulguros — gr./lat., Nutzer-Wahl), 12 Crafting-Rohlinge, Kampf-Kodex (spiegelt §5.2). §5.8 präzisiert: Rüstungs-Slot kommt vom Basis-Bauteil (Geschirr/Haube/Riemen), Archetyp vom Aspektsplitter (nicht „Slot-Aspektsplitter")
- **Gravur-Schema (§5.7) komplett festgezurrt**: 4 Achsen **Klasse · Typ · Eigenschaft · Schadenstyp**. **Klasse = die 6 Attribute** (STR/GES/WIL/INT/VIT/WID, PoE-Gem-Analogon, deckt sich mit Skilltree-Sektoren §5.4). **Eigenschaft = 8 Wirkkategorien** (Schaden/Anhaltend/Verteidigung/Kontrolle/Mobilität/Ressource/Präsenz/Beschwörung, erweiterbar). **Revision:** jeder Typ kann jede Eigenschaft tragen (früherer „kein Vollkreuzprodukt"-Gedanke verworfen). **Visuelle Kodierung:** Form = Typ (Dreieck=Passiv, Raute=Aktiv, Pentagon=Modifikativ, Schild-Trapez=Reaktiv, Kreis=Spezial, **Hexagon=Flex-Slot**), Farbe = Attribut (6er-Palette, Richtwerte hinterlegt)
- **Gravuren-Katalog begonnen** (`data/engravings.json` v0.3, self-contained): **STR + GES vollständig** nach altem Muster (16 Basis + 1 Signatur, Wirkungstexte mit Level-Werten inline, ausgewogene Typ-Verteilung, 2 Kontrast-Gravuren pro Eigenschaft). GES-Signatur **Klingentanz** = Dolch-GES-Schadensskalierung (Nutzer-Wunsch, GES statt STR weil GES-skaliert)
- **Struktur-Revision Gravurenpalette (Nutzer-Wunsch):** künftig **3 pro Typ (Aktiv/Passiv/Reaktiv/Modifikativ) + 1 Signatur = 13 pro Attribut** (kein Aktiv-/Passiv-Fokus, quer über die Eigenschaften). **`docs/gravuren_vorschlag.md` erstellt** — Vorschlag für **alle 6 Paletten** (78 Gravuren) als Arbeitsdokument; **wartet auf Nutzer-Review** (korrigieren/ergänzen), danach Übertrag in `engravings.json` (Umstellung STR/GES vom 17er- aufs 13er-Schema) + Lex-Rubrik 4
- **Initiative-System vereinheitlicht (§5.1, Nutzer-Klarstellung):** **Punkte-Leisten-Modell** — jede Einheit hat eine Leiste 0→100, füllt sich pro Tick um **Speed-Wert** Punkte (Speed = Füllrate; Richtwert ×10), bei 100 ist man dran (−100, Überschuss bleibt); Gleichstand: wer noch nicht gezogen hat → höhere Geschwindigkeit. **Alle Initiative-Effekte ziehen jetzt feste Punkte ab** (Eis-Zusatzeffekt −20, Gravur Erschütternder Hieb −10/−20/−30, Schildstoß) statt „Plätze zu verschieben"; Signalhorn „Sammeln" = +Füllrate. In §5.1/§5.2/§8.5/engravings/CLAUDE.md durchgezogen
- PR **#21** (`claude/sonnet-review-improvements-lqb5io`) offen — wartet auf Nutzer-Review des Gravuren-Vorschlags; PR-Aktivität wird beobachtet (Subscription aktiv)

Sitzung davor (2026-07-09 — **Skilltree-Struktur-Grundlage + Elementarschaden-Feinschliff**, PR #20 gemergt, PR #19 zwischenzeitlich gemergt):
- **Skilltree-Struktur als Grundlage designt** (§5.4): radialer Baum mit 6 Attribut-Sektoren (STR/GES/WIL/INT/VIT/WID), klassenabhängige Einstiegspunkte, Attributs-/Notable-/Keystone-Nodes, Punkte-Ökonomie (1 Punkt/Level, Wegkosten erzeugen die §5.3-Progressionskurve), Frühgame-Führungspfad, weiche Kombo-Gates über Keystone-Kosten (löst die offene Attributsvoraussetzungs-Frage aus §5.3), Respec (frei bis Level 15, danach kostenpflichtig). Alten Widerspruch in §5.4 aufgelöst („eigener Skilltree pro Klasse" stand im Widerspruch zum universellen Baum aus §5.3). Offen: Notable-/Keystone-Listen pro Klasse, Godot-Umsetzung (Yggdrasil)
- **Elementar-Durchdringung entschieden**: kein eigener Stat — RD ist bereits generisch formuliert und wirkt auf Elementardiffusion genauso wie auf Rüstung/Resistenz (spiegelbildlich zu WID: eine Durchdringung, drei Ziele). Dedizierter Elementar-Piercing-Waffentyp bewusst vertagt, bis Element-/Themen-Set-Ausrüstung existiert
- **Magisch-Fernkampf-Formel final entschieden** (löst die im Schadenstyp-Audit vertagte Diskussion ab): WIL+WIL bleibt reichweitenunabhängig, kein Trefferchance-Falloff, Zauberwaffen-Reichweite bleibt bei 3 — Ausgleich zwischen Fernkampf-/Frontline-Magier läuft über den Skilltree-Pfad, nicht über eine neue Formel
- **Elementare Zusatzeffekte final designt** (§5.2, nach intensiver Diskussion inkl. externem Feedback aus drei Quellen): Rollen-Rahmen mit zwei Achsen — Schaden (Feuer=Offensiv/Fokus, Donner=Ausbreitung/Streuung) und Kontrolle (Eis=Zeitlich, Natur=Räumlich). Deterministischer Trigger „jeder 3. Elementartreffer desselben Typs" (bewusst kein Prozent-Proc, konsistent mit der bestehenden Trefferchance-Doktrin); DoT-Ticks (Brennen, Gift, In Brand gesteckt, Giftnebel) zählen bewusst NICHT zum Zähler. Vier finale Effekte nach zwei Korrektur-Runden: **Feuer** appliziert 1 Stapel Brennen (bewusster Regelbruch gegen das ursprüngliche „kein Statuseffekt"-Prinzip — akzeptiert, weil eine bestehende Mechanik wiederverwendet statt neu erfunden wird; löst das „Verpuffen"-Problem der ursprünglichen Nachbarfeld-Splash-Idee), **Donner** springt auf ein Ziel innerhalb fix 2 Feldern um das ursprüngliche Ziel (unabhängig von der Waffenreichweite des Angreifers — sonst wäre Kettenblitz für Nahkämpfer mit Donner-Waffen praktisch tot), **Eis** zieht dem Ziel feste Initiativepunkte von der Initiativeleiste ab (Richtwert −20, Punkte-Leisten-Modell §5.1; neue Achse, keine Kollision mit dem bestehenden Kälte-Status), **Natur** verankert das Ziel für dessen nächsten eigenen Zug. Zusatzeffekt ist Grundeigenschaft des Schadenstyps, nicht set-gebunden (sonst wäre der Elementar-Pfad vor dem Endgame tot)
- **Idee B (Elementar-Reaktionssystem, Genshin-artig) bewusst geparkt**: Idee A allein macht Elementarschaden schon interessant genug; zusätzliche Gegenargumente UI-/Tracking-Aufwand und Namenskollision mit „Reaktionen" (Gegenschlag/Parieren/etc.). Nicht verworfen, nur bei Bedarf später erneut aufgreifen
- Diskussionsgrundlage als separate MD-Datei (nur Chat, nicht committed) erstellt und per Datei-Versand geteilt, bevor die finalen Entscheidungen ins GDD wanderten
- **GDD → v0.22**
- PR **#20** (`claude/status-and-open-questions-39yyqc`) gepusht — wartet auf Merge durch den Nutzer; PR-Aktivität wird beobachtet (Subscription aktiv)

Vorherige Sitzung (2026-07-07 — **Schadenstyp-Audit + Kriegsgeräte-Neuordnung**, PR #19 gemergt):
- **Vollaudit „machen Effekte/Angriffe den richtigen Schaden & Schadenstyp?"** auf Nutzeranfrage durchgeführt: alle drei Schadenstypen (physisch/magisch/elementar), Rohschaden-Formeln, Statuseffekte und `weapons.json` durchgegangen
- **Gefundene & behobene Inkonsistenzen:**
  - **Magischer Rohschaden reichweitenunabhängig gemacht** (§5.2): Zauberstab/Energiesphäre haben `Reichweite 3`, es gab aber nur eine als „Nahkampf" benannte WIL+WIL-Formel. Entschieden: **eine** Formel gilt für Magie unabhängig von Reichweite (kein separates Fernkampf-Magisch, da Zauber-Fernangriffe seltener als Schützen-Angriffe) — als Platzhalter markiert, tiefere Diskussion vertagt
  - **`stat_skalierung`-Metadaten korrigiert**: Klassen-Defaults (`prim_attr`) stimmten bei Zepter/Stilett/Energiesphäre nicht mit den echten Item-Daten überein (keine „typabhängig"-Kennzeichnung wie bei `sek_attr`) — Stilett (GES) und Energiesphäre (INT) bestätigt als korrekt, nur Kriegsgeräte tatsächlich umstrukturiert (s. u.)
  - **Kriegsgeräte-Neuordnung entschieden** (§5.3): Hammer & Rammbock → Prim **WID** / Sek **STR** (physische Zäh-Bruiser); Zepter → Prim **WIL** (unverändert, bleibt voller Magie-Schadensträger) / Sek **WID** (statt INT) — bewusst kein 50/50-STR/WIL-Zepter (hätte neue Bonus-Formel gebraucht), stattdessen Zepter = „Battlemage" (Magie-Schaden voll + Zähigkeit statt Mana-Effizienz, verstärkt durch Manavampir). WID-Reihe überall 3/5/7/10/13/17/23 (Rüstungs-Prim-Tier, 2/5-Budget-konform). Umgesetzt in `weapons.json` (`stat_skalierung.Kriegsgeräte`, `waffentypen`, alle 21 Hammer/Rammbock/Zepter-Items) + `itemliste_v7.xlsx` (Waffen-, Stat-Skalierung-, Waffentypen-Sheet)
  - **„Zauberschaden"-Begriff geklärt** (§5.2): Boni wie Foliant/Energiekristall wirken auf den Rohschaden **vor** dem Elementar-Split — treffen also automatisch beide Anteile eines gemischten Zaubertreffers
  - **Statuseffekt-Harmonisierung entschieden** (§5.2, damit auch der offene §11-Punkt erledigt): Brennen + „In Brand gesteckt" → **Hitzeschaden** (Feuer, vorher physisch); Vergiftet/Gift + Giftnebel → **Terraschaden** (Natur, vorher magisch). Blutung bewusst unverändert (hälftig physisch/magisch, an physische Waffen gebunden, kein Element)
- **GDD → v0.19**
- Noch offen aus dem Audit: keine — alle vier besprochenen Punkte sind entschieden und eingetragen; damals neu offen (Elementar-Durchdringung, Magisch-Fernkampf-Formel) — beide in der Folgesitzung final entschieden (s. o.)
- PR **#19** (`claude/status-update-next-steps-6rcuwz`) **gemergt**

Vorherige Sitzung (2026-07-07 — **Schadenstyp Elementarschaden + Elementardiffusion**, PR #17 gemergt, GDD v0.18):
- **Dritter Schadenstyp Elementar eingeführt (§5.2)**, voll symmetrisch zu physisch/magisch: eigener Flat-Wert **Elementardiffusion** (wie Rüstung/Resistenz) + gemeinsame WID-%. **Vier Elemente**: Feuer→Hitzeschaden, Eis→Kälteschaden, Natur→Terraschaden, Donner→Elektroschaden (Element ≠ Schadensart, um Kollision mit Statuseffekten wie Brennen zu vermeiden); **ein globaler Diffusion-Wert** gegen alle vier
- **WID-Multiplikator-Ansatz („Elementarbann") verworfen**: erst als WID-Verstärker designt, nach Durchrechnen (Squishy/Tank-Beispiele, 70 Roh = 40 elem + 30 phys) auf **Flat-Symmetrie** umgestellt — konsistenter, für Spieler intuitiver, kein 0-WID-Degenerat
- **Abgrenzung magisch ↔ elementar** über bestehende Zauberschulen (§5.3): Chaos = magisch, Elementar = elementar — löst die Grenzfrage ohne Graubereich
- **Itemisierung / Tank-Vision (Nutzer-Entscheidung)**: „Pures Material"-Rüstung bleibt Rüstung/Resistenz-only (**kein JSON-Umbau**, alle Einträge Diffusion-frei); Elementardiffusion kommt über eine künftige **Element-/Themen-Set-Ausrüstung** — Stacking einer Achse (Platte→Rüstung, Robe-Set→Resistenz, Element-Set→Diffusion) = Spezial-Tank, bewusster Gear-Trade-off
- **Altlasten-Branches**: 17 alte Remote-Branches als gefahrlos löschbar identifiziert (alle gemergt ODER Inhalt nachweislich in `main` gerettet), aber Löschen scheitert an Proxy-403 + fehlendem Branch-Delete-MCP-Tool → **Nutzer muss die alten Branches manuell auf GitHub löschen**
- PR #17 (`claude/status-update-next-steps-my5ko4`) **gemergt**

Sitzung davor (2026-07-06 — **Crafting-Feinschliff**, PR #16, inzwischen gemergt):
- **Alle Ausrüstungskategorien craftbar** (Nutzer-Entscheidung, §5.8): Waffen, Rüstung und Offhands symmetrisch von Grund auf craftbar (ohne Gravuren, Stufe durch Barren gedeckelt); Zielslot bei Rüstung über einen Slot-Aspektsplitter im Grid gewählt
- **Bauteil-Tabelle verfeinert**: Rüstung nicht mehr eine gemeinsame Zeile, sondern **Geschirr** (Körper), **Haube** (Kopf), **Riemen** (Füße); dazu **Beschlag** für alle 12 Offhand-Typen. Waffen-Bauteile (Griff/Stichklinge/Axtblatt/Schlagkopf/Schaft/Stave/Fokuskern) und Prägung (Gravur) unverändert
- **Drop & Herkunft entschieden (§5.8)**: **Barren** farmbar (jeder Gegner, stufenabhängig) + garantiert aus Zerlegen; **Aspektsplitter** zusätzlich von bestimmten Einheiten + garantiert aus Zerlegen (Shop-Kauf offen → Phase 1); **Essenzen** selten/elite-/boss-gebunden (Region 1/Orks bewusst ohne Elementfokus, deckt sich mit §9.6 „kein Magie-Loot"); Skalierung nach **Gegner-Stufe und Archetyp** (z. B. Bogenschützen droppen bogenrelevante Materialien); **kein zusätzliches Drop-Pity** nötig — die garantierte Level-Ende-Loot-Truhe (§9.4) reicht aus
- **Neues Konzept: Lex Tactica (§8.5)** — das große Buch des Protagonisten, funktional das interne Spiel-Wiki (Material-/Elementliste, Item-/Gravuren-Katalog, Bestiarium, Lore); Struktur/Freischalt-Logik/UI noch offen
- **Verbleibender Phase-0-Abschlusspunkt**: konkrete **Elementliste** + vollständige **Materialliste** ausarbeiten (Grundlage für Lex Tactica) — Herkunfts-Prinzipien stehen, Inhalte fehlen noch
- **Zwei Ideen für Phase 1 vorgemerkt**: Ressourcen-Minispiel/Gamemodus (Material-Golems in Minenregion bzw. Warframe-artiges Trupp-Expeditionssystem); Frage ob Aspektsplitter im Shop kaufbar sind (→ Shop-System-Design)
- PR #16 (`claude/crafting-system-review-dpwywf`) aktualisiert und gepusht — **wartet auf Merge durch den Nutzer**; PR-Aktivität wird beobachtet (Subscription aktiv), stündlicher Selbst-Check eingerichtet

Vorherige Sitzung (2026-07-05 — **Crafting-System „Resonanz-Matrix"**, Phase-0-Punkt „Crafting-Details" erledigt):
- **Crafting-System komplett designt (GDD §5.8)**: nicht-deterministisch, Grid-basiert — „man kauft eine Verteilung, kein Item". Kernelemente: **Zerlegen** → Barren (Materialstufe) + Aspektsplitter (Waffen-/Gravurtyp) + Essenzen (Elemente); **Umwandlung 3:1** pro Sorte (schließt Doppel-RNG, nötig wegen regionsgebundener Loot-Pools); **Aufstufung 7:1** (endet bei Adamant — Kosmiumbarren nur aus zerlegten Kosmium-Items); **3×3-Grid** an der Schmiede (Start: Ecken gesperrt/Plus-Form, Schmiede-Ausbau schaltet frei), Mitte = Bauteil/Prägung bestimmt Output, Randfelder lenken über 3 Achsen (Element/Typ/Stufe), gegenüberliegende Paare = Resonanz ×2, voller Ring = Chance +1 Seltenheit; **Lenkungs-Deckelung ~75 %**; **Live-Verteilungs-Vorschau = PFLICHT** (keine versteckten Quoten); **Pity** über Duplikat-Zerfall (Duplikate → Splitter + Kategorie-Zähler, nach X garantiert neue Gravur) + Untergewichtung besessener (×0,5) + Resonanzladung (pro Kategorie × Seltenheitsstufe); **Verbessern** = einziger deterministischer Vorgang (+1 Stufe, max. 1×/Item, Kosmium ausgenommen, Kosten: Barren Zielstufe + Bauteil, gilt auch Rüstung/Offhands); **craftbar:** komplette Waffen (ohne Gravuren) + Gravuren (nur L1) + Verfeinerungskerne + Bauteile; **nie craftbar:** Stellar & Spezial-/Signatur-Gravuren; Umschmieden von Eigenarten bewusst gestrichen (ggf. Phase 1+)
- **Bauteil-Namen entschieden**: Griff (Schwerter), Stichklinge (Stichwaffen), Axtblatt (Äxte), Schlagkopf (Kriegsgeräte), Schaft (Stabwaffen), **Stave** (Bogenwaffen), Fokuskern (Zauberwaffen), **Geschirr** (Rüstung, alle 3 Slots), **Prägung** (Gravur-Rohling) — Benennung nach Item-Namensregel („Stahl-Griff", „Kosmium-Prägung")
- **Diamant → Kosmium umbenannt** (Stufe-6-Material; „Diamantbarren" funktioniert nicht, Kosmium schlägt Brücke zu Stellar): alle 5 Daten-JSONs (weapons v8.1, offhands + 3× Rüstung v1.4), Excel (107 Zellen), GDD, CLAUDE.md
- **Stellar-Verfeinerung = 3×** entschieden (Platzhalter in §5.7 aufgelöst, deckt sich mit Datenstand)
- Offene Crafting-Detailfragen in §11: Rüstungs-Craft von Grund auf bestätigen, Offhand-Bauteil benennen, Essenzen-Quellen final
- Draft-PR auf Branch `claude/crafting-system-review-dpwywf` — **wartet auf Merge durch den Nutzer**

Frühere Sitzungen:
- **Stellar-Kalibrierung (2026-07-04, PR #15 gemergt — Phase-0-Punkt „Stufe-7-Waffen" erledigt):**
  - **Stufe-7-Waffen (Stellar) kalibriert** (`weapons.json` **v8** + Excel, GDD §5.3 „Waffensystem — Stellar-Stufe"): Prim-Reihen fortgeschrieben ~×1,35 (62→**84**, 74→**100**, 52→**70**; Sek analog 38→52, 28→38, 40→54, 52→70); Slots = 5 wie Kosmium, **Grundkapazität +2 über Kosmium** (Basis 9/11/12 je Klassengruppe — der Stellar-Unlock für L4/L5-Signatur-Gravuren), Verfeinerung 3×; Verkauf 1000, kein Kaufpreis (nur Loot/Craft)
  - **Stellar-Eigenarten ✦**: Typ-Eigenart bleibt, verstärkt (z. B. Frontmann +15→25 %, Dopplereffekt 2×65→2×80 %, Kriegsarmbrust 50→75 % RD; volle Tabelle §5.3); in `waffentypen` als `stellar_eigenart`/`stellar_eigenart_effekt`, Zahlen Balancing-Vorbehalt
  - **Lichtresonanz** (verstecktes Story-Flag): alle S7-Waffen tragen `Lichtresonanz: true` — Stellar-Licht durchdringt die Schattenrüstung der Endfraktion; NICHT auf der Item-Karte, Interaktionsregel folgt beim Story-/Endfraktions-Design (Phase 1); Erklärung in `meta.lichtresonanz`
  - **Sek-WID eingedampft** (Budget-Ausnahme aufgelöst, rückwirkend S1–7): **Jagdbogen & Langbogen Sek WID→STR** (Nutzer-Entscheidung: alle Bogenwaffen = GES/STR, Werte-Reihe unverändert); **Hammer** als einzige WID-Waffe auf Körper-Rüstungs-Tier **3/5/7/10/13/17/23** (statt 6…40), als `sek_wid_werte` hinterlegt
  - **Zepter → Zweihand (B)** (Nutzer-Entscheidung; GDD sagte schon B, Einträge standen auf E): alle 7 Stufen Hand=B, Grundkapazität mit Zweihand-Bonus = 2/3/4/7/8/9/**11**
  - Excel-Altlast bereinigt: Stat-Skalierung-Sheet Zeile „Dolche"→„Stichwaffen"; Waffentypen-Sheet um Stellar-Eigenart-Spalten ergänzt; Kriegsgeräte-Sek als „typabhängig" + eigene WID-Zeile
  - **Zielplattform entschieden (GDD §10.5)**: **PC/Steam primär (Windows + Linux), Steam Deck als explizites Ziel** (verified anstreben); Referenz 1920×1080, UI lesbar auf 1280×800, Integer-Scaling; Controller gleichwertig ab Godot-MVP. **Android = fest geplanter Post-Release-Port** (Genre passt zu Touch, aber Markt ~95 % F2P → PC-first wie Genre-Vorbilder) mit 3 verbindlichen Phase-1-UI-Regeln: Input-Abstraktion Maus/Controller/Touch über eine Grid-Cursor-Logik, keine Info nur hinter Hover, UI-Skalierung + flexible Auflösung von Anfang an. Kein Ziel: Konsolen (nur via Porting-Partner, später), Web nur für Demos. **Phase-0-Punkt „Zielplattform" erledigt**
  - Draft-PR **#15** (`claude/next-steps-planning-9xa685`) — Stellar-Kalibrierung + Zielplattform, **gemergt** (2026-07-04)

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

1. **Gravuren-Katalog fertigstellen** — Schema **✅ komplett** (Klasse=6 Attribute, Typ, Eigenschaft=8 Wirkkategorien, Schadenstyp; visuelle Kodierung Form/Farbe, §5.7). **Nächster konkreter Schritt:** Nutzer reviewt `docs/gravuren_vorschlag.md` (alle 6 Paletten, 13er-Schema) → danach in `data/engravings.json` übertragen (STR/GES von 17er- auf 13er-Schema umstellen) + Lex-Rubrik 4 (§8.5) befüllen + §5.7-Leitlinie auf „3 pro Typ + 1 Signatur" nachziehen.
2. **Lex Tactica weiter befüllen** (§8.5): Rubrik 3 (Item-Katalog aus JSONs einziehen), Rubrik 4 (Gravuren, s. o.), Flavor-Texte je Eintrag; Rubriken 5 (Bestiarium) + 7 (Lore) hängen an Gegner-/Welt-Design.
3. **Vollständige Materialliste ausarbeiten** (§5.8/§8.5) — Barren-Stufen + Aspektsplitter-Liste + 4 Essenzen (Pyros/Kryos/Gaios/Fulguros) stehen im Grundstock (Lex-Rubrik 1); es fehlen Flavor/Detail + evtl. eine echte `.xlsx`.
4. **Element-/Themen-Set-Ausrüstung designen** (§5.2) — einzige Quelle für Elementardiffusion.
5. **Skilltree-Notable-/Keystone-Listen pro Klasse ausarbeiten** — Grundstruktur steht (§5.4); danach Umsetzung in Godot (Yggdrasil) = Start Phase 1.
6. **Nebenbei:** Charakter-Sprites generieren (Pixellab.ai-Prompt unten).

> PRs #16/#17/#19/#20 **und #21** (diese Sitzung) sind gemergt. Von den Phase-0-Kriterien sind noch **Gravuren-Katalog** (in Arbeit — STR/GES fertig, Vorschlag für die restlichen 4 + Struktur-Umstellung wartet auf Review), **Element-/Materialliste** (Grundstock in Lex steht) und **Skilltree-Notable/Keystone-Listen** offen.  
> **Aufräum-ToDo für den Nutzer:** 17 alte Remote-Branches sind gefahrlos löschbar (alle gemergt oder Inhalt in `main` gerettet), aber Claude kann sie nicht löschen (Proxy-403 + kein Branch-Delete-Tool) — bitte manuell auf GitHub entfernen.

## Dateistruktur

| Datei | Inhalt |
|-------|--------|
| `GDD.md` | Einziges Designdokument |
| `data/weapons.json` | Waffendaten (**v8.2, vollständig kalibriert inkl. Stufe 7/Stellar; Diamant→Kosmium 2026-07-05; Kriegsgeräte-Neuordnung 2026-07-07**): Seltenheitsstufen, Klassen, Typen+Eigenarten (inkl. `stellar_eigenart`/`stellar_eigenart_effekt`), Stat-Skalierung (S7 befüllt, `stat_skalierung.Kriegsgeräte` mit `werte_wid_tier`/`werte_str_tier`/`werte_wil_tier` für Hammer/Rammbock/Zepter), Slot-Templates, 112 Einzelwaffen (7 Stufen × 16 Typen, S7 mit `Lichtresonanz: true`), Gravuren; Bogenwaffen mit `Reichweite optimal`/`Reichweite max`, alle Bögen GES/STR, Zepter = B |
| `data/offhands.json` | Offhand-Daten (v1.4, **kalibriert**, Kosmium-Umbenennung): Seltenheit, Gewichtsklassen, Gravuren, `offhandtypen` (12, inkl. `material_form`/`genus`), `stat_skalierung` (3/5/7/10/14/18/24), **84 Einträge** (12 Typen × 7 Stufen, inkl. Stellar) |
| `data/kopfausruestung.json` | Kopf-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Zielvisier, Diadem), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, **v1.4 kalibriert** (Kosmium-Umbenennung 2026-07-05) |
| `data/koerperausruestung.json` | Körper-Slot: `ruestungstypen` (5 Rüstungs-Archetypen) + `zubehoer_typen` (2: Köcher, Buchrolle = Gimmicks ohne Defensivwerte), **49 Einträge** (35 Rüstung + 14 Zubehör) — **v1.4 kalibriert** (Kosmium-Umbenennung 2026-07-05) |
| `data/fussausruestung.json` | Fuß-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Steigeisen, Windsohle), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, `MOB-Bonus`-Feld, **v1.4 kalibriert** (Kosmium-Umbenennung 2026-07-05) |
| `data/engravings.json` | **Gravuren-Katalog (v0.3, self-contained Coding-DB)**: `attribut_klassen` (6, mit Farben), `gravur_typen` (5, mit Formen) + `flex_slot` (Hexagon), `eigenschaften` (8), `seltenheit`, `item_schema` + `gravuren`. **STR + GES vollständig** (je 16 Basis + 1 Signatur nach altem 17er-Muster). **Achtung:** wird auf das neue 13er-Schema (3/3/3/3 + 1 Signatur) umgestellt, sobald `docs/gravuren_vorschlag.md` freigegeben ist |
| `docs/gravuren_vorschlag.md` | **Arbeitsvorschlag** aller 6 Gravur-Paletten (13 je Attribut = 3 Aktiv/3 Passiv/3 Reaktiv/3 Modifikativ + 1 Signatur, 78 gesamt) — **wartet auf Nutzer-Review**; danach Übertrag in `engravings.json` + Lex-Rubrik 4 |
| `docs/materialliste_vorschlag.md` | **Arbeitsvorschlag** vollständige Materialliste (2026-07-11): Flavor für 7 Barren + 38 Aspektsplitter + 4 Essenzen + 12 Bauteile, Drop-Leitprinzip „Der Drop spiegelt den Träger", Level-Bänder, Drop-Matrix nach Gegner-Archetyp, **Entscheidungsvorlage Zubehör-Aspektsplitter** (Option A = craftbar, +6 Splitter, empfohlen) — **wartet auf Nutzer-Review**; danach Übertrag in GDD §8.5/§5.8 + `data/materials.json` |
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
| Endlos-Modus | **Ausgebaut (2026-07-12, §9.6):** Ab Kampagne 10, Wellen-basiert (min. 5), Skirmish-Gefechtstyp; Regionswahl-Verzweigung Bergminen/Ebene/Schlachtfeld mit variablen Events, Meta-Progression (Run ab Welle 5 verlassen zum Craften), Schadensskalierung gegen Tank-Meta. Loot-Pool regionsgebunden, aber **nicht mehr auf physisch beschränkt** — „Orks droppen keine Magie" wurde revidiert |
| Gefechtstypen | **Neu (2026-07-12, §5.1):** Skirmish (Elimination, **12×12**, kompakt 8×8), Basecamp (Angriff/Verteidigung, 20×20), Flaggenraub (NPC-Eskorte, begrenzte Gegner-Nachschub-Reserve statt Respawn) — alle drei reines PvE, Bausteine für Kampagnen/Aufträge/Endlos statt eigener Modus. **Alle Map-Kantenlängen = Vielfache von 4** (für 4×4-Chunk-Wiederverwendung, s. u.) |
| Map-Chunk-Generierung | **Neu (2026-07-12, §9.6):** Endlos-Maps deterministisch-prozedural aus hand-gebauten **4×4-Chunks** (12 & 20 durch 4 teilbar → gleiche Bibliothek für Skirmish 12×12=3×3 & Basecamp 20×20=5×5); optionale 4×8/8×8-Prefabs (zuerst platzieren). Tür-Konvention (mittlere 2 Zellen je Kante begehbar → immer verbunden) + Flood-Fill-Check; Positions-Rollen Innen/Rand/Ecke (Rotation deckt Orientierungen); region-agnostisch gebaut; Gefahren-Dichte ≤25–30 %, Anti-Barriere-Häufung; Seed pro Run. Kampagnen/Basecamp = Handbau. Assembler/Chunk-Format → Phase 1 |
| Gelände-Funktionstypen | **Neu (2026-07-12, §5.1):** 8 regionsunabhängige Feld-Funktionstypen, Trennung Funktions-/Darstellungsschicht (gleiche Funktion, region-spezifisches Tile-Bild). **Boden** (begehbar, Kosten 1,0) · **Dickicht** (1,5) · **Pfad** (0,5) · **Fluss** (unbegehbar, driftet nur bei Push/Pull 1 Feld flussabwärts + Straucheln §5.2) · **Barriere** (unbegehbar, unzerstörbar) · **Blockade** (unbegehbar, zerstörbar → wird Boden, LP `[Balancing]`) · **Effekt-Feld** (begehbar, Trigger für Endlos-Events §9.6 / Feld-Statuseffekte §5.2) · **Deckung** (begehbar, versetzt Einheit in „Scheinbar" §5.2, Aufdecken ≤2 Felder). MOB = **Bewegungspunkte-Budget** (Bruchkosten 0,5/1,0/1,5). **Tileset-Custom-Data verdrahtet (2026-07-12):** `generate_tileset.py`/`.tres` tragen jetzt `field_type`+`conceals`+`destructible`+`hp`, `move_cost`→Float; bestehende Tiles auf boden/dickicht/pfad/fluss/barriere gemappt (deckung/blockade/effekt = eigene Optik folgt). `flow_dir`/`effect_id` = pro Zelle (Chunk-Daten, nicht Tileset). BFS-Float-Umstellung → Phase 1 (§10.1) |
| Trupp-Größe | Standard: 3 Einheiten |
| Max Level | 50 — linear bis ~25, straff ab 35, Level 46–50 ggf. challenge-gegattet |
| Schutz vs. Schild | Absorptions-Zauber = „Schutz"; Ausrüstung = „Schild" (gilt überall inkl. Gravuren) |
| Attribute | WIL, INT, VIT, WID, STR, GES — alle 3 Buchstaben Caps |
| Schadensreduktion | 3 Hebel: **WID** = prozentual (`WID/(WID+100)`, alle 3 Typen), **Rüstung/Resistenz/Elementardiffusion** = flacher Abzug pro Treffer (physisch/magisch/elementar, Squishy≈0), **RD** = Rüstungsdurchdringung (prozentual, senkt nur den Flat-Wert). WIL bleibt rein offensiv. Multi-Hit = höherer Gesamt-Rohschaden |
| Schadenstyp Elementar | **3. Schadenstyp** (§5.2, 2026-07-07), voll symmetrisch: eigener Flat-Wert **Elementardiffusion** (wie Rüstung/Resistenz) + gemeinsame WID-%. 4 Elemente: Feuer→Hitze, Eis→Kälte, Natur→Terra, Donner→Elektro (ein globaler Diffusion-Wert gegen alle 4). Abgrenzung: elementar = Elementarschule/Element-Anteile, magisch = Chaosschule. **Diffusion nur über künftige Element-/Themen-Set-Ausrüstung** — „Pures Material"-Rüstung bleibt Rüstung/Resistenz-only (kein JSON-Umbau). WID-Multiplikator-Ansatz („Elementarbann") verworfen zugunsten Flat-Symmetrie |
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
| Attributs-Split | **2/5 aus Rüstung : 3/5 aus Skilltree** (Annahme ~70 Punkte pro fokussiertem Attribut über Attributsnodes) — Voll-Set (Körper+Kopf+Füße) auf ein Attribut = 47 auf Stufe 7. Bewusste Ausnahmen: WID-Offhands (Turmschild/Fester Gürtel) außerhalb des Budgets; Waffen-WID (Hammer/Rammbock Prim, Zepter Sek) auf den Rüstungs-Prim-Tier gedeckelt, s. „Kriegsgeräte-Neuordnung" (§5.3) |
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
| Stellar-Waffen (S7) | **Kalibriert (2026-07-04, §5.3 „Stellar-Stufe"):** Prim 84 (62er-Reihe) / 100 (Kampfaxt) / 70 (52er-Reihe), Sek analog (52/38/54/70); 5 Slots wie Kosmium, **Grundkapazität +2 über Kosmium** (Basis 9/11/12 je Klassengruppe = Unlock für L4/L5-Signatur-Gravuren), B-Waffen nochmal +2; Verfeinerung 3×; **Stellar-Eigenart ✦** = verstärkte Typ-Eigenart (Tabelle §5.3); verstecktes Flag `Lichtresonanz: true` — durchdringt Schattenrüstung der Endfraktion, nicht auf Item-Karte, Regel folgt beim Story-Design (Phase 1); kein Kaufpreis (nur Loot/Craft), Verkauf 1000 |
| Bogen-Sekundärattribut | **Alle Bogenwaffen GES (prim) / STR (sek)** (2026-07-04): Jagd- & Langbogen von WID auf STR umgestellt (Werte-Reihe unverändert) — passt zur Fernkampfformel GES×0,75 + STR×0,25 |
| Kriegsgeräte-Neuordnung | **Entschieden (2026-07-07, §5.3, ersetzt die frühere „Sek-WID-Eindampfung"):** Hammer & Rammbock = Prim **WID** / Sek **STR** (physische Zäh-Bruiser); Zepter = Prim **WIL** (unverändert, zählt voll in Magisch-Nahkampf-Formel) / Sek **WID** (statt INT) — Zepter bleibt voller Magie-Schadensträger und wird zusätzlich zäh („Battlemage", verstärkt durch Manavampir). WID-Reihe überall 3/5/7/10/13/17/23 (Körper-Rüstungs-Prim-Tier, 2/5-Budget-konform), egal ob Prim- oder Sek-Slot. In `weapons.json` unter `stat_skalierung.Kriegsgeräte` (`werte_wid_tier`/`werte_str_tier`/`werte_wil_tier`) |
| Zepter | **Zweihand (B), alle 7 Stufen** (2026-07-04): +35 %-Anzeige-Bonus greift, Grundkapazität 2/3/4/7/8/9/11 (Dateneinträge standen vorher fälschlich auf E; GDD sagte schon immer B). Attribute: s. „Kriegsgeräte-Neuordnung" |
| Magischer Rohschaden (Reichweite) | **Final entschieden (2026-07-09, §5.2):** Eine Formel (WIL+WIL) für Magie-Angriffe unabhängig von Reichweite — deckt auch Zauberstab/Energiesphäre (Reichweite 3) ab. Bewusst kein separates Fernkampf-Magisch und kein Trefferchance-Falloff; Zauberwaffen-Reichweite bleibt bei 3. Ausgleich Fernkampf-/Frontline-Magier läuft über den Skilltree, nicht über eine neue Formel |
| Skilltree-Struktur | **Grundlage entschieden (2026-07-09, §5.4):** Radialer Baum, 6 Attribut-Sektoren (STR/GES/WIL/INT/VIT/WID), klassenabhängige Einstiegspunkte, Attributs-/Notable-/Keystone-Nodes; Punkte-Ökonomie 1/Level, Wegkosten erzeugen die Progressionskurve; Frühgame-Führungspfad; starke Kombos über Keystone-Kosten statt harter Attributsvoraussetzungen gedeckelt; Respec frei bis Level 15, danach kostenpflichtig. Offen: Notable-/Keystone-Listen pro Klasse, Godot-Umsetzung |
| Elementar-Durchdringung | **Entschieden (2026-07-09, §5.2):** Kein eigener Stat — RD ist generisch und wirkt auf Elementardiffusion genauso wie auf Rüstung/Resistenz. Dedizierter Elementar-Piercing-Waffentyp bewusst vertagt, bis Element-/Themen-Set-Ausrüstung existiert |
| Elementare Zusatzeffekte | **Final designt (2026-07-09, §5.2):** Rollen-Rahmen — Schaden-Achse (Feuer=Offensiv, Donner=Ausbreitung), Kontroll-Achse (Eis=Zeitlich, Natur=Räumlich). Deterministischer Trigger „jeder 3. Elementartreffer" pro Einheit (kein Prozent-Proc; DoT-Ticks zählen bewusst nicht mit). Effekte: **Feuer** → 1 Stapel Brennen (bewusster Regelbruch gegen „kein Statuseffekt", bestehende Mechanik wiederverwendet); **Donner** → Sprung auf Ziel innerhalb fix 2 Feldern um das Original (unabhängig von Waffenreichweite); **Eis** → −20 Initiativepunkte auf der Initiativeleiste (Punkte-Leisten-Modell §5.1; keine Kollision mit Kälte-Status); **Natur** → Verankerung fürs nächste Ziel-Zug. Zusatzeffekt an Schadenstyp gekoppelt, nicht an Sets. Elementar-Reaktionssystem (Idee B, Genshin-artig) bewusst geparkt — UI-Aufwand + Namenskollision mit „Reaktionen" |
| „Zauberschaden"-Begriff | **Geklärt (2026-07-07, §5.2):** Boni wie Foliant/Energiekristall („+X % Zauberschaden") wirken auf den Rohschaden **vor** dem Elementar-Split — treffen also automatisch beide Anteile (elementar + konventionell-magisch) eines gemischten Zaubertreffers |
| Statuseffekt-Elementtypen | **Entschieden (2026-07-07, §5.2):** Brennen + „In Brand gesteckt" → **Hitzeschaden** (Feuer, vorher physisch); Vergiftet/Gift + Giftnebel → **Terraschaden** (Natur, vorher magisch). Blutung bleibt hälftig physisch/magisch (an physische Waffen gebunden, kein Element) |
| Zielplattform | **PC/Steam primär: Windows + Linux, Steam Deck explizit** (verified anstreben); Referenz 1080p, UI lesbar auf 1280×800, Integer-Scaling, Controller gleichwertig ab MVP. **Android = geplanter Post-Release-Port** mit 3 Pflicht-UI-Regeln (Input-Abstraktion Maus/Controller/Touch, keine Hover-only-Infos, UI-Skalierung von Anfang an). Konsolen/Web kein Ziel (§10.5) |
| Kosmium | **Stufe-6-Material heißt Kosmium** (2026-07-05, vorher „Diamant") — umbenannt, weil Material-Ressourcen als **Barren** vorliegen („Diamantbarren" geht nicht); schlägt thematisch die Brücke zu Stellar. In allen JSONs + Excel + GDD durchgezogen |
| Crafting (§5.8) | **Resonanz-Matrix** (2026-07-05/06): nie deterministisch (einzige Ausnahme: Verbessern) — „man kauft eine Verteilung, kein Item". Zerlegen → **Barren** (Stufe) / **Aspektsplitter** (Typ) / **Essenzen** (Element); Umwandlung 3:1 pro Sorte; Aufstufung Barren 7:1, endet bei Adamant (Kosmiumbarren nur aus Kosmium-Loot). 3×3-Grid an der Schmiede: Mitte = Bauteil/Prägung (Output-Kategorie), Rand = Lenkzutaten, gegenüberliegende Paare = Resonanz ×2, voller Ring = Chance +1 Stufe; Start Plus-Form (Ecken via Schmiede-Ausbau); Lenkung gedeckelt ~75 %; **Live-Verteilungs-Vorschau = PFLICHT**. Pity: Duplikat-Zerfall + Kategorie-Zähler + Resonanzladung (pro Kategorie × Stufe). **Craftbar: ausnahmslos alle Ausrüstungskategorien** (Waffen, Rüstung, Offhands — ohne Gravuren, symmetrisch); nie: Stellar, Spezial-/Signatur-Gravuren. **Offen: Materialherkunft/Essenzen** (Drop/Farm/Zerlegung, Drop-Chancen, RNG-Anteil — §11) |
| Bauteile & Prägungen | Griff (Schwerter), Stichklinge (Stichwaffen), Axtblatt (Äxte), Schlagkopf (Kriegsgeräte), Schaft (Stabwaffen), **Stave** (Bogenwaffen), Fokuskern (Zauberwaffen), **Geschirr** (Rüstung Körper), **Haube** (Rüstung Kopf), **Riemen** (Rüstung Füße), **Beschlag** (alle 12 Offhand-Typen), **Prägung** (Gravur-Rohling); Benennung nach Item-Namensregel („Stahl-Griff", „Kosmium-Prägung") |
| Verbessern | Einziger deterministischer Crafting-Vorgang: +1 Materialstufe, **max. 1× pro Item**, Kosmium nicht verbesserbar (danach käme nur nicht craftbares Stellar); Kosten = Barren der Zielstufe + passendes Bauteil; gilt für Waffen, Rüstungen, Offhands (Offhand-Bauteil offen) |
| Stellar-Verfeinerung | **3×** (2026-07-05) — Platzhalter in §5.7 aufgelöst, wie alle Materialien ab Stahl |
| Initiative (§5.1) | **Punkte-Leisten-Modell** (2026-07-11, Nutzer-Klarstellung): jede Einheit hat eine Leiste **0→100**, füllt sich pro Tick um **Speed-Wert** Punkte (Speed = Füllrate, Richtwert ×10). Bei 100 ist man dran (danach −100, Überschuss bleibt). Gleichzeitig 100 → Vorrang, wer noch nicht gezogen hat; sonst höhere Geschwindigkeit. **Alle Initiative-Effekte ziehen feste Punkte ab** (Eis −20, Erschütternder Hieb −10/−20/−30, Schildstoß −10/20/30), keine „Plätze". Signalhorn „Sammeln" = +Füllrate |
| Gravur-Schema (§5.7) | **4 Achsen** (2026-07-11): **Klasse = 6 Attribute** (STR/GES/WIL/INT/VIT/WID, PoE-Gem-Analogon, = Skilltree-Sektoren), **Typ** (Aktiv/Passiv/Reaktiv/Modifikativ/Spezial), **Eigenschaft = 8 Wirkkategorien** (Schaden/Anhaltend/Verteidigung/Kontrolle/Mobilität/Ressource/Präsenz/Beschwörung, erweiterbar), **Schadenstyp**. **Jeder Typ kann jede Eigenschaft** (kein Vollkreuzprodukt-Verbot). **Visuelle Kodierung:** Form=Typ (Dreieck/Raute/Pentagon/Schild-Trapez/Kreis + **Hexagon=Flex**), Farbe=Attribut (STR Rot/VIT Bernstein/GES Grün/WID Türkis/INT Blau/WIL Violett) |
| Gravuren-Katalog | **`data/engravings.json`** (self-contained). STR/GES vollständig (altes 17er-Muster). **Struktur-Beschluss (2026-07-11):** künftig **3 pro Typ + 1 Signatur = 13 je Attribut**. Vollständiger Vorschlag aller 6 Paletten in `docs/gravuren_vorschlag.md` → nach Nutzer-Review übertragen + STR/GES umstellen. Signaturen: 1/Attribut, nicht craftbar |
| Essenzen (Namen) | **Pyros / Kryos / Gaios / Fulguros** (2026-07-11, gr./lat. Fantasy-Form) für Feuer/Eis/Natur/Donner; „&lt;Element&gt;-Essenz" bleibt Synonym. Herkunft: selten, elite-/boss-gebunden (§5.8/§8.5) |
| Aspektsplitter | **Namensregel: Item-Identität + „Aspektsplitter"** (2026-07-11, z. B. „Falchion-Aspektsplitter", „Plattenaspekt-Splitter"). Vollständig: 16 Waffen + 12 Offhands + 5 Rüstungs-Archetypen (Stoff/Leder/Kette/Schuppe/Platte) + 5 Gravurtypen; Zubehör offen. Rüstungs-**Slot** kommt vom Basis-Bauteil (Geschirr/Haube/Riemen), **Archetyp** vom Splitter (§5.8/§8.5) |
