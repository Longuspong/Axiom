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

## GDD-Stand (aktuell: v0.10)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid+Speed+MOB ✅, Kampfsystem+Rohschaden+Mana+Statuseffekte ✅, Trefferchance+Krit+Ausweichen ✅, Aggro/Threat ✅, Sichtsystem ✅, Klassen ✅, Attribute ✅, Bögen+Armbrüste ✅, Einhand/Zweihand+Offhands ✅, restl. Waffen/Skills ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ⚠️ Art Style ✅, Sprache/Plattform/Struktur fehlen |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt |

---

## Stand letzte Sitzung

Abgeschlossen in dieser Sitzung (2026-07-03 — Phase-0-Audit & Widerspruchsbereinigung):
- **Vollaudit aller Daten**: 112 Waffen + 84 Offhands + 147 Rüstungsteile rechnerisch gegen Skalierungstabellen geprüft — null Wertabweichungen
- **Neue Systeme definiert (GDD §5.2)**: Trefferchance (100 % Basis; Fernkampf-Falloff = Trefferchance, −30 %/Feld, Max-Reichweite = harte Grenze; Ausweichen Basis 0 %, nur aus Quellen), Krit (5 % Basis, ×1,5 Rohschaden, keine Backstab/Flanken-Kopplung), WID **kein Cap** (Formel selbstbegrenzend), Kälte-Reaktionsmalus **−10 %/Stapel**
- **Eigenarten-Grundregel**: niemals aktiv, immer passiv/reaktiv/automatisch. Umgestellt: Spruchrolle (auto alle 7 Züge: nächster Zauber gratis), Signalhorn „Sammeln" (auto alle 5 Züge), Windsohle neu = **„Aufwind"** (Zugbeginn ohne angrenzenden Gegner → +1 MOB); Fackel „Hetzjagd" final **+0,2 Speed**
- **Alle 21 Rüstungs-/Zubehör-Eigenarten abgesegnet** — `[Entwurf]`-Marker entfernt (Zahlenwerte bleiben Balancing-Vorbehalt)
- **Widersprüche bereinigt**: Bogen-Gewichtsklassen (Daten-Version gilt: Kriegsarmbrust Bedächtig, Jagdbogen Wendig, Langbogen Ausgeglichen), Krieger Σ80 = Absicht dokumentiert, Armbrüste bewusst identisches Distanzprofil, `stat_skalierung`-Schlüssel „Dolche"→„Stichwaffen", toter `rueckenausruestung`-Verweis korrigiert, Schütze-/Assassinen-Tabellen an reale Waffentypen angepasst, §11-ToDos dedupliziert & kategorisiert
- **weapons.json v7**: Bogenwaffen tragen jetzt `Reichweite optimal` + `Reichweite max` als strukturierte Felder (28 Einträge + 4 Typdefinitionen)

Frühere Sitzungen:
- Modulare Ausrüstungs-/Skilltree-Philosophie festgehalten (GDD §5.3): Jede Klasse kann alles, ein universeller Skilltree mit klassenabhängigem Einstiegspunkt, früh empfohlene Pfade ohne Zwang. Offen: Attributsvoraussetzungen für starke Kombos (in Evaluation)
- Einhand/Zweihand + Offhand-System definiert (GDD §5.3): Einhand = Offhand/Dualwield, Zweihand = kein Offhand, +35 % Grundwerte (mit weapons.json abzustimmen)
- `data/offhands.json` befüllt: 12 Offhand-Typen × 7 Stufen = 84 Einträge + `offhandtypen` + Platzhalter-`stat_skalierung`. Klassen: Schild (Buckler/Turmschild), Magischer Fokus (Foliant/Energiekristall), Hilfsmittel (Kampfkette, Laterne, Fester Gürtel, Fackel, Signalhorn, Standarte, Rauchschwenker, Köderkolben). Jedes Offhand: genau 1 Hauptattribut, Eigenart fest, Gravur-Slots bis Stahl 1 / ab Titan 2
- Zwei neue Systeme dokumentiert (GDD §5.2): Aggro/Threat (Formel, Hysterese, Decay, Taunt, Guard, Präsenz-Aggro) und Sichtsystem (3 Zustände Offenbar/Unsichtbar/Scheinbar)
- Waffenliste (112 Waffen) + `itemliste_v6.xlsx`; Scaffold-JSONs für Rüstung
- Speed-System, Initiative, Mobilität, Rohschaden-Formeln, Mana-System, Armbrüste aufgeteilt

## Was als nächstes kommt

1. **Offhand-Werte kalibrieren** (Prim.-Werte/Slot-Kapazitäten = Platzhalter) + Stufe-7-Offhands
2. **Rüstung kalibrieren** (Körper/Kopf/Füße: Defensiv-/Prim.-Werte = Platzhalter; Eigenarten sind final)
3. **Stufe-7 (Stellar) Waffenwerte** ausarbeiten (aktuell Platzhalter `0`)
4. **`itemliste_v6.xlsx` → v7 aktualisieren** (Offhands, Rüstung, Köcher/Buchrolle-Umzug fehlen in der Excel)
5. **Restliches Waffensystem** (Gravuren im Detail, Crafting, Aufwertung, Verfeinerung)

## Dateistruktur

| Datei | Inhalt |
|-------|--------|
| `GDD.md` | Einziges Designdokument |
| `data/weapons.json` | Waffendaten (v7): Seltenheitsstufen, Klassen, Typen+Eigenarten, Stat-Skalierung, Slot-Templates, 112 Einzelwaffen (7 Stufen × 16 Typen), Gravuren; Bogenwaffen mit `Reichweite optimal`/`Reichweite max` |
| `data/offhands.json` | Offhand-Daten: Seltenheit, Gewichtsklassen, Gravuren, `offhandtypen` (12, inkl. `material_form`/`genus`), `stat_skalierung` (Platzhalter), **84 Einträge** (12 Typen × 7 Stufen) |
| `data/kopfausruestung.json` | Kopf-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Zielvisier, Diadem), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, Platzhalter/Entwurf |
| `data/koerperausruestung.json` | Körper-Slot: `ruestungstypen` (5 Rüstungs-Archetypen) + `zubehoer_typen` (2: Köcher, Buchrolle = Gimmicks ohne Defensivwerte), **49 Einträge** (35 Rüstung + 14 Zubehör) — Platzhalter/Entwurf |
| `data/fussausruestung.json` | Fuß-Slot: `ruestungstypen` (5) + `zubehoer_typen` (2: Steigeisen, Windsohle), **49 Einträge** (35 Rüstung + 14 Zubehör) — ±0,20-Speed, `MOB-Bonus`-Feld, Platzhalter/Entwurf |
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
| Offhands | Klasse+Typ wie Waffen, aber KEINE Waffen (Gimmicks). Genau 1 Hauptattribut, Eigenart fest = Identität, Gravuren modular. Gravur-Slots: bis Stahl 1, ab Titan 2. Daten: `data/offhands.json` (84 Einträge, 12 Typen). Affinitäten = Empfehlung, frei kombinierbar. Köcher & Buchrolle liegen im **Körper-Slot** (`koerperausruestung.json`), nicht als Offhand — funktionieren so auch mit Zweihandwaffen. **Bewusster Trade-off:** Zubehör und Körperrüstung teilen sich einen Slot (entweder/oder) |
| Item-Namensregel | Reine Metallgegenstände: „`<Material> <Typ>`" (z. B. „Kupfer Buckler"). Nicht-Metall-Items (Pergament/Leder/Kristall/Holz) werden mit dem Seltenheits-Metall **beschlagen**/**bearbeitet**: „stahlbeschlagener Foliant", „kupferbearbeiteter Köcher". Adjektiv-Endung nach Genus (Nom.): m=-er, f=-e, n=-es. Steuerfelder pro Typ: `material_form` (pur\|beschlagen\|bearbeitet) + `genus` |
| Rüstungs-Attributswerte | Zwei Tiers (Prim.-Wert pro Stufe 1–6, Stufe 7/Stellar offen=0): **Primärslot Körper** = `6,10,14,20,27,35`; **Sekundärslot Kopf/Füße** = `3,5,7,10,14,18` (bewusst weniger als Körper). Defensivwerte = Basis × Archetyp-Multiplikator (Kopf/Füße ~60 % des Körpers). Alles Platzhalter-Vorschlag |
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
