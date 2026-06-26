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

## Was als nächstes kommt (Reihenfolge laut Nutzer)

1. **Waffenliste** — detailliertes Waffensystem (nächste Sitzung)
2. **Crafting / Verbesserung / Refinement** — inkl. Gravuren-System (§9.5)
3. **Skilltree** — erstes gemeinsames Code-Projekt

---

## Placeholder-Sprites (Stand: Sitzung 2026-06-26)

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
| Claude / Fable 5 | ❌ nicht möglich | Text-LLM, kann keine Bilder generieren |

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
→ Pixellab.ai mit neuen Tokens aufrufen, obigen Prompt verwenden, alle 4 Richtungen generieren → in Godot als SpriteFrames einbinden.

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
| Schadensreduktion | Komplett auf **WID** (physisch + magisch); WIL bleibt rein offensiv. Split-Differenzierung über Werte Block/Resistenz + Ausrüstung |
| Bögen-Reichweite | Notation `optimal/max` (z. B. 3–4/5); −30 % Schaden & Trefferchance pro Feld außerhalb der Optimalzone; Adlerauge +1 auf beide Grenzen |
