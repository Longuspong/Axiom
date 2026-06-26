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
git push origin claude/keen-gauss-2k5waj:main --force
git push origin claude/keen-gauss-2k5waj --force
```

> **Push-Ziel (aktuell):** Bis zum Phase-1-Startschuss kommt alles (nach Widerspruchsprüfung) **direkt auf `main`**. Session-Arbeitsbranch ist `claude/keen-gauss-2k5waj`.

---

## GDD-Stand (aktuell: v0.7)

`GDD.md` ist das einzige Designdokument. Struktur:

| # | Abschnitt | Status |
|---|-----------|--------|
| 1 | Vision & Philosophie | ✅ vollständig |
| 2 | Welt & Lore | ⚠️ Regionen-Tabelle unvollständig |
| 3 | Story-Struktur / Prolog | ✅ vollständig |
| 4 | Fraktionen | ⚠️ Orks & weitere fehlen noch |
| 5 | Gameplay-Systeme | ⚠️ Grid ✅, Kampfsystem+Statuseffekte ✅, Klassen ✅, Attribute ✅, Bögen ✅, restl. Waffen/Skills ausstehend |
| 6 | Charaktere | ⚠️ Arathos ✅, weitere ausstehend |
| 7 | Bergheim (Verweis auf §9) | ✅ |
| 8 | UI & UX | ✅ Hauptmenü, Slots, Einstellungen, Credits |
| 9 | Hub — Bergheim | ✅ vollständig |
| 10 | Technische Spezifikationen | ⚠️ Art Style ✅, Sprache/Plattform/Struktur fehlen |
| 11 | Offene Punkte & ToDos | ✅ laufend gepflegt |

---

## Stand letzte Sitzung (Kampfsystem)

§5.2 ist jetzt der dickste Block. Abgeschlossen:
- Systemweite Begriffe (Angriff, Felder/Flächen, Angriffsrichtungen)
- Kampfablauf & Aktionsökonomie (1 Angriffsaktion + Mobilitätspunkte, frei verschachtelbar; Fähigkeiten/Zauber kosten keine Angriffsaktion außer ausdrücklich; „Zug beenden")
- Grundwerte: keine Auto-HP-Regen (außer „Gemeinschaft"), Mana 10/Zug (+INT), VIT = 6 HP/Punkt
- Schadensmodell: WID-Formel `WID/(WID+100)` + Rüstung/Resistenz (flat) + RD (prozentual), inkl. EHP-Begründung & WID-Cap-Vermerk
- Reaktionen: Gegenschlag, Parieren/Block, Zauberblock, Konter
- Statuseffekte: Einheiten (14) + Felder (6)
- §5.3 Waffensystem-Start: Bögen (Distanzprofile, Falloff, Adlerauge)

## Was als nächstes kommt

Offene Kampf-Bausteine (→ §11): Gegenschlag/Zauberblock-Detailwerte, Trefferchance/Krit-Grundregeln, Initiative/Zugreihenfolge, WID-Cap final.

1. **Waffenliste** — restliches Waffensystem (Nahkampf, Stats, Gravuren)
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
| Schadensreduktion | 3 Hebel: **WID** = prozentual (`WID/(WID+100)`, beide Typen), **Rüstung/Resistenz** = flacher Abzug pro Treffer (physisch/magisch, Squishy≈0), **RD** = Rüstungsdurchdringung (prozentual, senkt nur den Flat-Wert). WIL bleibt rein offensiv. Multi-Hit = höherer Gesamt-Rohschaden |
| Bögen-Reichweite | Notation `optimal/max` (z. B. 3–4/5); −30 % Schaden & Trefferchance pro Feld außerhalb der Optimalzone; Adlerauge +1 auf beide Grenzen |
