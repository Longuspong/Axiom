# AXIOM — Game Design Document

> *"In seinem eigenen Weltbild hat jeder Mensch Axiome, ob er es will oder nicht. Dieses Spiel lädt dazu ein, sie zu hinterfragen."*

**Version:** 0.4  
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
   - 8.1 [Hauptmenü](#81-hauptmenü)
   - 8.2 [Spielstand-Verwaltung](#82-spielstand-verwaltung)
   - 8.3 [Einstellungen](#83-einstellungen)
   - 8.4 [Credits](#84-credits)
9. [Hub — Bergheim](#9-hub--bergheim)
   - 9.1 [Visuelles Konzept](#91-visuelles-konzept)
   - 9.2 [Hub-Menüs](#92-hub-menüs)
   - 9.3 [Missionskarte](#93-missionskarte)
   - 9.4 [Kampagnen](#94-kampagnen)
   - 9.5 [Aufträge](#95-aufträge)
   - 9.6 [Endlos-Modus](#96-endlos-modus)
10. [Technische Spezifikationen](#10-technische-spezifikationen)
    - 10.1 [Art Style](#101-art-style)
    - 10.2 [Speichersystem](#102-speichersystem)
    - 10.3 [Engine & Projektstruktur](#103-engine--projektstruktur)
11. [Offene Punkte & ToDos](#11-offene-punkte--todos)

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

- **Grid-Typ:** Quadratisches Tile-Grid, isometrisch dargestellt (Rauten-Optik für visuelle Tiefe)
- **Distanzsystem:** Manhattan-Distanz (|Δx| + |Δy|) für Bewegung und Reichweite
- **AoE:** Standard-Squares (quadratische Flächen, Radius in Tiles)
- **Begründung:** Isometrische Darstellung bietet visuelle Tiefe bei gleichbleibend einfacher Grid-Logik (analog zu Final Fantasy Tactics). Hexagon- und Pentagon-Grids wurden geprüft und verworfen.
- **Bekannte Einschränkungen:** Diagonale Distanzen wirken optisch kürzer als gerade — wird durch Manhattan-Distanz bewusst in Kauf genommen.
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

- **Funktion:** Ausgangspunkt nach dem Prolog, wird im weiteren Spiel zum Hub ausgebaut
- **Erreichung:** Nach Abschluss des Prologs
- **Vollständige Beschreibung:** → Abschnitt 9 (Hub — Bergheim)

---

## 8. UI & UX

### 8.1 Hauptmenü

Das Hauptmenü ist der erste Screen nach dem Spielstart. Reihenfolge der Menüpunkte:

| Reihenfolge | Menüpunkt | Verhalten |
|-------------|-----------|-----------|
| 1 | Spielstand laden | Ausgegraut wenn kein Spielstand vorhanden |
| 2 | Neues Spiel | Öffnet Spielstand-Auswahl (max. 3 Slots) |
| 3 | Einstellungen | Öffnet Einstellungsmenü |
| 4 | Credits | Öffnet Credits |

**Standardverhalten:** Wenn ein Spielstand vorhanden ist, ist "Spielstand laden" die aktive Standardauswahl.

### 8.2 Spielstand-Verwaltung

**Slots:** Maximal 3 Spielstände gleichzeitig.

**Slot-Vorschau (je Spielstand):**
- Charaktername (Spielercharakter)
- Aktuelle Region
- Gespielte Zeit
- Datum des letzten Speicherns

**Neues Spiel — leerer Slot:**
- Slot auswählen → direkt in den Prolog

**Neues Spiel — belegter Slot:**
- Slot auswählen → Lösch-Dialog erscheint
- Spieler muss den Text `bitte löschen` eintippen und bestätigen
- Erst danach wird der Slot geleert und der Prolog gestartet

**Speicher-Logik:**
- **Auto-Save:** Nach jeder abgeschlossenen Runde innerhalb eines Kampfes
- **Gespeicherter Zustand:** HP, Mana, Cooldowns, Positionierung, verbrauchte Gegenstände
- **Manuelles Speichern:** Nur in Bergheim (gibt dem Basislager spielerisch mehr Gewicht)

**Laden eines laufenden Kampfes:**  
Der Spieler hat beim Fortsetzen zwei Optionen:

| Option | Effekt |
|--------|--------|
| Runde fortsetzen | Kampf wird ab dem gespeicherten Rundenstand fortgesetzt |
| Abbrechen | Spieler kehrt nach Bergheim zurück — ohne Belohnung, verbrauchte Consumables und Gegenstände bleiben verloren, die Runde muss von vorne begonnen werden |

**Design-Absicht:** Abbrechen hat echte Kosten (verlorene Verbrauchsgüter) aber keine permanente Bestrafung. Taktischer Druck bleibt erhalten, ein Softlock ist ausgeschlossen.

### 8.3 Einstellungen

Kategorien:

- **Audio:** Musik-Lautstärke, Effekt-Lautstärke, Sprache/Voice (falls vorhanden)
- **Bild/Video:** Auflösung, Vollbild/Fenster, Helligkeit, ggf. Farbblindheitsmodus
- **Steuerung:** Eingabemodus wählbar
  - Tastatur
  - Maus + Tastatur
  - Controller
  - Mobil (Touch)
  - Tastenbelegung anpassbar je Modus

### 8.4 Credits

Listet alle genutzten externen Ressourcen:
- Godot-Community-Assets
- Free Assets (Grafik, Audio, Fonts)
- Tools & Plugins
- *(Inhalt wird laufend gepflegt)*

---

## 9. Hub — Bergheim

### 9.1 Visuelles Konzept

Der Hub ist keine abstrakte Menüoberfläche, sondern eine lebendige Szene der Anfangssiedlung.

| Tageszeit | Darstellung |
|-----------|-------------|
| Tag | Die drei Startcharaktere stehen/sitzen um einen Brunnen |
| Nacht | Die drei Startcharaktere sitzen am Lagerfeuer |

Tageszeit wechselt dynamisch (Details zur Tag/Nacht-Logik folgen). Die Siedlung wächst visuell mit dem Spielfortschritt *(folgt)*.

### 9.2 Hub-Menüs

Von der Hub-Szene aus öffnet der Spieler folgende Bereiche:

| Menü | Inhalt | Erweiterungen (später) |
|------|--------|------------------------|
| Trupp verwalten | Charakterübersicht, Ausrüstung, Skills | Rekrutierungs-Taverne |
| Inventar | Gegenstände, Waffen, Ausrüstung | Crafting, Aufwertung, Verfeinerung (→ Waffensystem) |
| Missionskarte | Kampagnen, Aufträge, Endlos-Modus | Weitere Regionen |

### 9.3 Missionskarte

Drei Spielmodi in der Missionskarte:

1. **Kampagnen** — Hauptkampagne der Region (→ 9.4)
2. **Aufträge** — Besondere Missionen (→ 9.5)
3. **Endlos-Modus** — Ab Kampagne 10 freigeschaltet (→ 9.6)

### 9.4 Kampagnen

Die Hauptkampagne einer Region besteht aus einer Folge von Levels mit einheitlichem Schwierigkeitsniveau.

**Loot-System:**

| Level-Typ | Erste Completion | Wiederholung |
|-----------|-----------------|--------------|
| Hauptlevel | Fixer Einmal-Reward (manchmal Waffen-Auswahl) | Random Loot |
| Zwischenlevel | Kein fixer Reward | Random Loot |

- **Waffen-Auswahl-Rewards:** Bei manchen Hauptlevels wählt der Spieler eine Waffe aus mehreren vorgegebenen Optionen
- **Zwischenlevel** haben keinen garantierten Reward, nur Random-Loot bei Wiederholung

### 9.5 Aufträge

Aufträge sind besondere oder herausfordernde Missionen außerhalb der Hauptkampagne. Drei Typen:

| Typ | Beschreibung |
|-----|-------------|
| Vorgegeben | Feste, von Entwicklern erstellte Aufträge |
| Generisch | Prozedurale/wiederholbare Aufträge |
| Freischaltbar | Werden durch in-game Herausforderungen freigeschaltet |

**Freischaltbare Aufträge — Klassen-Arks:**  
Jede Klasse hat einen eigenen mehrstufigen Auftrag, der durch eine klassenspezifische Herausforderung freigeschaltet wird.

*Beispiel Bogenschütze:*
- **Freischalt-Bedingung:** 50 Treffer auf optimaler Reichweite mit dem Bogen
- **Auftrag:** "Bogenschützen-Ark" (mehrstufige Missionsreihe)
- **Reward:** Sehr guter Bogen **oder** Bogen-Gravuren

> **Gravuren** sind Waffen-Modifikatoren (eigenes System, → Waffensystem, folgt)

### 9.6 Endlos-Modus

- **Freischaltung:** Nach Abschluss von Kampagne 10 der Region Raldiguh ohk
- **Ziel:** High Score, Ressourcen und Loot farmen
- **Loot-Pool:** Vollständig zufällig, aber gebunden an die Ork-Region
- **Einschränkung:** Keine außerordentlichen magischen Gegenstände — Orks sind thematisch physisch, ihr Loot-Pool spiegelt das wider
- **High Score:** Wird pro Spielstand gespeichert

---

## 10. Technische Spezifikationen

### 10.1 Art Style

- **Stil:** HD Pixel Art
- **Perspektive:** Isometrisch (Rauten-Grid, 2D)
- **Farbpalette & Ton:** Hell, freundlich, farbenfroh — bewusste Abkehr vom typischen dunklen Fantasy-Look. Viel Liebe zum Detail, hoher Polishgrad.
- **Konsequenz:** Helle Umgebungen erfordern mehr Detailarbeit an Tilesets und Sprites (mehr Kontrast, sauberere Linien, mehr sichtbare Details), das ist bewusst einkalkuliert.
- **Details (Tilesets, Auflösung, Sprite-Größen):** *(folgt)*

### 10.2 Speichersystem

- **Format:** JSON, im Release-Build verschlüsselt via Godot 4 `FileAccess.open_encrypted_with_pass`
- **Im Dev-Build:** Unverschlüsselt (lesbar für Debugging)
- **Gespeicherter Inhalt:** Game State, Inventar, Charakter-Progression, Region-Fortschritt, Spielzeit, Zeitstempel
- **Speicherort:** Godot-Standard-User-Verzeichnis (`user://`)
- **Anzahl Slots:** 3

### 10.3 Engine & Projektstruktur

- **Engine:** Godot 4
- **Sprache:** *(GDScript / C# — folgt)*
- **Zielplattform:** *(folgt)*
- **Projektstruktur:** *(folgt)*
- **Audio:** *(folgt)*

---

## 11. Offene Punkte & ToDos

- [ ] Ork-Klassen & KI-Verhalten definieren
- [ ] Ork-Fraktionsbonus definieren
- [ ] Alle Klassen vollständig ausarbeiten (Stats, Skills, Synergien)
- [ ] Klassen-Arks für alle Klassen definieren (Freischalt-Bedingungen & Rewards)
- [ ] Waffensystem ausarbeiten (inkl. Gravuren, Crafting, Aufwertung, Verfeinerung)
- [ ] Weitere Regionen definieren
- [ ] Hub Tag/Nacht-Logik definieren
- [ ] Hub visuelle Progression (Siedlung wächst) konzipieren
- [ ] Rekrutierungs-Taverne ausarbeiten
- [ ] Charakter-Erstellungssystem (Erscheinungsbild) definieren
- [ ] Kampfsystem-Werte definieren (Regeneration, Block, Resistenz etc.)
- [ ] Arathos-Backstory intern dokumentieren (spoilerbehaftet)
- [ ] Technische Specs vervollständigen (Sprache, Zielplattform, Projektstruktur)
- [ ] Tileset- & Sprite-Specs definieren (Auflösung, Größen, Palette)
- [ ] Credits-Liste aufbauen (Assets, Tools, Plugins)
- [ ] Audio-Konzept definieren
