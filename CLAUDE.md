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
- Direkt auf `main` pushen (kein PR-Overhead), außer der Nutzer sagt ausdrücklich etwas anderes
- **Nach jedem Commit:** `git commit --amend --no-edit --reset-author` + force push, damit der Stop-Hook nicht anschlägt
- Git-Config vor jedem Commit sicherstellen: `user.email = noreply@anthropic.com`, `user.name = Claude`

### Commit-Ablauf (immer so):
```bash
git config user.email noreply@anthropic.com
git config user.name Claude
git add GDD.md
git commit -m "..."
git commit --amend --no-edit --reset-author
git push origin claude/repo-access-permissions-l4kamm:main --force
git push origin claude/repo-access-permissions-l4kamm --force
```

---

## GDD-Stand (aktuell: v0.6)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid ✅, Klassen ✅, Attribute ✅, Waffen/Skills ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ⚠️ Art Style ✅, Sprache/Plattform/Struktur fehlen |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt |

---

## Daten-Pipeline (Items/Waffen)

**Single Source of Truth = JSON im Repo** (Option 1, mit Nutzer vereinbart).
Excel ist nur Bearbeitungs-/Balancing-Komfort, NICHT die Quelle.

| Datei | Inhalt | Stand |
|-------|--------|-------|
| `data/waffen.json` | Roh-Waffen (Pures Material, 100% Attribute) | ✅ 91 Einträge |
| `data/nebenhand.json` | Offhand-Items für Einhänder | ⏳ ausstehend |
| (später) `data/themen.json`, `data/gravuren.json` | Sets/Themen, Gravuren | ⏳ |

- Änderungen sagt der Nutzer durch → ich pflege sie direkt in die JSON ein.
- **Excel-Export:** `python3 tools/waffen_to_excel.py [datei.xlsx]` baut aus
  `data/waffen.json` eine Excel in der **v6-Struktur** (gleiche Spalten,
  Klassen-Trennzeilen, Fußnote). Auf Zuruf „gib mir die Waffenliste als Excel"
  immer dieses Skript nutzen, damit die Struktur erhalten bleibt.
- Quelle der Struktur: `itemliste_v6.xlsx`, Blatt „Waffen".
- **Hand (E/B) liegt auf Typ-/Waffen-Ebene**, nicht auf Klassen-Ebene
  (eine Klasse kann gemischt sein). Beidhänder: Äxte, Bogenwaffen, **Rammbock**.
  Alles andere Einhänder (brauchen Offhand): Schwerter, Hammer, Zepter,
  Stabwaffen, Dolche, Zauberwaffen.

---

## Was als nächstes kommt (Reihenfolge laut Nutzer)

1. **Waffenliste** — detailliertes Waffensystem (nächste Sitzung)
2. **Crafting / Verbesserung / Refinement** — inkl. Gravuren-System (§9.5)
3. **Skilltree** — erstes gemeinsames Code-Projekt

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
