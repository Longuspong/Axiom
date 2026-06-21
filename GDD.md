# AXIOM — Game Design Document

> *"In seinem eigenen Weltbild hat jeder Mensch Axiome, ob er es will oder nicht. Dieses Spiel lädt dazu ein, sie zu hinterfragen."*

**Version:** 0.1  
**Stand:** 2026-06-21  
**Engine:** Godot 4  
**Genre:** 2D Top-Down Tactics Fantasy RPG  

---

## Inhaltsverzeichnis

1. [Vision & Philosophie](#1-vision--philosophie)
2. [Welt & Lore](#2-welt--lore)
   - 2.1 [Hintergrund & Ausgangslage](#21-hintergrund--ausgangslage)
   - 2.2 [Regionen](#22-regionen)
3. [Story-Struktur](#3-story-struktur)
   - 3.1 [Allgemeine Story-Progression](#31-allgemeine-story-progression)
   - 3.2 [Prolog — Raldiguh ohk](#32-prolog--raldiguh-ohk)
4. [Fraktionen](#4-fraktionen)
   - 4.1 [Menschen](#41-menschen)
   - 4.2 [Orks](#42-orks)
   - 4.3 [Weitere Fraktionen](#43-weitere-fraktionen)
5. [Gameplay-Systeme](#5-gameplay-systeme)
   - 5.1 [Grid & Bewegung](#51-grid--bewegung)
   - 5.2 [Kampfsystem](#52-kampfsystem)
   - 5.3 [Klassen & Waffen](#53-klassen--waffen)
   - 5.4 [Skill- & Fähigkeitssystem](#54-skill--fähigkeitssystem)
   - 5.5 [Fraktionsboni](#55-fraktionsboni)
6. [Charaktere](#6-charaktere)
   - 6.1 [Spielercharakter](#61-spielercharakter)
   - 6.2 [Arathos](#62-arathos)
   - 6.3 [Weitere Charaktere](#63-weitere-charaktere)
7. [Bergheim — Basislager](#7-bergheim--basislager)
8. [UI & UX](#8-ui--ux)
9. [Technische Spezifikationen](#9-technische-spezifikationen)
10. [Offene Punkte & ToDos](#10-offene-punkte--todos)

---

## 1. Vision & Philosophie

**Projektname:** Axiom

Der Name ist bewusst gewählt: Jeder Mensch trägt in seinem Weltbild Axiome — Grundannahmen, die er für selbstverständlich hält, ohne sie je zu hinterfragen. Axiom als Spiel stellt diese Annahmen in Frage. Wer ist Feind, wer ist Freund? Warum führen wir Krieg? Was wissen wir wirklich — und was glauben wir nur zu wissen?

Das Spiel soll den Spieler durch klassische Taktik-RPG-Mechanik emotional in eine Geschichte einbinden, die mehr Fragen stellt als sie beantwortet — und den Spieler dazu bringt, seine ersten Eindrücke und Urteile zu revidieren.

**Kernpfeiler:**
- Taktische Tiefe durch Klassen, Synergien und Terrain
- Narrative Dichte durch regionale Story-Arcs mit eigenem Ton
- Philosophische Untertöne ohne Belehrung — durch Fragen, nicht Antworten
- Modulare Spielerprogression durch Waffenwahl und Charakter-Benennung

---

## 2. Welt & Lore

### 2.1 Hintergrund & Ausgangslage

Die Welt von Axiom besteht aus mehreren Fraktionen, die vor Spielbeginn in einem fragilen, aber stabilen Frieden nebeneinander existierten. Es gab keinen echten Austausch, keine Freundschaften, keine Allianzen — aber auch keinen Konflikt. Man ließ sich gegenseitig in Ruhe.

Dieser Frieden endet abrupt: Die Orks, sonst ruhig und zurückgezogen, greifen ohne erkennbaren Grund menschliche Siedlungen an. Ein Krieg beginnt — und niemand weiß wirklich warum.

### 2.2 Regionen

Jede Region ist ein eigenständiger Story-Arc mit:
- Eigener Gegnerfraktion
- Eigenem Terrain & Wetterbedingungen
- Eigenem Team- und KI-Verhalten der Gegner
- Eigenem thematischen Schwerpunkt
- Eigenem Plot-Abschluss (mal vorhersehbar, mal nicht)

| # | Name | Fraktion | Terrain | Status |
|---|------|----------|---------|--------|
| 1 | Raldiguh ohk | Orks | Wald | Prolog & Startregion |
| … | *(folgt)* | | | |

---

## 3. Story-Struktur

### 3.1 Allgemeine Story-Progression

Die Story-Progression ist direkt an die Regionen geknüpft. Jede Region schließt mit einem Plot-Ereignis ab. Die übergreifende Narrative entwickelt sich durch wiederkehrende Charaktere, Enthüllungen und Entscheidungen des Spielers.

Thematischer roter Faden: Die Fragen, die sich der Spieler am Anfang nicht stellt — werden sich im Laufe des Spiels von selbst aufdrängen.

### 3.2 Prolog — Raldiguh ohk

**Setting:** Ein waldiges, sonst ruhiges Ork-Territorium. Menschen-Dorf am Rand des Waldes.

**Einstieg:**
Der Spieler erstellt seinen Charakter (Name, Erscheinung — Details folgen in Abschnitt 6.1). Die erste Szene zeigt das Dorf mitten im Ork-Überfall. Fast alle Bewohner sind geflohen oder gefallen. Ein halbbekannter Bekannter — später enthüllt als **Arathos** — fordert den Spieler auf, sich zu bewaffnen und zu einem sichereren Ort zu gelangen.

**Waffenwahl = Klassenwahl:**  
Der Spieler wählt eine Waffe. Diese Entscheidung legt die Startklasse fest (→ Abschnitt 5.3).

---

**Tutorial-Phase 1 — Runden 1 & 2**  
*Begleitung: Arathos (Magier, Zepter)*

Lehrinhalte:
- Grid/Tile-System
- Bewegungssystem & Bewegungsreichweite
- Manhattan-Distanz für Reichweite und Zielauswahl
- Standard-Squares für AoE-Fähigkeiten
- Erste Ork-Klassen & deren Verhaltensmuster
- Nah- und Fernkampf
- Magischer vs. physischer Schaden
- Resistenz & Block

Szenario: Ork-Nachhut greift an — Spieler und Arathos müssen sie besiegen.

---

**Rekrutierung Charakter 2**  
Nach Runden 1 & 2 trifft der Trupp auf einen verwundeten Menschen, der sich anschließen möchte.
- Spieler vergibt **Name**
- Spieler wählt **Waffe** (→ Klasse)
- Zweiter Charakter ist ab sofort Teil des Trupps

---

**Tutorial-Phase 2 — Runden 3 & 4**  
*Trupp: Spielercharakter + Charakter 2*

Lehrinhalte:
- Skill- und Fähigkeitssystem
- Erste Kombinationen & Synergien zwischen Klassen
- Fraktionsbonus **"Gemeinschaft"** (→ Abschnitt 5.5)

---

**Rekrutierung Charakter 3**  
Der Trupp findet einen weiteren überlebenden Menschen.
- Spieler vergibt **Name**
- Spieler wählt **Waffe** (→ Klasse)
- Standardtrupps bestehen aus **3 Einheiten**

---

**Abschluss Prolog:**  
Arathos verrät seinen Namen und muss weiterziehen. Offene Fragen bleiben bewusst unbeantwortet:
- Wer ist Arathos wirklich?
- Warum wusste er so genau, warum die Orks angreifen?
- Was verbindet ihn mit dem Spieler?

Der Trupp erreicht **Bergheim** — das Basislager der Überlebenden.

---

## 4. Fraktionen

### 4.1 Menschen

**Fraktionsbonus: Gemeinschaft**  
Pro Mensch auf dem Schlachtfeld erhalten alle menschlichen Einheiten Regeneration.  
*(Genaue Werte: folgt)*

**Klassen:** Bogenschütze, Ritter, Assassine, Mystiker, Magier *(+ weitere, folgt)*

**Philosophisches Thema:** Stärke durch Zusammenhalt — aber auch Gruppendenken und blinder Gehorsam.

### 4.2 Orks

**Heimatregion:** Raldiguh ohk (waldiges Terrain)  
**Grundcharakter:** Sonst ruhig und zurückgezogen — der Angriff ist ein Bruch ihres normalen Verhaltens.

**Klassen:** *(folgt)*  
**KI-Verhalten & Angriffsmuster:** *(folgt)*  
**Fraktionsbonus:** *(folgt)*  
**Philosophisches Thema:** *(folgt)*

### 4.3 Weitere Fraktionen

*(folgt mit jeder neuen Region)*

---

## 5. Gameplay-Systeme

### 5.1 Grid & Bewegung

- **Grid-Typ:** Quadratisches Tile-Grid (Top-Down)
- **Distanzsystem:** Manhattan-Distanz (|Δx| + |Δy|) für Bewegung und Reichweite
- **AoE:** Standard-Squares (quadratische Flächen, Radius in Tiles)
- **Weitere Details:** *(folgt)*

### 5.2 Kampfsystem

- **Schadenstypen:** Physisch, Magisch
- **Defensive Werte:** Resistenz (gegen magischen Schaden), Block (gegen physischen Schaden)
- **Kampfreichweiten:** Nahkampf, Fernkampf
- **Weitere Details:** *(folgt)*

### 5.3 Klassen & Waffen

Die Startklasse wird durch die Wahl der ersten Waffe bestimmt. Es gibt mehr Waffen als die fünf Startoptionen.

| Waffe | Startklasse |
|-------|-------------|
| Bogen | Bogenschütze |
| Schwert | Ritter |
| Dolche | Assassine |
| Energiesphäre | Mystiker |
| Zauberstab | Magier |
| Zepter | *(magische Nahkampfwaffe — Arathos' Klasse)* |
| … | *(weitere folgen)* |

**Klassendetails (je Klasse):** *(folgt)*

### 5.4 Skill- & Fähigkeitssystem

- Klassen verfügen über einzigartige Skills
- Synergien zwischen Klassen sind zentral für taktische Tiefe
- Erste Synergien werden im Prolog Tutorial eingeführt
- **Details:** *(folgt)*

### 5.5 Fraktionsboni

| Fraktion | Bonus | Effekt |
|----------|-------|--------|
| Menschen | Gemeinschaft | +Regeneration pro Mensch auf dem Feld |
| Orks | *(folgt)* | |
| … | | |

---

## 6. Charaktere

### 6.1 Spielercharakter

- **Name:** Spieler-definiert
- **Klasse:** Abhängig von Waffenwahl im Prolog
- **Hintergrund:** *(folgt)*
- **Charakter-Erstellung:** *(Details zu Erscheinungsbild etc. folgen)*

### 6.2 Arathos

- **Rolle:** Halbbekannter, Tutorial-Begleiter im Prolog
- **Klasse:** Magier mit Zepter (magische Nahkampfwaffe)
- **Verhalten:** Kennt mehr als er preisgibt. Weiß warum die Orks angreifen — sagt es aber nicht. Verrät erst am Ende des Prologs seinen Namen, muss dann weiterziehen.
- **Narrative Funktion:** Zentraler Mysterium-Charakter. Erster Riss im Weltbild des Spielers.
- **Offene Fragen (bewusst offen gelassen):**
  - Wer ist Arathos wirklich?
  - Warum wusste er so genau über den Ork-Angriff Bescheid?
  - Was verbindet ihn mit dem Spieler?
  - Wohin muss er so dringend?

### 6.3 Weitere Charaktere

*(Charakter 2 und 3 sind Spieler-benannt und -bewaffnet — keine feste Identität im Prolog)*

---

## 7. Bergheim — Basislager

- **Funktion:** Home Screen & Basislager des überlebenden Trupps
- **Erreichung:** Nach Abschluss des Prologs
- **Inhalte:** *(folgt — Menüs, Upgrades, Rekrutierung, etc.)*

---

## 8. UI & UX

*(folgt)*

---

## 9. Technische Spezifikationen

- **Engine:** Godot 4
- **Sprache:** *(GDScript / C# — folgt)*
- **Zielplattform:** *(folgt)*
- **Projektstruktur:** *(folgt)*
- **Art Style:** *(folgt)*
- **Audio:** *(folgt)*

---

## 10. Offene Punkte & ToDos

- [ ] Ork-Klassen & KI-Verhalten definieren
- [ ] Ork-Fraktionsbonus definieren
- [ ] Alle Klassen vollständig ausarbeiten (Stats, Skills, Synergien)
- [ ] Weitere Regionen definieren
- [ ] Bergheim-Inhalte ausarbeiten
- [ ] Charakter-Erstellungssystem (Erscheinungsbild) definieren
- [ ] UI/UX konzipieren
- [ ] Technische Specs vervollständigen (Sprache, Plattform, Art Style)
- [ ] Kampfsystem-Werte definieren (Regeneration, Block, Resistenz etc.)
- [ ] Arathos-Backstory intern dokumentieren (spoilerbehaftet)
