# AXIOM — Game Design Document

> *"In seinem eigenen Weltbild hat jeder Mensch Axiome, ob er es will oder nicht. Dieses Spiel lädt dazu ein, sie zu hinterfragen."*

**Version:** 0.9  
**Stand:** 2026-06-25  
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
   - 5.6 [Attribute](#56-attribute)
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

---

#### Speed & Initiative

**Speed-Wert**

Jede Einheit hat einen Speed-Wert, der die Zugreihenfolge bestimmt. Basiswert ist **1,0**. Ausrüstung modifiziert diesen Wert nach oben oder unten.

**Gewichtsklassen (5 Stufen)**

Jedes Ausrüstungsstück gehört einer von fünf Gewichtsklassen an. Die Klasse steht auf der Waffenkarte bzw. Rüstungskarte als Index.

| Index | Name | Körper-/Waffenslot | Kopf-/Füße-Slot |
|-------|------|--------------------|-----------------|
| 1 | **Schnell** | +0,30 | +0,20 |
| 2 | **Wendig** | +0,15 | +0,10 |
| 3 | **Ausgeglichen** | ±0,00 | ±0,00 |
| 4 | **Bedächtig** | −0,15 | −0,10 |
| 5 | **Träge** | −0,30 | −0,20 |

> Waffen verwenden denselben Speed-Index wie Körperrüstungen (+0,30 bis −0,30).

**Speed-Maximum & -Minimum**

- **Max. Speed-Bonus durch Ausrüstung:** +1,0 (Waffe +0,30 + Körper +0,30 + Kopf +0,20 + Füße +0,20)
- **Max. Speed-Malus durch Ausrüstung:** −1,0 (symmetrisch)
- Zusätzliche Speed-Modifikation durch Buffs/Debuffs (z. B. +20 % durch bestimmte Skills) ist möglich.

**Waffenkarte (UI)**

Jede Waffe hat eine Waffenkarte, die beim Anklicken des Waffensymbols aufgeht:
- Oben links: Waffensymbol
- Name der Waffe
- Waffenklasse (z. B. „Stichwaffen")
- Gewichtsklassen-Index (z. B. „Wendig")

**Initiativereihenfolge**

- Die Einheit mit dem **höchsten Speed-Wert** zieht zuerst.
- **Gleichstand:** Die Einheit, die in dieser Runde noch **nicht** gezogen hat, hat Vorrang. Haben beide noch nicht gezogen, entscheidet die längste Wartezeit.
- **Mehrfachzüge:** Eine Einheit kann in einer Runde mehrfach ziehen, wenn ihr Speed-Wert entsprechend hoch ist. Das Spiel füllt alle Einheiten über einen gemeinsamen Initiative-Balken auf — wer zuerst den Schwellenwert erreicht, ist dran.
  - *Beispiel: Einheit A (Speed 1) und Einheit B (Speed 2). B zieht zuerst. Dann kommt es zum Gleichstand: A hat noch nicht gezogen → A zieht. Direkt danach zieht B erneut.*
- Eine **Runde** gilt als beendet, wenn jede Einheit mindestens einmal gezogen hat.

---

#### Mobilität (MOB)

- Jede Einheit hat einen **MOB-Wert**, der bestimmt, wie viele Felder sie sich pro Zug bewegen kann (Manhattan-Distanz).
- Eine Einheit mit MOB 5 kann sich bis zu 5 Felder bewegen — in beliebig vielen Teilschritten, solange die Gesamtdistanz ≤ 5 bleibt.
- MOB ist ein **Basiswert pro Klasse** und kann nur durch Items und spezielle Skilltree-Nodes erhöht werden. **Maximum: 5.**
- **Traits/Eigenarten können zusätzliche Bewegung zurückgeben**, die nicht auf den MOB-Pool angerechnet wird.
  - *Beispiel: Eine Einheit mit MOB 5 und Pike-Eigenart kann nach den 5 Feldern und einem Angriff durch die Eigenart noch 2 weitere Felder laufen.*
- Konkrete MOB-Basiswerte je Klasse → folgt bei Klassen-Attributen (§5.3).

### 5.2 Kampfsystem

- **Schadens-/Angriffsarten:** Nahkampfangriff, Fernkampfangriff, Zauber, Fähigkeit
- **Schadenstypen:** Physisch, Magisch
- **Defensive Werte:**
  - **Rüstung** — flacher Abzug gegen *physischen* Schaden (pro Treffer)
  - **Resistenz** — flacher Abzug gegen *magischen* Schaden (pro Treffer)
  - *(„Block" ist kein Wert mehr, sondern eine Reaktion → siehe Reaktionen)*
- **Schadensreduktion (Attribut):** **WID** liefert die **prozentuale** Reduktion (physisch **und** magisch); **WIL** bleibt rein offensiv (magischer Schaden).
  - *Design-Entscheidung: Prozent-Reduktion konsolidiert auf WID (kein Split auf INT/WIL). Der physisch/magisch-Split lebt über die flachen Werte Rüstung vs. Resistenz bzw. die Ausrüstung.*

---

#### Kampfablauf & Aktionsökonomie

- Unterschieden wird in **Nahkampfangriff**, **Fernkampfangriff**, **Zauber** und **Fähigkeit**.
- Jede Einheit hat in ihrem Zug:
  - **1 Angriffsaktion** (standardmäßig)
  - so viele **Bewegungsaktionen**, wie der Charakter **Mobilitätspunkte** hat *(Details bei Klassen/Attributen folgen)*
- **Reihenfolge frei verschachtelbar:** z. B. 2 Felder gehen → angreifen → 1 Feld gehen; oder angreifen → 2 Felder gehen; oder Fähigkeit nutzen → 1 Feld gehen. Solange Aktionen übrig sind, dürfen sie genutzt werden.
- **Fähigkeiten & Zauber kosten KEINE Angriffsaktion** — außer die Fähigkeit sagt das ausdrücklich. Balancing läuft über Effekte, die den **nächsten NA (Normalangriff)** verstärken (z. B. *„dein nächster Angriff ist ein garantierter Krit"*).
- Der Zug endet über die Schaltfläche **„Zug beenden"**.

**Grundwerte:**

- **Regeneration:** keine automatische HP-Regen (Ausnahme: Menschen-Trait „Gemeinschaft", → §5.5).
- **Mana-Pool:** Standardwert **100**; erhöhbar durch Skilltree-Nodes und Items.
- **Mana-Start:** Jede Einheit beginnt jeden Kampf mit **vollem Mana**.
- **Mana-Regeneration:** standardmäßig **10 pro Zug** bei INT 10 (Standard), skaliert mit INT.
- **Mana-Verbrauch:** Aktive Skills einer aktiven Gravur kosten Mana.
- **Mana-Reservierung:** Passive Gravuren reservieren Mana **beim Platzieren der Einheit in der Homezone** (dem Bereich, in dem Einheiten zu Kampfbeginn aufgestellt werden). Das reservierte Mana steht nicht als freies Mana zur Verfügung.
- **Leben:** jeder Punkt **VIT** = **6 Lebenspunkte** *(Faktor modellierbar — kann im Balancing angepasst werden)*.

---

#### Rohschaden-Formeln

Der Rohschaden wird **vor** der Schadensreduktion (WID, Rüstung/Resistenz) berechnet. Fähigkeiten, die den Rohschaden erhöhen (z. B. +20 %), greifen **an dieser Stelle**, nicht nach der Reduktion.

**Nahkampf — Physisch:**
```
Rohschaden = STR (Einheit) + STR (Waffe) + Buffs/Debuffs
```

**Nahkampf — Magisch:**
```
Rohschaden = WIL (Einheit) + WIL (Waffe) + Buffs/Debuffs
```

> STR und WIL kumulieren aus allen Quellen (Basisattribut + Waffe + Ausrüstung + Buffs).

**Fernkampf (Schützen-Skalierung):**
```
Rohschaden = GES × 0,75 + STR × 0,25
```
> Alle GES- und STR-Werte aus sämtlichen Quellen (Basisattribut + Waffe + Ausrüstung + Buffs) werden zuerst summiert, dann mit 0,75 bzw. 0,25 gewichtet.  
> *Design-Entscheidung: GES dominiert den Fernkampf-Rohschaden (¾), STR spielt eine untergeordnete Rolle (¼). Das erzeugt eine klare Nah-/Fernkampf-Dynamik: STR-Builds sind im Nahkampf stärker, GES-Builds auf Distanz.*

---

#### Schadensreduktion — WID-Formel

```
effektive_Rüstung = Rüstung × (1 − RD%)            (RD = Rüstungsdurchdringung)
Schaden           = max( ⌈ Roh × (1 − R%) ⌉ − effektive_Rüstung , 1 )

R%  = WID / (WID + 100)    (abnehmender Ertrag, nie 100 %)
```

**Die drei getrennten Hebel:**

- **WID → prozentuale Reduktion** (beide Schadenstypen), abnehmender Ertrag (Halbwert bei WID = 100). Das ist die *allgemeine Zähigkeit*.
- **Rüstung (physisch) / Resistenz (magisch) → flacher Abzug pro Treffer.** Das ist *Panzerung* — eine Eigenschaft schwerer Rüstung; Squishy-Builds haben **≈ 0**.
- **Rüstungsdurchdringung (RD) → prozentual**, senkt die Rüstung/Resistenz des Ziels **vor** der Berechnung. Wirkt **nur auf den Flat-Wert, nicht auf die WID-Prozentreduktion** — RD kontert Panzerung, nicht allgemeine Zähigkeit.

**Zwei Designregeln, die das System tragen:**

1. **Flat = Rüstungshärte.** Squishies haben kaum Rüstung → der flache Abzug greift dort fast nicht.
2. **Multi-Hit-Waffen haben höheren *Gesamt*-Rohschaden** (verteilt auf viele kleine Treffer). Dadurch sind sie gegen ungepanzerte Ziele stark (höherer Rohschaden, nur %-Reduktion), gegen Panzerung schwach (jeder kleine Treffer zahlt den Flat-Abzug erneut).

**Beispiel** — *Stilett* (1× 45), *Dolchpaar* (2× 29,25 = 58,5 gesamt, RD 0) und *Kriegsarmbrust* (1× 60, **RD 50 %**):

*Squishy* — WID 30 → R% 23 %, **Rüstung 0:**

| Angriff | Rechnung | Schaden |
|---|---|---|
| Stilett (1× 45) | ⌈45 × 0,77⌉ | **35** |
| Dolchpaar (2× 29,25) | ⌈29,25 × 0,77⌉ × 2 = 23 × 2 | **46** |
| Kriegsarmbrust (1× 60) | ⌈60 × 0,77⌉ | **47** |

*Platte* — WID 80 → R% 44 %, **Rüstung 12:**

| Angriff | Rechnung | Schaden |
|---|---|---|
| Stilett (1× 45) | 25 − 12 | **13** |
| Dolchpaar (2× 29,25) | (17 − 12) × 2 | **10** |
| Kriegsarmbrust (1× 60, RD 50 % → eff. Rüstung 6) | 34 − 6 | **28** |

> **Konsequenz:**
> - **Dolchpaar:** DPS-König gegen Squishies (46 > 35), kollabiert gegen Platte (10 < 13).
> - **Kriegsarmbrust:** echter Plattenknacker (28 dank 50 % RD), gegen Squishy nichts dazu (RD verpufft bei Rüstung 0). Ihre Schwäche gegen Flinke ist **positionell** (kurze Reichweite, Immobilität, Trefferchance-Falloff), nicht beim Schaden-auf-Treffer.
> - Konstante `100`, die Rüstungswerte und RD-% sind die Balancing-Stellschrauben.

**Warum `WID/(WID+100)`? (Design-Begründung)**

In **Prozent** hat WID abnehmenden Ertrag (50 → 33 %, 100 → 50 %, 150 → 60 %). In **effektiver Lebenskraft (EHP)** ist es aber **linear** — jeder Punkt ist gleich viel wert:

```
EHP-Faktor = 1 / (1 − R%) = (WID + 100) / 100 = 1 + WID/100
```

| WID | R% | EHP-Faktor |
|---|---|---|
| 0 | 0 % | ×1,0 |
| 100 | 50 % | ×2,0 |
| 200 | 66,7 % | ×3,0 |
| 300 | 75 % | ×4,0 |

→ Jede **100 WID = +1 volle Lebensleiste effektiv**. Konsequenz: **keine verschwendeten späten Punkte** (Stacking lohnt konstant), aber auch **kein kaputtes Stacking** (man nähert sich nie 100 % Immunität). Der gefühlte abnehmende %-Ertrag ist genau das Self-Balancing, das einen Tank nicht unkillbar werden lässt.

**WID-Cap (Pflicht):** Damit ein voll gepanzerter Plattentank **nicht unbesiegbar** wird, muss WID gedeckelt werden. Vorgesehen: **Hard-Cap bei 100 WID** (= 50 % Reduktion) bzw. Soft-Cap über das Skilltree-Limit (der Baum gibt nicht mehr als ~100 dauerhaft her). Höhere Reduktion entsteht dann nur **situativ** über Buffs/Ausrüstung, nicht als Dauerzustand. *(Konkreter Cap-Wert → Balancing, siehe §11.)*

---

#### Reaktionen

Reaktionen sind verteidigerseitige Reaktionen auf einen Angriff. Ihre **Stärke/Chance ist immer quellenabhängig** (eine Fähigkeit kann z. B. „pariert alle Angriffe für 2 Runden" = 100 % geben, eine reaktive Gravur z. B. „10 % Chance, einen Angriff zu parieren").

| Reaktion | Trigger | Wirkung |
|---|---|---|
| **Gegenschlag** | erlittener **Nahkampf**angriff | Verteidiger schlägt mit einem **Normalangriff** zurück. **Triggert nicht bei Backstab.** Verteidiger erleidet den Treffer dennoch. |
| **Parieren / Block** | erlittener **Nahkampf**angriff | **Verhindert** den Schaden des Nahkampftreffers (kein Rückschlag). |
| **Zauberblock** | erlittener **Zauber**, bei dem man **selbst Ankerpunkt/Ziel** ist | Verhindert den Zauberschaden. **Wirkt nicht**, wenn eine AoE-Fähigkeit *neben* einem gewirkt wird — dann trifft sie normal. |
| **Konter** | erlittener **Nahkampf**angriff | **Parieren + Gegenschlag**: kein Schaden erlitten **und** Rückschlag auf den Angreifer. |

---

#### Systemweite Begriffsdefinitionen

Damit Skills, Gravuren und Angriffe eindeutig definierbar sind, gelten die folgenden Begriffe systemweit. **Voraussetzung ist stets, dass eindeutig ist, wo Angreifer und Verteidiger stehen und in welche Richtung sie ausgerichtet sind.**

##### Angriff

Das Nutzen eines normalen Angriffs mit der ausgerüsteten Waffe **oder** einer aktiven Gravur, die direkt als Angriff deklariert ist.

- Ein Angriff verbraucht eine **Angriffsaktion**.
- Die **Art** des Angriffs wird von der **Waffe** vorgegeben, nicht von der Gravur.
- Beispiel: Eine Gravur, die einen garantierten Krit beim nächsten Angriff gibt, wirkt waffenabhängig:

| Waffe | Resultierender Angriffstyp |
|---|---|
| Schwert | Single-Target |
| Axt | Multi-Target |
| Bogen | Fernkampf |
| Dolch | Nahkampf |

##### Felder & Flächen

AoE und Flächen werden **immer** auf eine von zwei Arten angegeben:

- **Manhattan-System** (orthogonale Distanz), oder
- **Square** mit Größe und Distanz (z. B. *3×3 um das Zielfeld*).

| Begriff | Definition | Felder |
|---|---|---|
| **Direkt angrenzend** | nur orthogonal | 4 (N, S, O, W) |
| **Indirekt angrenzend** | nur diagonal | 4 (NO, NW, SO, SW) |
| **Alle angrenzenden** | orthogonal + diagonal | 8 |

##### Angriffsrichtungen

Definiert über die **Ausrichtung** (Blickrichtung) von Angreifer und Verteidiger.

| Begriff | Definition | Beispiel |
|---|---|---|
| **Frontalangriff** | Angriff aus der Richtung, in die der Verteidiger blickt | Verteidiger blickt nach Süden, wird von Süden angegriffen |
| **Backstab** | Verteidiger ist entgegengesetzt zur Angriffsrichtung ausgerichtet | Verteidiger blickt nach Norden, wird von Süden angegriffen |
| **Flankierung** | Eine weitere Figur des Angreiferteams grenzt (direkt oder indirekt) an den Verteidiger an | — |

---

#### Statuseffekte

##### Einheiten-Statuseffekte

- **Brennen** *(negativ, stapelbar bis 3)*: Beim Stapeln wird die Dauer auf 3 Züge zurückgesetzt; jede weitere Applikation setzt die Dauer erneut auf 3. Eine brennende Einheit erleidet **am Ende ihres Zuges physischen Schaden i. H. v. 6 % des max. Lebens pro Stapel**.
- **Kälte** *(negativ, stapelbar bis 10)*: Die Figur verliert pro Zug einen Stapel. Jeder Stapel hat eine **5 % Chance, die Figur einzufrieren (→ Gefroren)** und mindert fix den Wert einer **Gegenreaktion** (Gegenschlag, Block sowie Zauberblock). **Bei vollen 10 Stapeln** löst der nächste Treffer (Fähigkeit o. Ä.) **sofort Gefroren** aus.
  - *Hinweis: „Gegenschlag" und „Zauberblock" sind neue Gegenreaktions-Mechaniken — Detaildefinition folgt (→ §11).*
- **Gefroren** *(negativ)*: Die Einheit kann sich weder bewegen noch angreifen. Der **nächste erlittene Schaden wird um 50 % verringert und löst Gefroren auf**. Dauer max. 2 Züge (Zug 1 = Applikationszug).
- **Festgehalten** *(negativ)*: Die Figur kann sich nicht bewegen, aber weiterhin angreifen und Fähigkeiten wirken. **Keine Standarddauer.**
- **Betäubt** *(negativ)*: Komplett bewegungs- und aktionsunfähig. Kann noch inspiziert und von Fähigkeiten anvisiert werden, führt aber keine eigenen Aktionen aus.
- **Gebrochen** *(negativ)*: Verringert jegliche Möglichkeit für **Schutz**, **Block** sowie Schadensreduktion. Wird ausgelöst durch das **gleichzeitige** Auftreten von **Blutung + Schwächen + Verwirren**. Dauer 2 Züge.
- **Schwächen** *(negativ, stapelbar)*: Erhöht die Anfälligkeit für **physischen** Schaden; die Höhe hängt vom Anwender ab. Jeder Stapel = 1 Zug Dauer. Ein Stapel wird **mit einem Angriff verbraucht**; zusätzlich verliert die Figur am Zugende einen Stapel (falls vorhanden).
- **Verwirren** *(negativ, stapelbar)*: Wie Schwächen, aber für **magischen** Schaden. Jeder Stapel = 1 Zug; ein Stapel wird mit einem Angriff verbraucht; zusätzlich −1 Stapel am Zugende.
- **Blutung** *(negativ)*: Kann nach der Schadensberechnung physischer Waffen auftreten (waffen-/passivabhängig). Verursacht **30 % des verursachten Schadens, verteilt über 3 Züge** (10 % pro Tick), beginnend mit dem Applikationszug. Der Tick-Schaden wird **hälftig in physisch und magisch** aufgeteilt und dann **nach Reduktion durch WID** abgezogen.
- **Vergiftet / Gift** *(negativ, stapelbar & verlängernd, sofern nicht anders beschrieben)*: Ein Stapel wird **am Zugende** verbraucht und fügt **10 % des fehlenden Lebens als magischen Schaden** zu (mind. 1). Ein Stapel = 1 Runde Dauer; 3 Stapel = 3 Runden.
- **Instabil** *(negativ, stapelbar)*: Jeder Stapel hebt die Exekutionsschwelle um **2 % des max. Lebens**. Bei Erreichen der Schwelle wird die Figur beim Erhalt **irgendeines Schadens sofort exekutiert**. 1 Stapel = 2 %, 2 = 4 %, … 10 = 20 %.
- **Entwaffnet** *(negativ)*: Schadenverursachende Effekte, Fähigkeiten oder Angriffe können **nicht** benutzt werden. Bewegen, Heilen, **Schutz geben** und Buffen bleibt normal möglich. **Keine Standarddauer.**
- **Verstummt / Verstummen** *(negativ)*: Verhindert das Einsetzen von Fähigkeiten, Spells oder Skills. **Keine Standarddauer.**
- **Ermutigt / Ermutigen** *(**positiv / Buff**)*: Erhöht die Schadensreduktion um **20 %** (physisch und magisch). **Keine Standarddauer.**

##### Feld-Statuseffekte

- **In Brand gesteckt**: Auf brennenden Feldern können Einheiten **weder Kälte noch Gefroren** haben/erleiden. Am Zugende erleidet die Figur **Brandschaden (physisch) i. H. v. 6 % des max. Lebens**. Stapelt nicht; hält nur, solange die Einheit auf dem Feld steht.
- **Vereist**: **Pull- und Push-Fähigkeiten sind doppelt so effektiv.** Wird eine Figur auf einem vereisten Feld gefroren, verlängert sich Gefroren **auf unbestimmte Zeit** — bis zur Auflösung durch Schaden.
- **Giftnebel**: Appliziert der darauf stehenden Figur **einen Stapel Gift beim Betreten** und **zu Rundenbeginn** (normaler Giftschaden, magisch).
- **Nagelbett**: Jede Aktion (Angriff, Fähigkeit, Bewegung) kostet **10 % des max. Lebens**. Wird eine Figur auf ein Nagelbett-Feld gepusht/gepullt, kostet auch das **Betreten** 10 %. Dieser Schaden ist **total und nicht reduzierbar**.
- **Dichter Nebel**: Eine Figur darauf sieht nur **2 Felder weit**; ohne Sichtlinie kein Angriff möglich. Durch dichten Nebel kann man **nicht hindurchsehen**.
- **Blockiert**: Per Fähigkeit blockierte Felder sind für die Dauer des Effekts **nicht begehbar** und zählen als nicht begehbares Terrain — **Verbündete können sie normal betreten**.

- **Straucheln** *(negativ)*: Dauer 1 Runde. Reduziert die WID des Ziels um **50 %**. Wird ausgelöst wenn eine Einheit durch einen Push in ein unbegehbares Feld oder eine bereits belegte Position gedrückt wird.

---

#### Aggro- & Threat-System

**Grundprinzip:** Threat entsteht **ausschließlich durch Aktionen**, nicht durch Klasse oder Haltung. Tanken ist emergent: Wer vorne steht und threat-starke Fähigkeiten nutzt, hält die Aggro. Die Zielwahl der Gegner-KI folgt der Threat-Tabelle — die Zielwahl des **Spielers** ist davon unabhängig.

**Datenstruktur:** Jeder Gegner führt eine eigene Threat-Tabelle. Werte kumulieren über die Runden und zerfallen passiv (→ Decay).

**Threat-Formel:** `threat += baseValue × abilityCoeff × proximityMod`

| Parameter | Bedeutung |
|---|---|
| `baseValue` | Schaden bzw. Heilmenge der Aktion |
| `abilityCoeff` | Fähigkeits-spezifischer Multiplikator (s. u.) |
| `proximityMod` | 1.5 wenn Manhattan-Distanz (Angreifer → Gegner) ≤ 2 Felder (Frontline, §5.1), sonst 1.0 |

**Ability-Threat-Koeffizienten** (je Fähigkeit als `threatCoeff` hinterlegt, einzeln tunebar):

| Kategorie | `abilityCoeff` | Beispiele |
|---|---|---|
| Normaler Angriff | 1.0 | Basis-Nahkampf, Basis-Fernkampf |
| Schaden-Skills | 1.0 | Wuchtschlag, Wirbelschlag, Feuerball, Schildschlag |
| Heilung | 0.5 | Erste Hilfe, Zweiter Wind |
| Präzisions-/Snipe-Skills | 0.35 | Gezielter Schuss, Mehrfachschuss |
| Defensiv (Guard-Aktivierung) | flat `50 × 1.0` | Beschützen |
| Taunt | Sonderfall | s. u. |

**Hysterese (klebrige Aggro):** Ein Gegner wechselt das Ziel erst, wenn eine andere Einheit den Threat des aktuellen Ziels übersteigt — Nahkampf-Gegner ab **110 %**, Distanz-/Werfer-Gegner ab **130 %** (träger, damit sie schwerer von der Backline weggelockt werden). Verhindert Zielflackern.

**Decay:** Pro Gegnerzug verlieren alle Einträge **außer dem aktuellen Ziel** 5 % (`× 0.95`). Werte < 1 werden gelöscht.

**Taunt:** Keine flache Addition. Stattdessen `threat[Caster] = max(Tabelle) × 1.1` und Force-Lock des Gegners auf den Caster für **3 Züge** (überschreibt Hysterese). Eskaliert nicht bei Wiederholung, weil der Max-Wert die Basis ist.

**Guard (aktiv, WID):** Eine Einheit schützt einen Verbündeten für **2 Züge**. Der erzeugte Threat des Verbündeten wird 50/50 zwischen Guardian und Verbündetem aufgeteilt; die Aktivierung selbst erzeugt flat **50 Threat** gegen alle Gegner.

**Präsenz-Aggro:** Pure Präsenz erzeugt **keinen** Threat (der Proximity-Mod ist ein Multiplikator auf Aktionen, keine Aura). Präsenz-basierte Aggro ist **Ausrüstungs-Effekten / Auren** vorbehalten — z. B. das Offhand **Köderkolben** (§5.3 / `data/offhands.json`).

**Tuning-Werte (zentral `THREAT_CONFIG`, Ablageort → §10.3):** Frontline-Dist 2 · Proximity 1.5/1.0 · Hysterese 1.10/1.30 · Decay 0.05 · Taunt ×1.1 / 3 Züge · Guard 0.5 / 2 Züge · Defensiv-Flat 50.

---

#### Sichtbarkeit & Tarnung

**Kein Fog of War:** Die Karte ist generell aufgedeckt — Szenerien sind meist Schlachtfelder, auf denen ohnehin gekämpft wird. Tarnung betrifft einzelne Einheiten, nicht das Gelände (Feld-Sichtbeschränkungen wie *Dichter Nebel* laufen separat über Feld-Statuseffekte).

**Drei Sichtbarkeitszustände:**

| Zustand | Sichtbarkeit | Anvisierbar |
|---------|--------------|-------------|
| **Offenbar** | Jede Einheit sieht die Figur | Von allen |
| **Unsichtbar** | Nur verbündete Einheiten sehen die Figur | Von keinem Gegner |
| **Scheinbar** | Halbtransparent; generell unsichtbar, **aber** gegnerische Einheiten im Umkreis von 2 Feldern (Manhattan, §5.1) decken sie automatisch auf | Nur von Gegnern, die sie aufgedeckt haben (≤ 2 Felder) — andere Gegner nicht |

**Wechsel zu Offenbar (beendet Unsichtbar/Scheinbar):**
- Eigene Aktion: Angreifen oder einen Zauber wirken → sofort **Offenbar**.
- Getroffen werden: jeder Treffer (auch indirekt durch AoE oder Aura-Effekt), unabhängig vom Trigger → sofort **Offenbar**.

**Zielbarkeit:** Während **Unsichtbar** oder **Scheinbar** kann die Figur grundsätzlich nicht anvisiert werden — Ausnahme: eine **Scheinbar**-Figur, die ein Gegner ≤ 2 Felder aufgedeckt hat, kann von genau diesem Gegner anvisiert werden, von keinem anderen.

> **Querbezüge:** Das Offhand **Laterne** (*Erhellen*, §5.3) und der Jagdbogen-Eigenart **Jagdinstinkt** (§5.3) decken unsichtbare/scheinbare Gegner auf. Der Assassinen-Pfad *Schattenassassine* (§5.3) nutzt Tarnung als Kern-Utility.

- **Weitere Details:** *(folgt)*

### 5.3 Klassen & Waffen

Die Startklasse wird durch die Wahl der ersten Waffe im Prolog bestimmt.

**Prolog-Startwaffen:**

| Waffe | Klassen-Archetyp |
|-------|-----------------|
| Bogen | Schütze |
| Schwert | Krieger |
| Dolche | Assassine |
| Energiesphäre | Mystiker |
| Zauberstab | Magier |
| Zepter | *(Arathos — magische Nahkampfwaffe, nicht wählbar im Prolog)* |

> Vollständiges Waffensystem (alle Waffen, Stats, Gravuren) → folgt in eigenem Abschnitt

---

#### Klassen-Startattribute

| Klasse | VIT | WID | STR | GES | INT | WIL | MOB | Σ |
|--------|-----|-----|-----|-----|-----|-----|-----|---|
| Krieger | 20 | 20 | 10 | 10 | 10 | 10 | 3 | 80 |
| Assassine | 10 | 10 | 20 | 15 | 10 | 10 | 4 | 75 |
| Schütze | 10 | 10 | 15 | 20 | 10 | 10 | 3 | 75 |
| Magier | 10 | 10 | 10 | 10 | 15 | 20 | 3 | 75 |
| Mystiker | 15 | 15 | 10 | 10 | 15 | 10 | 3 | 75 |

> Speed-Basiswert aller Klassen: **1,0** (wird durch Ausrüstung modifiziert).  
> MOB-Maximum durch Items/Skillnodes: **5**.

---

#### Klassen-Archetypen

**Design-Prinzip:** Alle Klassen starten als versatile, nützliche Schablone. Durch den Skilltree entwickeln sie sich zu hochspezialisierten Einheiten. Die Progressionskurve ist bis Level ~25 linear, ab Level 35 straff. Die letzten 5 Level (46–50) sind ggf. hinter einer Klassen-Prüfung / einem Herausforderungsmodus gegattet.

**Max Level:** 50

---

##### Magier

**Identitätsattribut:** WIL (Willenskraft) — skaliert magischen Schaden; Voraussetzung für Top-Ausrüstung und Waffen  
**Sekundärattribute:** je nach Spezialisierung INT, VIT oder WID

**Spezialisierungen:**

| Pfad | Fokus | Kernattribute |
|------|-------|---------------|
| AOE-Magier | Flächenschaden, Elementarzauber | WIL + INT (Mana-Management) |
| Frontline-Magier | Nahkampf-Sustain, Auren, Thread-Zauber | WIL + WID |
| Beschwörer / Summoner | Beschworene Einheiten — skalieren mit VIT des Beschwörers | WIL + VIT |
| Chaos-Build | Fähigkeiten kosten HP statt Mana | VIT + WID |

**Wichtige Systemmechanik:** Mana-Verbrauch ist beim Magier ein echtes Thema — INT beeinflusst die Mana-Effizienz für alle Magier-Pfade.  
**Elementarzauber** + **Chaos-Zauber** als zwei übergeordnete Magie-Schulen.

---

##### Mystiker

**Identitätsattribut:** INT (Intelligenz) — skaliert Heilung, Schutzzauber und Buff-Dauer  
**Sekundärattribut:** WIL — skaliert Buff-Stärke

> **Terminologie:** Der Schadensabsorptions-Zauber heißt **Schutz** (nicht Schild), um Verwechslungen mit ausrüstbaren Schilden zu vermeiden. Diese Entscheidung gilt für das gesamte Spiel inkl. Gravurenbeschreibungen.

**Skalierungs-Logik:**
- Lange Buffs → INT
- Starke Buffs → WIL
- Starke Heilung & großer Schutz → INT

**Spezialisierungen:**

| Pfad | Fokus |
|------|-------|
| Heiler / Arzt | Heilung, Statuseffekt-Entfernung |
| Schildbuffer | Schutz-Stacking, präventiver Support |
| Debuffer | Feindliche Stats/Effekte schwächen |
| Alchemist | Tränke und Gegenstände werfen, Flächeneffekte |
| DoT-Build | Schaden über Zeit — für DD-orientierte Mystiker |

**Klassen-Synergie:** Mystiker synergieren mit fast jeder Klasse. Paradebeispiel: Berserker-Krieger + HoT/Buff-Mystiker.  
**Kein reiner Support:** Der Mystiker ist supportlastig, aber nicht ausschließlich Support.

---

##### Schütze

**Identitätsattribut:** GES (Geschicklichkeit)  
**Schadensprofil:** Primär physisch, eindimensionaler Schadenstyp auf verschiedenen Wegen

**Spezialisierungen nach Waffe:**

| Waffe | Distanz | Spielstil |
|-------|---------|-----------|
| Armbrust | Kurz | Hoher Einzelschaden, langsam |
| Langbogen | Lang | Maximale Reichweite, Positionierung wichtig |
| Jagdbogen | Mittel | Flink, gut zum Nachsetzen auf Ziele |
| Wurfmesser | Kurz-Mittel | Mehrere Ziele gleichzeitig treffen |
| Schleuder | Mittel | AoE-Treffer |

Jede Waffe hat individuelle Verbesserungsmöglichkeiten im Skilltree.

---

##### Krieger

**Identitätsattribut:** STR (Stärke) für Schadenpfad; WID (Widerstandskraft) + VIT für Tankpfad  
*(Anmerkung: Abkürzung STR statt STÄ — STÄ sieht ungewohnt aus)*

**Spielstil:** Vielseitiger Nahkämpfer. Alles womit man draufhauen kann — Hauptsache es macht Rums.

**Spezialisierungen:**

| Pfad | Fokus | Kernattribute |
|------|-------|---------------|
| Spott-Tank | Aggro-Kontrolle, Bollwerke, unpassierbare Barrieren | WID + VIT |
| Berserker | Zäh, schwer kleinzukriegen, Ausdauerschaden | VIT + STR |
| Schadenpfad | Direktschaden, Dualwielding-Focus-Node | STR |

**Tank-Fähigkeiten:** Schutzblindungen, Bollwerke (für Gegner unpassierbar), Projektilblockaden, Schutzfelder.  
**Waffen:** Hammer + Schild, Rammbock, Dualwielding *(weitere folgen im Waffensystem)*

---

##### Assassine

**Identitätsattribut:** STR (Stärke) — primär für Angriffsstärke  
**Identität:** Verwertet alle Attribute gut, aber STR ist die Kernausrichtung  
**Schadensprofil:** Kurze, heftige Schadensschübe (Bursts); primär physisch + Gift → ermöglicht auch magischen Schaden  
**Rolle:** Kill-Reset, Backline-Infiltration  
**Schwierigkeit:** Taktisch am anspruchsvollsten zu spielen

**Spezialisierungen:**

| Pfad | Kernattribute | Spielstil |
|------|---------------|-----------|
| Hit & Run | STR + GES | Hoher Burst, schnell aus der Gefahrenzone |
| Schattenassassine | STR + INT | In Nebel hüllen, magische Utility |

**Waffen:** Dolchpaar, Kampfmesser (Einhand-Dolch), Rapier  
**Weitere Spezialisierungen:** *(folgt im Waffensystem)*

---

#### Waffensystem — Waffentypen & Eigenarten

Jede Waffe besitzt eine **Eigenart** — eine passive oder reaktive Sondermechanik, die den Spielstil der Waffe definiert.

| Waffenklasse | Waffentyp | Hand | Gewicht | Eigenart | Effekt |
|---|---|---|---|---|---|
| Schwerter | Breitschwert | E | Ausgeglichen | **Frontmann** | +15 % Rohschaden bei Frontalangriff. |
| Schwerter | Falchion | E | Ausgeglichen | **Erbarmungslos** | Trifft das Falchion eine Einheit, wird diese mit **Opfer** markiert (nur eine Einheit gleichzeitig; Markierung springt beim nächsten Treffer auf die neue Einheit). Markierte Einheit erhält von weiteren Falchion-Angriffen **+20 % Schaden** und Angriffe haben **20 % Chance, Blutung** auszulösen. |
| Äxte | Kampfaxt | B | Bedächtig | **Kollateralschaden** | Treffen alle möglichen Ziele (Hauptziel + bis zu 2 Nachbarn), erhalten **alle Getroffenen zusätzlich 30 % des Schadens** dieses Angriffs. |
| Kriegsgeräte | Hammer | E | Bedächtig | **Trägheit** | Angriffe mit dem Hammer **reduzieren den MOB des Ziels um 1** für dessen nächsten Zug. |
| Kriegsgeräte | Rammbock | B | Träge | **Fliehkraft** | Pusht das Ziel **1 Feld nach hinten**. Ist das Feld unbegehbar oder belegt, erhält das Ziel stattdessen **10 % seiner max. LP als Schaden** und den Statuseffekt **Straucheln** (1 Runde, −50 % WID). |
| Kriegsgeräte | Zepter | B | Ausgeglichen | **Manavampir** | **20 % des verursachten Schadens** werden dem Angreifer als Mana erstattet. |
| Stabwaffen | Pike | E | Ausgeglichen | **Duellist** | Trifft ein Angriff einen Gegner, darf die Einheit sofort **2 Felder ohne MOB-Kosten** gehen (max. einmal pro Zug, aber mehrmals pro Runde möglich). |
| Stichwaffen | Dolchpaar | B | Schnell | **Dopplereffekt** | Das Dolchpaar sticht **zweimal zu**, jeder Stich verursacht **65 % des normalen Schadens**. |
| Stichwaffen | Rapier | E | Schnell | **Fechtkunst** | Parieren triggert **immer einen Gegenschlag**. Universeller **+20 % Bonus auf die Parieren-Chance**. |
| Stichwaffen | Stilett | E | Schnell | **Meuchelschlag** | Backstabs triggern **immer Blutung**. Backstabs haben **+50 % Schaden**. |
| Bogenwaffen | Jagdbogen | B | Wendig | **Jagdinstinkt** | Deckt **unsichtbare Gegner** innerhalb der eigenen Bewegungsreichweite (MOB) auf. |
| Bogenwaffen | Repetierarmbrust | E | Wendig | **Techniker** | Wurde letzten Zug **kein Angriff** ausgeführt, wird ein zweiter Bolzen geladen — der nächste Angriff verursacht **+50 % Schaden**. |
| Bogenwaffen | Langbogen | B | Ausgeglichen | **Heckenschütze** | Wurde die Einheit letzten Zug **nicht bewegt**, verursacht sie diesen Zug **+30 % Schaden**. |
| Bogenwaffen | Kriegsarmbrust | B | Bedächtig | **Durchschlagskraft** | Alle Angriffe haben **50 % Rüstungsdurchdringung (RD)**. |
| Zauberwaffen | Zauberstab | E | Wendig | **Energiefaser** | Erhält die Einheit **zwei Züge lang keinen Schaden**, entsteht ein **Energieschild (Schutz)** in Höhe des **maximalen Mana-Pools**. |
| Zauberwaffen | Energiesphäre | E | Wendig | **Segnung** | Heilungen dieser Einheit wirken zu **Beginn des nächsten Zuges erneut**, aber nur zu **20 % des ursprünglichen Wertes**. |

---

#### Waffensystem — Fernkampfwaffen: Bögen (drei Distanzprofile)

**Kern:** Reichweite als Ressource. Positionierung ist eine aktive Entscheidung.

**Reichweite & Schadens-Falloff**

- Fernkampfwaffen greifen im **Manhattan-System** an. Die Anzahl der Felder ist von der Waffe abhängig.
- In der Waffenbeschreibung bedeutet die Notation z. B. **3–4/5**: Der meiste Schaden wird auf **3–4 Feldern** Reichweite erzielt (optimale Zone); die **maximale** Reichweite ist **5** Felder.
- Außerhalb der optimalen Zone verliert man **pro Feld 30 % Schaden und Trefferchance**.
  - Beispiel: Auf Feld 3–4 sind Schaden und Trefferchance 100 %, auf Feld 2 und 5 jeweils 70 %, usw.
  - Felder mit Trefferchance ≤ 0 % werden **nicht angezeigt**.
- Dies gilt ebenso für das **Ankerfeld von Bogenschützenfähigkeiten**.
  - Beispiel: Ein **Pfeilhagel**, der von einem Jagdbogen auf ein Feld in 5 Feldern Entfernung gewirkt wird (Wirkungsbereich 2 Felder, Manhattan), hat auf jedem Feld um das Zielfeld eine Chance von **70 %**, insgesamt **70 % Schaden** zu verursachen.

**Nahkampf**

- Je nach Waffe haben Bögen Nahkampfmali; diese werden in der jeweiligen Waffe klar beschrieben.
- „Nahkampf" bedeutet für den Bogen **immer ein Feld orthogonaler Abstand**.

**Distanzprofile**

| Waffe | Optimale Reichweite | Nahkampf | Zu weit | Identität |
|---|---|---|---|---|
| **Repetierarmbrust** *(E, Wendig)* | 1–2 Felder | kein Malus (0–1) | ab 3 | Einhändig, leicht — mobiler Kurzdistanz-Schütze; Offhand möglich |
| **Kriegsarmbrust** *(B, Träge)* | 1–2 Felder | kein Malus (0–1) | ab 3 | Beidhändig, schwer — maximaler Einzelschaden & RD auf kurze Distanz |
| **Jagdbogen** *(B, Ausgeglichen)* | 3–4 Felder | −50 % | ab 5 | Mittlere Distanz, Generalist |
| **Langbogen** *(B, Bedächtig)* | 4–5 Felder | **kein Angriff** | ab 6 | Maximale Reichweite, maximales Nahkampf-Risiko |

**Adlerauge-Interaktion:** erweitert **beide** Grenzen um +1 (optimale Zone und Malus-/Reichweitengrenze).

| Waffe | Optimale Reichweite | Nahkampf | Zu weit |
|---|---|---|---|
| **Jagdbogen** ohne Adlerauge | 3–4 Felder | −50 % (0–1) | ab 5 |
| **Jagdbogen** mit Adlerauge | 3–5 Felder | −50 % (0–1) | ab 6 |

> **Konsequenz:** Adlerauge auf der Armbrust ist mechanisch sinnlos — das System zeigt das von selbst, ohne ein explizites Verbot.

---

#### Einhand / Zweihand & Offhand-System

Waffen sind **Einhand (E)** oder **Zweihand (B)** — siehe `Hand (E/B)` in `data/weapons.json`.

| Waffentyp | Zweite Hand | Ausgleich |
|-----------|-------------|-----------|
| **Einhand (E)** | Offhand **oder** zweite Einhandwaffe (Dualwielding) | — |
| **Zweihand (B)** | belegt, kein Offhand | **+35 % auf die Grundwerte** der Waffe |

- **Zweihand-Ausgleich:** Da Zweihänder kein Offhand führen können, erhalten sie **+35 %** auf ihre Grundwerte (Prim./Sek. Wert).
- **Implementierung (festgelegt):** Die Werte in `data/weapons.json` bleiben **echte Grundwerte**; der +35 %-Aufschlag wird **nicht eingerechnet**, sondern **beim Ausrüsten/Anzeigen** als globaler, an einer Stelle tunebarer Faktor (`meta.zweihand_grundwert_bonus`) aufgeschlagen.
  - **Informationskarte:** zeigt für Zweihänder den **fertigen Endwert** und den Bonus als eigene Zeile — z. B. *„Schaden 27 (Grundwert 20 +35 % Zweihand)"*. So bleibt die Datenquelle ehrlich und der Bonus für den Spieler sichtbar.
  - **Begründung:** Die Waffenwerte werden zentral aus `stat_skalierung` abgeleitet (Balancing-Tabelle). Ein eingerechneter Bonus würde beim nächsten Balancing-Pass überschrieben oder mit der Klassen-Flavor-Differenz vermischt; ein globaler Faktor bleibt sauber und an einer Stelle änderbar.
- **Freie Kombination:** Jedes Offhand ist mit jeder Einhandwaffe kombinierbar; die Affinitäten in `data/offhands.json` sind Empfehlungen, keine Einschränkungen.

**Offhands** sind **keine Waffen**, sondern Gimmicks/Hilfsmittel mit einer **identitätsstiftenden Eigenart**. Wie Waffen haben sie Klasse, Typ, Gewichtsklasse, Seltenheitsstufen (Kupfer→Stellar) und Gravur-Slots. **Jedes Offhand trägt genau ein Hauptattribut.**

> **Eigenart vs. Gravur:** Die **Eigenart** ist fest und identitätsstiftend (*was das Offhand ist*). Modulare Effekte (z. B. ein Enterhaken, der heranzieht) laufen über **Gravuren** in den Gravur-Slots. **Gravur-Slots:** bis Stahl 1, ab Titan 2.

| Klasse | Typ | Gew.-Klasse | Attr. | Eigenart |
|--------|-----|-------------|-------|----------|
| **Schild** | Buckler | Wendig | GES | **Gegenschlag** — 50 % Chance auf die Reaktion *Gegenschlag* (§5.2) bei Nahkampftreffer |
| **Schild** | Turmschild | Träge | WID | **Bollwerk** — hoher Block; 50 % Chance, Projektile abzufangen (Block + Zauberblock), für Träger + angrenzende Verbündete |
| **Magischer Fokus** | Foliant | Ausgeglichen | WIL | **Verstärkung** — +30 % Zauberschaden, +30 % Manakosten |
| **Magischer Fokus** | Energiekristall | Schnell | INT | **Resonanz** — −30 % Manakosten, −50 % Zauberschaden |
| **Hilfsmittel** | Kampfkette | Bedächtig | STR | **Reichweite** — +1 Nahkampfreichweite |
| **Hilfsmittel** | Laterne | Wendig | GES | **Erhellen** — Sicht- + Zauberreichweite je +2; deckt scheinbare/unsichtbare Gegner in 4 Feldern auf |
| **Hilfsmittel** | Fester Gürtel | Ausgeglichen | WID | **Standhaft** — ignoriert alle Push-/Pull-Effekte |
| **Hilfsmittel** | Fackel | Schnell | GES | **Hetzjagd** — +Geschwindigkeit/Bewegung (vorl. +1) |
| **Hilfsmittel** | Signalhorn | Wendig | WIL | **Sammeln** *(aktiv)* — Verbündete +10 % Initiative bis nächsten Zug; CD 5 Züge |
| **Hilfsmittel** | Standarte | Träge | WIL | **Heerführer** — Verbündete in 3 Feldern +10 % Schaden & +10 % Schadensreduktion |
| **Hilfsmittel** | Rauchschwenker | Wendig | INT | **Spezereien** — vom Träger gewirkte Heilungen +20 % effektiver |
| **Hilfsmittel** | Köderkolben | Schnell | VIT | **Achtung!** — +20 % Threat-Gen.; Threat-Aura 2 Felder (Präsenz-Aggro, §5.2) |

> Vollständige Daten (12 Typen × 7 Stufen = 84 Einträge, mit Materialien, Preisen, Slots): **`data/offhands.json`**. Prim.-Werte/Slot-Kapazitäten sind aktuell Platzhalter (Balancing).

---

### 5.4 Skill- & Fähigkeitssystem

- Jede Klasse hat einen eigenen Skilltree mit mehreren Spezialisierungspfaden
- Synergien zwischen Klassen sind zentral für taktische Tiefe
- Erste Synergien werden im Prolog-Tutorial eingeführt
- Klassen-Arks (→ §9.5) schalten besondere Aufträge per klassenspezifischer Herausforderung frei
- **Details (Skilltree-Struktur, Punkte, Respec):** *(folgt)*

### 5.5 Fraktionsboni

| Fraktion | Bonus | Effekt |
|----------|-------|--------|
| Menschen | Gemeinschaft | +Regeneration pro Mensch auf dem Feld |
| Orks | *(folgt)* | |
| … | | |

### 5.6 Attribute

Alle Attribute werden mit den ersten drei Buchstaben in Großbuchstaben abgekürzt.

| Kürzel | Attribut | Primäre Wirkung |
|--------|----------|-----------------|
| WIL | Willenskraft | Magischer Schaden; Voraussetzung für Top-Ausrüstung |
| INT | Intelligenz | Mana-Pool/-Effizienz; Heilungs- und Schutzskalierung; Buff-Dauer |
| VIT | Vitalität | HP-Pool; Skalierung von beschworenen Einheiten |
| WID | Widerstandskraft | Prozentuale Schadensreduktion (physisch + magisch) — Formel in §5.2; flache Reduktion läuft über Rüstung/Resistenz |
| STR | Stärke | Physischer Schaden (Abkürzung STR statt STÄ) |
| GES | Geschicklichkeit | Bewegung, Ausweichen, Schütze-Skalierung |
| *(weitere folgen)* | | |

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
- [ ] Skilltree-Struktur ausarbeiten (Punkte pro Level, Respec) — erstes gemeinsames Code-Projekt
- [ ] Alle Skilltrees ausarbeiten (Struktur, Punkte, Respec-Möglichkeit)
- [ ] Klassen-Arks für alle Klassen definieren (Freischalt-Bedingungen & Rewards)
- [ ] Waffensystem ausarbeiten (inkl. Gravuren, Crafting, Aufwertung, Verfeinerung)
- [ ] Weitere Regionen definieren
- [ ] Hub Tag/Nacht-Logik definieren
- [ ] Hub visuelle Progression (Siedlung wächst) konzipieren
- [ ] Rekrutierungs-Taverne ausarbeiten
- [ ] Charakter-Erstellungssystem (Erscheinungsbild) definieren
- [ ] Gegenreaktions-Mechaniken ausarbeiten (Gegenschlag, Zauberblock — Detailwerte)
- [ ] Trefferchance & Krit-Grundregeln definieren
- [ ] WID-Cap final festlegen (Hard-Cap 100 vs. Soft-Cap via Skilltree)
- [x] Einhand/Zweihand-Systematik + Offhand-System definiert; `data/offhands.json` befüllt (12 Typen × 7 Stufen, §5.3)
- [ ] Offhand Prim.-Werte & Slot-Kapazitäten kalibrieren (aktuell Platzhalter) + Stufe-7-Offhands ausarbeiten
- [x] Zweihand-Ausgleich (+35 %) festgelegt: globaler Aufschlag beim Anzeigen/Ausrüsten (`meta.zweihand_grundwert_bonus`), Grundwerte bleiben echt; Infokarte zeigt Endwert + Bonus-Zeile
- [ ] Aggro/Threat- und Sicht-Detailwerte final tunen (§5.2)
- [ ] Rüstungs-Items Kopf/Körper/Füße designen (→ `data/kopf-/koerper-/fussausruestung.json` füllen — Scaffolds liegen vor)
- [ ] Stufe-7-Waffen (Stellar) Werte/Slots ausarbeiten (aktuell Platzhalter)
- [ ] Waffentypen Gewichtsklassen-Zuweisung vervollständigen (alle 13 Typen)
- [ ] Kriegsarmbrust Distanzprofil von Repetierarmbrust abgrenzen (bisher identisch, ggf. differenzieren)
- [ ] Waffensystem ausarbeiten (Gravuren, Crafting, Aufwertung, Verfeinerung)
- [ ] Alle Skilltrees ausarbeiten (Struktur, Punkte, Respec-Möglichkeit)
- [ ] Klassen-Arks für alle Klassen definieren (Freischalt-Bedingungen & Rewards)
- [ ] Ork-Klassen & KI-Verhalten definieren
- [ ] Ork-Fraktionsbonus definieren
- [ ] Weitere Regionen definieren
- [ ] Hub Tag/Nacht-Logik definieren
- [ ] Hub visuelle Progression (Siedlung wächst) konzipieren
- [ ] Rekrutierungs-Taverne ausarbeiten
- [ ] Charakter-Erstellungssystem (Erscheinungsbild) definieren
- [ ] Arathos-Backstory intern dokumentieren (spoilerbehaftet)
- [ ] Technische Specs vervollständigen (Sprache, Zielplattform, Projektstruktur)
- [ ] Tileset- & Sprite-Specs definieren (Auflösung, Größen, Palette)
- [ ] Credits-Liste aufbauen (Assets, Tools, Plugins)
- [ ] Audio-Konzept definieren

> **Tech-Evaluation (29.06.2026) — GodotGAS / Gameplay Ability System:** Geprüft, ob das GAS-Framework ([Asset Store](https://store.godotengine.org/asset/indiegamedad/godotgas/)) als Engine für das Gravursystem taugt. Fazit: konzeptionell passend (Gravuren = datengetriebene „Gameplay Effects", die Attribute modifizieren), aber GAS ist ein Fundament für die *gesamte* Stat-/Skill-/Buff-Schicht, kein Einzel-Plugin — und primär auf Echtzeit ausgelegt (Cast-Zeiten/Cooldowns in Sekunden statt Runden). **Entscheidung: vorerst kein Framework.** Erst Waffen- & Gravursystem im GDD designen, dann prüfen, ob schlanker Eigenbau reicht (vermutlich ja). Kostenlose MIT-Alternative zum Reinschnuppern ins Muster: `OctoD/godot-gameplay-systems`.
