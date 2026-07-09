# AXIOM — Game Design Document

> *"In seinem eigenen Weltbild hat jeder Mensch Axiome, ob er es will oder nicht. Dieses Spiel lädt dazu ein, sie zu hinterfragen."*

**Version:** 0.23  
**Stand:** 2026-07-09  
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
   - 5.7 [Gravurensystem](#57-gravurensystem)
   - 5.8 [Crafting — Die Resonanz-Matrix](#58-crafting--die-resonanz-matrix)
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
   - 8.5 [Lex Tactica — Kompendium](#85-lex-tactica--kompendium)
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
    - 10.4 [Placeholder-Assets (MVP)](#104-placeholder-assets-mvp)
    - 10.5 [Zielplattform & Plattform-Strategie](#105-zielplattform--plattform-strategie-entschieden-2026-07-04)
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
- Konkrete MOB-Basiswerte je Klasse → Tabelle **Klassen-Startattribute** (§5.3).

### 5.2 Kampfsystem

- **Schadens-/Angriffsarten:** Nahkampfangriff, Fernkampfangriff, Zauber, Fähigkeit
- **Schadenstypen:** Physisch, Magisch, **Elementar** *(→ Details „Schadenstyp Elementarschaden" unten)*
- **Defensive Werte:**
  - **Rüstung** — flacher Abzug gegen *physischen* Schaden (pro Treffer)
  - **Resistenz** — flacher Abzug gegen *magischen* Schaden (pro Treffer)
  - **Elementardiffusion** — flacher Abzug gegen *elementaren* Schaden (pro Treffer), ein globaler Wert gegen alle vier Elemente (→ „Schadenstyp Elementarschaden" unten). Symmetrisch zu Rüstung/Resistenz; greift nur gegen Elementarschaden.
  - *(„Block" ist kein Wert mehr, sondern eine Reaktion → siehe Reaktionen)*
- **Schadensreduktion (Attribut):** **WID** liefert die **prozentuale** Reduktion für alle drei Typen (physisch, magisch **und** elementar); **WIL** bleibt rein offensiv (magischer Schaden). Der Flat-Abzug läuft typ-getrennt über Rüstung (phys.), Resistenz (mag.) und Elementardiffusion (elem.).
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

**Magischer Angriff (Nah- & Fernkampf):**
```
Rohschaden = WIL (Einheit) + WIL (Waffe) + Buffs/Debuffs
```

> STR und WIL kumulieren aus allen Quellen (Basisattribut + Waffe + Ausrüstung + Buffs).

> **Reichweitenunabhängig — final** *(entschieden 2026-07-08, löst die am 2026-07-07 vertagte tiefere Diskussion ab)*: Diese Formel gilt für **jeden** Zauber-/Magieangriff, unabhängig von der Waffenreichweite — sie deckt also auch Zauberstab und Energiesphäre ab (beide `Reichweite 3`), nicht nur echten Nahkampf. Es gibt bewusst **keine separate Fernkampf-Magisch-Formel und keinen Trefferchance-Falloff** wie bei Bögen: Zauber-Fernangriffe sind seltener als Schützen-Angriffe (Mana-Kosten, geringere Angriffe/Zug), und Zauberwaffen bekommen bewusst **keine größere Reichweite** — wer aus der Backline zaubern will, muss näher ran (Reichweite bleibt bei 3). Der Ausgleich zwischen Fernkampf- und Frontline-Magier läuft über den Skilltree-Pfad (WIL+WID = zäher, aber exponierter, §5.4), nicht über eine eigene Formel. Feintuning bei Bedarf über die Reichweiten-Zahl selbst, nicht über eine neue Mechanik — Playtests (Phase 1) zeigen, ob das reicht.

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
- **Rüstung (physisch) / Resistenz (magisch) / Elementardiffusion (elementar) → flacher Abzug pro Treffer.** Das ist *Panzerung* — pro Schadenstyp genau ein Flat-Wert; Squishy-Builds haben **≈ 0**. (Elementardiffusion nur über Element-/Themen-Set-Ausrüstung, → §5.2 „Elementarschaden".)
- **Rüstungsdurchdringung (RD) → prozentual**, senkt **den zum Treffer passenden Flat-Wert** des Ziels **vor** der Berechnung — Rüstung bei physisch, Resistenz bei magisch, **Elementardiffusion bei elementar** *(generalisiert 2026-07-08 — „Elementar-Durchdringung" ist kein eigener Stat, sondern derselbe RD-Wert, angewendet auf den elementaren Flat-Wert, spiegelbildlich zu WID: eine Durchdringung, drei Ziele)*. Wirkt **nur auf den Flat-Wert, nicht auf die WID-Prozentreduktion** — RD kontert Panzerung, nicht allgemeine Zähigkeit.

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

**WID-Cap — Entscheidung: kein Cap** *(2026-07-03)*: Die Formel begrenzt sich selbst — sie nähert sich 100 % nur asymptotisch (WID 100 = 50 %, WID 200 = 66,7 %), jeder weitere Punkt bringt prozentual weniger. Ein künstlicher Deckel ist damit überflüssig; das Balancing läuft über die **Verfügbarkeit** von WID (Items, Skilltree-Nodes, Buffs), nicht über eine Sonderregel.

---

#### Schadenstyp Elementarschaden *(2026-07-06, Diffusion-Modell 2026-07-07)*

**Dritter Schadenstyp** neben Physisch und Magisch — **strukturell vollkommen symmetrisch** zu den beiden bestehenden: eigener Flat-Wert + dieselbe WID-Prozentreduktion. Keine Sonderregel, kein „ignoriert die Panzerung"-Sonderfall mehr.

- **Eigener Flat-Wert: Elementardiffusion** — reduziert Elementarschaden flach pro Treffer, genau wie **Rüstung** den physischen und **Resistenz** den magischen Schaden reduziert.
- **Rüstung und Resistenz greifen NICHT gegen Elementarschaden** (und umgekehrt Elementardiffusion nicht gegen physisch/magisch) — jeder Typ hat exakt einen zugehörigen Flat-Wert.
- **WID reduziert alle drei Typen gleich** (prozentual, `WID/(WID+100)`) — die allgemeine Zähigkeit ist typ-neutral.
- **Wird aus dem Gesamt-Rohschaden herausgeschnitten, nicht addiert:** Trägt ein Angriff einen Element-Anteil (z. B. Bogen „20 % Hitze"), sind das 20 % **des ohnehin berechneten Rohschadens** — der Rest bleibt physisch bzw. magisch. Ein 50-Roh-Treffer mit 20 % Hitze = **10 Elementar + 40 konventionell**, nicht 60.

**Die drei Reduktions-Achsen (symmetrisch):**

| Schadenstyp | Flat-Wert (pro Treffer) | %-Wert |
|---|---|---|
| Physisch | **Rüstung** | WID |
| Magisch | **Resistenz** | WID |
| Elementar | **Elementardiffusion** | WID |

**Die vier Elemente** *(Element ≠ Schadensart — die Schadensart ist bewusst anders benannt, damit sie nicht mit den gleichnamigen Statuseffekten kollidiert, z. B. Brennen zum Feuer)*:

| Element | Schadensart |
|---|---|
| **Feuer** | Hitzeschaden |
| **Eis** | Kälteschaden |
| **Natur** | Terraschaden |
| **Donner** | Elektroschaden |

Ein Wert Elementardiffusion wirkt gegen **alle vier** Elemente gleich (ein globaler Flat-Wert, keine Feuer-/Eis-Einzelwerte). *Namenswahl: „Diffusion" statt „Widerstand", um Verwechslung mit dem Attribut **Widerstandskraft (WID)** und dem physisch/magisch-Flat-Wert **Resistenz** zu vermeiden.*

**Abgrenzung magisch ↔ elementar** *(löst die Grenzfrage über bestehende Lore, §5.3)*: **Elementarschaden** stammt aus der **Elementar-Zauberschule** und aus elementalen Anteilen auf Waffen/Gravuren (die vier Elemente). **Magischer Schaden** ist das *nicht-elementale* arkane Zeug der **Chaos-Zauberschule** (roher Willens-/Fluch-/Schattenschaden). Zwei Magieschulen → zwei Schadenstypen, kein Überlappungs-Graubereich.

**Formel** *(identische Pipeline für alle drei Typen — nur der Flat-Wert unterscheidet sich):*

```
Roh_elem  = Anteil × Roh_gesamt           (z. B. 20 % × 50 = 10)
Roh_konv  = Roh_gesamt − Roh_elem          (Rest: physisch ODER magisch)

R%           = WID / (WID + 100)           (gilt für alle drei Typen)
Schaden_konv = max( ⌈Roh_konv × (1 − R%)⌉ − Rüstung/Resistenz , 1 )
Schaden_elem = max( ⌈Roh_elem × (1 − R%)⌉ − Elementardiffusion , 1 )

Schaden_gesamt = Schaden_konv + Schaden_elem
```

**Beispiel** — Treffer für **70 Roh = 40 Hitze + 30 physisch**. „Diffusion" hier = Flat-Wert 12 (z. B. aus einem Element-/Themen-Set):

| Ziel | phys. Teil (30) | elem. Teil (40 Hitze) | Gesamt |
|---|---|---|---|
| **Squishy** (WID 30, Rüstung 0, Diff 0) | ⌈30×0,77⌉−0 = **24** | ⌈40×0,77⌉−0 = **31** | **55** |
| **Squishy** (WID 30, Rüstung 0, **Diff 12**) | **24** | 31−12 = **19** | **43** |
| **Tank** (WID 80, Rüstung 12, Diff 0) | ⌈30×0,56⌉−12 = 17−12 = **5** | ⌈40×0,56⌉−0 = **23** | **28** |
| **Tank** (WID 80, Rüstung 12, **Diff 12**) | **5** | 23−12 = **11** | **16** |

> **Lesart:** Elementardiffusion zieht flach vom Elementarteil ab — genau wie Rüstung vom physischen (12 → −12 auf den Elementartreffer). Ohne Diffusion frisst der Tank fast seinen ganzen Schaden über den Elementaranteil (23 von 28 = 82 %, weil seine Rüstung nur den physischen Teil abfängt); mit 12 Diffusion halbiert er ihn (23 → 11). Der Konter ist jetzt ein **normaler Verteidigungswert**, kein Sonderfall.

**Itemisierung — so werden Tanks abgestuft** *(Nutzer-Entscheidung 2026-07-07)*:

- **Pures Material** (`Theme/Set: "Pures Material"`, alle heutigen Einträge) trägt **nur Rüstung und/oder Resistenz** — **keine** Elementardiffusion. Damit ist **jeder** Tank in Rohmaterial-Rüstung grundsätzlich gegen physisch/magisch wirksam (Status quo unverändert).
- **Element-/Themen-/Set-Ausrüstung** (künftige Kategorie) kann **Elementardiffusion** tragen — gegebenenfalls gemischt mit einem Anteil Rüstung/Resistenz.
- **Spezialisierung:** Wer eine Achse stackt (Voll-Platte → Rüstung, Robe-Set → Resistenz, Element-Set → Elementardiffusion), wird in **dieser** Kategorie besonders zäh. Das ist ein bewusster Gear-**Trade-off** analog zum Attributsbudget (§5.3) — Diffusion konkurriert um Slots/Budget mit Rüstung/Resistenz, ist also kein Free Lunch.

**Design-Rollen (Stein-Schere-Papier):** Reine physische Panzerung (Platte) ist stark gegen physisch, aber **nackt gegen Elementar**, solange sie keine Elementardiffusion mitbringt — Elementarschaden bleibt der Konter gegen einseitige Panzer-Stacker, ohne dass der Schadenstyp strukturell unblockbar sein muss. **Quellen für Elementarschaden** *(Phase 1 zu befüllen)*: Waffen-/Gravuren-„X % Element"-Anteile, Elementarzauber, Element-Gravuren — bindet an die **Essenzen** des Crafting-Systems (Feuer-Essenz usw., §5.8).

**Begriff „Zauberschaden"** *(geklärt 2026-07-07)*: Boni wie „+X % Zauberschaden" (z. B. Offhand Foliant/Energiekristall, §5.3) beziehen sich auf den **Rohschaden an sich** — also auf `Roh_gesamt`, **bevor** der Elementar-Anteil herausgeschnitten wird (siehe Formel oben). Ein „+30 % Zauberschaden"-Bonus erhöht also automatisch **beide** Teile eines gemischten Treffers (elementar **und** konventionell-magisch) gleichermaßen, unabhängig vom Element-Anteil des jeweiligen Zaubers. Kein separater Elementar-spezifischer Schadensbonus-Begriff nötig.

**Statuseffekt-Harmonisierung** *(entschieden 2026-07-07)*: **Brennen** (Einheiten-Statuseffekt) und **„In Brand gesteckt"** (Feld-Statuseffekt) verursachen jetzt **Hitzeschaden** (Feuer-Element) statt physisch. **Vergiftet/Gift** und **Giftnebel** verursachen jetzt **Terraschaden** (Natur-Element) statt magisch. Beide DoTs bleiben in ihrer Mechanik unverändert (feste % von max. Leben bzw. fehlendem Leben, keine Reduktions-Pipeline) — nur der Schadenstyp-Tag ändert sich, was sie ab sofort für **Elementardiffusion**-Ausrüstung (nicht Rüstung/Resistenz) relevant macht, sobald DoTs regulär reduziert werden. **Blutung** bleibt bewusst unangetastet (weiterhin hälftig physisch/magisch) — sie ist an physische Waffen gebunden, nicht an ein Element. Umgesetzt in §5.2 „Statuseffekte" unten.

**Elementar-Durchdringung — entschieden** *(2026-07-08)*: Kein eigener Stat. RD ist bereits generisch (→ „Schadensreduktion — WID-Formel" oben) und wirkt auf **Elementardiffusion genauso wie auf Rüstung/Resistenz**. Ein **dedizierter** Elementar-Piercing-Waffentyp (analog zur Kriegsarmbrust als physischer „Plattenknacker") ist bewusst vertagt, bis die Element-/Themen-Set-Ausrüstung existiert und Elementar-Tank-Stacking überhaupt zum Balancing-Thema wird.

**Elementare Zusatzeffekte — Rollen & Mechanik** *(finalisiert 2026-07-09)*:

Jedes Element hat einen kleinen, deterministischen Kampf-Gimmick — das macht Elementarschaden für sich genommen lohnenswert, ohne eine zusätzliche taktische Rolle oder Itemisierungs-Voraussetzung zu brauchen. Jedes Build hat Zugang (kein Hard-Gate, konsistent mit „Jede Klasse kann alles", §5.3); der Spezialisierungsgrad läuft über Skilltree/Itemisierung.

*Rollen-Rahmen — zwei Achsen:*

| Achse | Element | Rolle |
|---|---|---|
| Schaden (Fokus ↔ Streuung) | Feuer | Offensiv |
| Schaden (Fokus ↔ Streuung) | Donner | Ausbreitung |
| Kontrolle (Zeit ↔ Raum) | Eis | Zeitlich |
| Kontrolle (Zeit ↔ Raum) | Natur | Räumlich |

Innerhalb einer Achse ist die Trigger-Häufigkeit identisch (gleiche „Währung"), nur die Ausrichtung unterscheidet sich. Feuer/Donner sind je nach Gegnerformation unterschiedlich stark (Feuer gegen Einzelziele, Donner gegen Gruppen) — bewusste taktische Differenzierung, keine Unbalance.

*Determinismus-Regel* (statt Prozent-Chance, konsistent mit der Trefferchance-Doktrin — 100 % Basis, kein Verfehlen-RNG, → „Trefferchance & Ausweichen" unten): **Jeder 3. Elementartreffer desselben Typs einer Einheit löst den Zusatzeffekt aus** (Balancing-Vorbehalt bei der „3"). Zähler läuft pro Einheit über Züge hinweg (kein Reset pro Zug), setzt sich nach Auslösung zurück — funktional dieselbe automatische Trigger-Logik wie die bestehenden Eigenarten (Spruchrolle „alle 7 Züge", Signalhorn „alle 5 Züge", §5.3): niemals aktiv auslösbar, immer automatisch.

**Zählt NICHT zum Elementartreffer-Zähler:** DoT-Ticks (Brennen, Vergiftet/Gift, „In Brand gesteckt", Giftnebel) — die laufen auf einer separaten Mechanik (fester %-Wert, keine reguläre Schadens-Pipeline) und lösen automatisch am Zugende aus, nicht als Ergebnis eines Angriffs. Es zählt nur ein direkter Angriffs-/Zaubertreffer durch die reguläre Pipeline. Verhindert, dass ein bereits brennendes/vergiftetes Ziel passiv (ohne aktiven Angriff) weitere Zusatzeffekte „freischaltet".

*Die vier Effekte:*

- **Feuer (Offensiv):** Appliziert **1 Stapel Brennen** (nutzt die bestehende Brennen-Mechanik 1:1, → „Statuseffekte" unten — kein neues Subsystem nötig). **Bewusster Regelbruch** gegen das ursprüngliche „kein Statuseffekt"-Prinzip — akzeptiert, weil hier kein neues, mit Bestehendem kollidierendes System erfunden wird, sondern ein bereits vorhandenes über einen zusätzlichen Trigger ausgelöst wird (anders als der verworfene Eis-Slow-Ansatz, der echt mit dem Kälte-Status kollidiert hätte).
- **Donner (Ausbreitung):** Der Schaden springt zusätzlich (~25 % des Elementaranteils, Balancing-Vorbehalt) auf ein gegnerisches Ziel **innerhalb von 2 Feldern um das ursprüngliche Ziel** — **fix, unabhängig von der Waffenreichweite des Angreifers** (sonst wäre Kettenblitz für Nahkämpfer mit Donner-Waffen praktisch tot, da ein zweiter Gegner direkt neben dem Angreifer stehen müsste). Kein Fallback, wenn kein Ziel in Reichweite ist — bewusst akzeptiert: Donner ist der Multi-Target-Spezialist und in Einzelduellen strukturell schwächer, das ist gewollt.
- **Eis (Zeitlich):** Verschiebt das Ziel **einen Platz später in der Zugreihenfolge** (nutzt das bestehende Speed-/Initiative-System, § „Speed-System" oben). Bewusst **keine** Bewegungs- oder Reaktionswert-Wirkung — das würde mit dem bestehenden, voll ausgebauten Kälte-Status (Reaktionsmalus + Einfrier-Chance, → „Statuseffekte" unten) kollidieren. Komplett andere Systemachse, keine Überschneidung.
- **Natur (Räumlich):** **Verankert** das Ziel für seinen **nächsten eigenen Zug** an seinem aktuellen Feld — kann weiterhin angreifen/Fähigkeiten nutzen, nur nicht bewegen. Kein Stack, läuft automatisch nach diesem einen Zug aus. Bleibt bewusst unter „Gefroren" (das zusätzlich Handeln blockiert).

**Itemisierung:** Der Zusatzeffekt ist eine **Grundeigenschaft des Schadenstyps** — nicht an Element-/Themen-Set-Ausrüstung gebunden (anders als Elementardiffusion, die weiterhin ausschließlich über künftige Sets kommt). Jede Einheit, die überhaupt Elementarschaden zufügt (Waffen-/Gravuren-Anteile, Elementarzauber), hat sofort Zugriff — sonst wäre der Elementar-Pfad vor dem Endgame komplett tot, weil sowohl Diffusion als auch Zusatzeffekt an noch nicht existierende Sets hängen würden.

**Idee B (Elementar-Reaktionssystem) — geparkt** *(2026-07-09)*: Ein Genshin-artiges System, bei dem das Kombinieren zweier Elemente einen Bonuseffekt auslöst, wurde diskutiert und bewusst **nicht** in die aktuelle Planung übernommen — wenn Idee A (obige Zusatzeffekte) Elementarschaden schon interessant genug macht, braucht es Idee B wahrscheinlich gar nicht. Zusätzliche Gegenargumente: eigener UI-/Tracking-Aufwand (haftende Elemente pro Gegner müssten sichtbar gemacht und über Züge verwaltet werden — passt nicht zum schlanken rundenbasierten Anspruch), Namenskollision mit dem bestehenden „Reaktionen"-Begriff (Gegenschlag/Parieren/Zauberblock/Konter), fehlende Element-Itemisierung als Grundlage. Nicht verworfen, aber nur bei Bedarf erneut aufgreifen — dann mit 1–2 generischen Reaktionstypen statt einer vollen Kombinationsmatrix.

**Offene Punkte** *(→ §11)*:

- **Element-/Themen-Set-Ausrüstung designen** (die einzige Diffusion-Quelle): Werteskala für Elementardiffusion, Mischverhältnis mit Rüstung/Resistenz, wie sie droppt/craftbar ist.

---

#### Trefferchance & Ausweichen

**Grundregel:** Es gibt keinen allgemeinen Trefferwurf. Angriffe treffen standardmäßig zu **100 %** — Abweichungen entstehen ausschließlich durch die zwei folgenden Mechaniken:

**1. Distanz-Falloff (Fernkampf):** Die Trefferchance des Fernkampfs **ist** der Reichweiten-Falloff (→ Distanzprofile, §5.3). Innerhalb der optimalen Zone treffen Fernkampfangriffe zu 100 % mit 100 % Schaden; **pro Feld außerhalb der Optimalzone (in beide Richtungen) sinken Trefferchance und Schaden um je 30 %**. Jenseits der **maximalen Reichweite** ist kein Angriff möglich — das Feld ist nicht anwählbar, unabhängig vom rechnerischen Restwert.

*Beispiel — fiktiver Bogen, optimal 3–4, maximal 6:*

| Feld | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Trefferchance / Schaden | 40 % | 70 % | **100 %** | **100 %** | 70 % | 40 % | — (außer Reichweite) |

Waffenspezifische Nahkampfregeln (z. B. Langbogen: **kein** Nahkampfangriff; Armbrüste: **kein** Malus auf 0–1) stehen im Distanzprofil der Waffe und ersetzen dort den generischen Falloff.

**2. Ausweichen (Verteidiger):** Die Basis-Ausweichchance jeder Einheit ist **0 %**. Ausweichen existiert nur durch explizite Quellen (z. B. Lederkluft +10 %, Sandale +5 %, Skills, Buffs) und wird von der Trefferchance des Angreifers abgezogen. Bewegungsunfähige Ziele (Betäubt, Gefroren) können nicht ausweichen.

---

#### Kritische Treffer

- **Basis-Kritchance:** **5 %** auf jeden Angriff.
- **Krit-Schaden:** **×1,5 Rohschaden** — der Bonus greift **vor** der Schadensreduktion (wie alle Rohschaden-Modifikatoren).
- **Erhöhung:** ausschließlich durch explizite Quellen (Skills, Gravuren, Eigenarten). Effekte wie *„dein nächster Angriff ist ein garantierter Krit"* setzen die Chance auf 100 %.
- **Keine Richtungs-Kopplung:** Backstab und Flankierung (→ Angriffsrichtungen) haben **keinen** generellen Einfluss auf Trefferchance oder Kritchance — sie bleiben reine Trigger für Eigenarten und Skills (z. B. Frontmann, Meuchelschlag).

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

- **Brennen** *(negativ, stapelbar bis 3)*: Beim Stapeln wird die Dauer auf 3 Züge zurückgesetzt; jede weitere Applikation setzt die Dauer erneut auf 3. Eine brennende Einheit erleidet **am Ende ihres Zuges Hitzeschaden i. H. v. 6 % des max. Lebens pro Stapel** *(Elementar/Feuer, umgetypt 2026-07-07 — vorher physisch)*.
- **Kälte** *(negativ, stapelbar bis 10)*: Die Figur verliert pro Zug einen Stapel. Jeder Stapel hat eine **5 % Chance, die Figur einzufrieren (→ Gefroren)** und mindert den Wert/die Chance jeder **Reaktion** (Gegenschlag, Parieren/Block, Zauberblock, Konter — → Reaktionen, §5.2) um **fix 10 % pro Stapel** (bei vollen 10 Stapeln sind Reaktionen also komplett deaktiviert). **Bei vollen 10 Stapeln** löst der nächste Treffer (Fähigkeit o. Ä.) **sofort Gefroren** aus.
- **Gefroren** *(negativ)*: Die Einheit kann sich weder bewegen noch angreifen. Der **nächste erlittene Schaden wird um 50 % verringert und löst Gefroren auf**. Dauer max. 2 Züge (Zug 1 = Applikationszug).
- **Festgehalten** *(negativ)*: Die Figur kann sich nicht bewegen, aber weiterhin angreifen und Fähigkeiten wirken. **Keine Standarddauer.**
- **Betäubt** *(negativ)*: Komplett bewegungs- und aktionsunfähig. Kann noch inspiziert und von Fähigkeiten anvisiert werden, führt aber keine eigenen Aktionen aus.
- **Gebrochen** *(negativ)*: Verringert jegliche Möglichkeit für **Schutz**, **Block** sowie Schadensreduktion. Wird ausgelöst durch das **gleichzeitige** Auftreten von **Blutung + Schwächen + Verwirren**. Dauer 2 Züge.
- **Schwächen** *(negativ, stapelbar)*: Erhöht die Anfälligkeit für **physischen** Schaden; die Höhe hängt vom Anwender ab. Jeder Stapel = 1 Zug Dauer. Ein Stapel wird **mit einem Angriff verbraucht**; zusätzlich verliert die Figur am Zugende einen Stapel (falls vorhanden).
- **Verwirren** *(negativ, stapelbar)*: Wie Schwächen, aber für **magischen** Schaden. Jeder Stapel = 1 Zug; ein Stapel wird mit einem Angriff verbraucht; zusätzlich −1 Stapel am Zugende.
- **Blutung** *(negativ)*: Kann nach der Schadensberechnung physischer Waffen auftreten (waffen-/passivabhängig). Verursacht **30 % des verursachten Schadens, verteilt über 3 Züge** (10 % pro Tick), beginnend mit dem Applikationszug. Der Tick-Schaden wird **hälftig in physisch und magisch** aufgeteilt und dann **nach Reduktion durch WID** abgezogen.
- **Vergiftet / Gift** *(negativ, stapelbar & verlängernd, sofern nicht anders beschrieben)*: Ein Stapel wird **am Zugende** verbraucht und fügt **10 % des fehlenden Lebens als Terraschaden** zu (mind. 1) *(Elementar/Natur, umgetypt 2026-07-07 — vorher magisch)*. Ein Stapel = 1 Runde Dauer; 3 Stapel = 3 Runden.
- **Instabil** *(negativ, stapelbar)*: Jeder Stapel hebt die Exekutionsschwelle um **2 % des max. Lebens**. Bei Erreichen der Schwelle wird die Figur beim Erhalt **irgendeines Schadens sofort exekutiert**. 1 Stapel = 2 %, 2 = 4 %, … 10 = 20 %.
- **Entwaffnet** *(negativ)*: Schadenverursachende Effekte, Fähigkeiten oder Angriffe können **nicht** benutzt werden. Bewegen, Heilen, **Schutz geben** und Buffen bleibt normal möglich. **Keine Standarddauer.**
- **Verstummt / Verstummen** *(negativ)*: Verhindert das Einsetzen von Fähigkeiten, Spells oder Skills. **Keine Standarddauer.**
- **Ermutigt / Ermutigen** *(**positiv / Buff**)*: Erhöht die Schadensreduktion um **20 %** (physisch und magisch). **Keine Standarddauer.**

##### Feld-Statuseffekte

- **In Brand gesteckt**: Auf brennenden Feldern können Einheiten **weder Kälte noch Gefroren** haben/erleiden. Am Zugende erleidet die Figur **Hitzeschaden i. H. v. 6 % des max. Lebens** *(Elementar/Feuer, umgetypt 2026-07-07 — vorher physisch)*. Stapelt nicht; hält nur, solange die Einheit auf dem Feld steht.
- **Vereist**: **Pull- und Push-Fähigkeiten sind doppelt so effektiv.** Wird eine Figur auf einem vereisten Feld gefroren, verlängert sich Gefroren **auf unbestimmte Zeit** — bis zur Auflösung durch Schaden.
- **Giftnebel**: Appliziert der darauf stehenden Figur **einen Stapel Gift beim Betreten** und **zu Rundenbeginn** (normaler Giftschaden, jetzt Terra) *(umgetypt 2026-07-07 — vorher magisch)*.
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

> Vollständiges Waffensystem (alle Waffen, Stats) → `data/weapons.json` + §5.3 | Gravurensystem → §5.7

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
> **Krieger Σ 80 ist Absicht** *(bestätigt 2026-07-03)*: Der Krieger startet mit 5 Punkten mehr als alle anderen Klassen (Σ 75) — das ist sein Tank-Fundament; als Ausgleich hat er nur MOB 3 (der Assassine z. B. MOB 4 bei Σ 75).

---

#### Klassen-Archetypen

**Design-Prinzip:** Alle Klassen starten als versatile, nützliche Schablone. Durch den Skilltree entwickeln sie sich zu hochspezialisierten Einheiten. Die Progressionskurve ist bis Level ~25 linear, ab Level 35 straff. Die letzten 5 Level (46–50) sind ggf. hinter einer Klassen-Prüfung / einem Herausforderungsmodus gegattet.

**Modulare Ausrüstungs-/Skilltree-Philosophie:**

- **Jede Klasse kann alles.** Nach der Prolog-Startwahl gibt es keine harte Waffen- oder Attribut-Sperre — ein Krieger kann sich z. B. Richtung Fernkampf-Tank (GES/WID) entwickeln, ein Magier Richtung physischem Hybrid-Build. Bewusste Design-Entscheidung, auch wenn das mehr Balancing-Aufwand bedeutet und das Risiko von schwer zu balancenden „Chaos-Builds" besteht.
- **Ein einziger, universeller Skilltree für alle Klassen** — kein separater Baum pro Klasse. Klassen unterscheiden sich nur durch ihren **Einstiegspunkt** in diesen einen Baum, nicht durch exklusiven Zugriff auf Teile davon. Erstes Umsetzungsprojekt in Godot mit dem Yggdrasil-Skilltree-Editor-Plugin.
- **Früh im Spiel:** lineare, empfohlene/emphatisierte Pfade nahe am Einstiegspunkt — als Führung, nicht als Zwang. Das System bleibt durchgehend modular.
- **Offene Evaluationsfrage:** Ob bestimmte starke Attribut-/Effekt-Kombinationen (z. B. Fernkampf-GES + magischer Schaden/Effekte) ab höheren Stufen **Attributsvoraussetzungen** zum Freischalten brauchen, wird noch geprüft — bewusst nicht final entschieden.

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

**Spezialisierungen nach Waffe** *(an die finalen Waffentypen in `data/weapons.json` angepasst)*:

| Waffe | Distanz | Spielstil |
|-------|---------|-----------|
| Repetierarmbrust | Kurz | Mobiler Kurzdistanz-Schütze, einhändig (Offhand möglich) |
| Kriegsarmbrust | Kurz | Hoher Einzelschaden + Rüstungsdurchdringung, langsam |
| Jagdbogen | Mittel | Flink, gut zum Nachsetzen auf Ziele |
| Langbogen | Lang | Maximale Reichweite, Positionierung wichtig |

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

**Waffen:** Dolchpaar, Stilett, Rapier *(→ Stichwaffen, `data/weapons.json`)*  
**Weitere Spezialisierungen:** *(folgt im Waffensystem)*

---

#### Waffensystem — Waffentypen & Eigenarten

Jede Waffe besitzt eine **Eigenart** — eine passive oder reaktive Sondermechanik, die den Spielstil der Waffe definiert.

> **Grundregel** *(2026-07-03)*: **Eigenarten sind niemals aktive Fähigkeiten** — sie wirken immer **passiv, reaktiv oder automatisch** (Auto-Trigger ggf. mit Cooldown). Aktivierbare Effekte sind ausschließlich Sache der **Gravuren** (aktive Gravur-Skills). Gilt für alle Ausrüstungskategorien: Waffen, Offhands, Rüstung, Zubehör.

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

> **Sekundärattribut-Umstellung Bogenwaffen** *(Nutzer-Entscheidung 2026-07-04)*: Jagdbogen & Langbogen tragen als Sekundärattribut **STR statt WID** — damit sind **alle Bogenwaffen GES (prim) / STR (sek)**, passend zur Fernkampf-Rohschadensformel (GES×0,75 + STR×0,25). Die Werte-Reihe blieb unverändert. Waffen-WID kommt seit der Kriegsgeräte-Neuordnung (2026-07-07, s. u.) von **Hammer & Rammbock (Prim)** sowie **Zepter (Sek)**.  
> **Zepter → Zweihand** *(2026-07-04)*: Das Zepter ist **beidhändig (B)** — die Dateneinträge in `data/weapons.json` (vorher fälschlich E) wurden angeglichen: +35 %-Anzeige-Bonus greift, Grundkapazität mit Zweihand-Bonus = 2/3/4/7/8/9/11.

---

#### Waffensystem — Stellar-Stufe (Stufe 7) *(kalibriert 2026-07-04)*

Stellar-Waffen sind die **Legendaries**: Endgame-Waffen mit verstärkter Typ-Eigenart, mehr Kapazität und Attributswerten als Kosmium — und einem versteckten Story-Zweck. Optisch stechen sie deutlich hervor (Partikel-/Shader-Effekte in Godot, macht der Nutzer später selbst).

**Attributswerte Stufe 7** — Fortschreibung der bestehenden Reihen (~×1,35, analog Rüstung 17→23):

| Reihe (S1–S6) | S7 Stellar | betrifft |
|---|---|---|
| 10/15/22/32/45/62 | **84** | Prim: Breitschwert, Falchion, Zepter, alle Bogenwaffen, Zauberstab, Energiesphäre |
| 12/18/26/38/54/74 | **100** | Prim: Kampfaxt |
| 8/12/18/26/38/52 | **70** | Prim: Pike, Dolchpaar, Rapier, Stilett; Sek: Stichwaffen & Zauberwaffen |
| 6/9/14/20/28/40 | **54** | Sek: Hammer (STR), Rammbock (STR), Pike (STR) |
| 5/8/12/18/26/38 | **52** | Sek: Schwerter (GES) |
| 4/6/9/14/20/28 | **38** | Sek: Kampfaxt (VIT), alle Bogenwaffen (STR) |
| 3/5/7/10/13/17 | **23** | Prim: Hammer, Rammbock (WID); Sek: Zepter (WID) |

**Kriegsgeräte-Neuordnung** *(2026-07-07, ersetzt die frühere „Sek-WID-Eindampfung")*: Hammer & Rammbock werden zu **physischen Zäh-Bruisern** — Primärattribut **WID** (statt STR), Sekundär **STR** (statt WID/VIT). Das Zepter bleibt der **Magie-Nahkämpfer** — Primärattribut bleibt **WIL** (zählt weiterhin voll in die Magisch-Nahkampf-Formel, WIL+WIL), nur das Sekundärattribut wechselt von INT auf **WID**. Ergebnis: Zepter tauscht Mana-Effizienz gegen Zähigkeit und bleibt voller Schadensträger — in Kombination mit der Eigenart **Manavampir** entsteht ein eigenständiges „Battlemage"-Archetyp, klar unterschieden von Zauberstab (reine Glaskanone) und Energiesphäre (Support/DoT). Die WID-Reihe ist überall **3/5/7/10/13/17/23** (= Körper-Rüstungs-Prim-Tier, 2/5-Budget-konform) — unabhängig davon, ob sie bei Hammer/Rammbock als Prim oder beim Zepter als Sek eingesetzt wird. In `data/weapons.json` unter `stat_skalierung.Kriegsgeräte` hinterlegt.

**Slots & Kapazität**: 5 Slots wie Kosmium (Aktiv/Passiv/Reaktiv/Mod./Spezial), aber **Grundkapazität +2 über Kosmium** — das ist der eigentliche Stellar-Unlock: Erst damit werden **L4/L5-Signatur-Gravuren** (Kosten 8/10, im passenden Slot 4/5, §5.7) realistisch spielbar. Max. Verfeinerung 3×. Zweihänder erhalten regelkonform nochmal +2:

| Basis-Kapazität S7 | E-Waffe | B-Waffe (+2) |
|---|---|---|
| Schwerter / Äxte / Kriegsgeräte / Stabwaffen: **9** | Breitschwert, Falchion, Hammer, Pike: 9 | Kampfaxt, Rammbock, Zepter: 11 |
| Stichwaffen / Bogenwaffen: **11** | Rapier, Stilett, Repetierarmbrust: 11 | Dolchpaar, Jagdbogen, Langbogen, Kriegsarmbrust: 13 |
| Zauberwaffen: **12** | Zauberstab, Energiesphäre: 12 | — |

→ E+Offhand bleibt vorn (z. B. Rapier 11 + Offhand 7 = 18 vs. Dolchpaar 13). ✓

**Stellar-Eigenarten ✦** — die Typ-Eigenart bleibt, wird aber verstärkt (Kennzeichnung „✦"; Zahlenwerte Balancing-Vorbehalt):

| Typ | Basis-Effekt | Stellar-Effekt ✦ |
|---|---|---|
| Breitschwert | +15 % Rohschaden frontal | **+25 %** |
| Falchion | Opfer-Mal: +20 % Schaden / 20 % Blutung | **+30 % / 30 %** |
| Kampfaxt | Nachbarn +30 % Zusatzschaden | **+50 %** |
| Hammer | Ziel −1 MOB | **−2 MOB** |
| Rammbock | Push 1 Feld; Kollision 10 % max-LP + Straucheln | **Push 2 Felder; 15 % max-LP** |
| Zepter | 20 % Schaden als Mana zurück | **35 %** |
| Pike | Nach Treffer 2 Felder Gratis-Bewegung | **3 Felder** |
| Dolchpaar | 2 Stiche à 65 % | **2 × 80 %** |
| Rapier | Parieren triggert Gegenschlag; +20 % Parieren | **+35 % Parieren** |
| Stilett | Backstab: immer Blutung, +50 % Schaden | **+80 % Schaden** |
| Jagdbogen | Deckt Unsichtbare in MOB-Reichweite auf | **MOB + 2 Felder** |
| Repetierarmbrust | Pause-Zug → nächster Schuss +50 % | **+75 %** |
| Langbogen | Stand-Zug → +30 % Schaden | **+50 %** |
| Kriegsarmbrust | 50 % RD | **75 % RD** |
| Zauberstab | 2 Züge ohne Schadenstreffer → Schutz = max. Mana | **schon nach 1 Zug** |
| Energiesphäre | Nachheilung 20 % im Folgezug | **35 %** |

**Lichtresonanz** *(verstecktes Story-Flag)*: Alle Stellar-Waffen tragen in `data/weapons.json` das unsichtbare Feld `Lichtresonanz: true` — Stellar-Licht durchdringt die **Schattenrüstung/Schattenschilde der Endfraktion**. Erscheint **nicht** auf der Item-Karte und ist kein Attribut; die konkrete Interaktionsregel wird beim Endfraktions-/Story-Design definiert und in der Story erklärt (Phase 1).

**Preise**: Kaufpreis — (nicht im Handel, nur Loot/Craft), Verkaufspreis 1000 Barren (Seltenheitstabelle).

---

#### Waffensystem — Fernkampfwaffen: Bögen (drei Distanzprofile)

**Kern:** Reichweite als Ressource. Positionierung ist eine aktive Entscheidung.

**Reichweite & Schadens-Falloff**

- Fernkampfwaffen greifen im **Manhattan-System** an. Die Anzahl der Felder ist von der Waffe abhängig.
- In der Waffenbeschreibung bedeutet die Notation z. B. **3–4/5**: Der meiste Schaden wird auf **3–4 Feldern** Reichweite erzielt (optimale Zone); die **maximale** Reichweite ist **5** Felder.
- Außerhalb der optimalen Zone verliert man **pro Feld 30 % Schaden und Trefferchance** (in beide Richtungen).
  - Beispiel: Auf Feld 3–4 sind Schaden und Trefferchance 100 %, auf Feld 2 und 5 jeweils 70 %, usw.
- Die **maximale Reichweite ist eine harte Grenze**: Felder jenseits davon sind **nicht anwählbar**, unabhängig vom rechnerischen Restwert (→ Trefferchance & Ausweichen, §5.2).
- In `data/weapons.json` sind beide Grenzen als eigene Felder hinterlegt: **`Reichweite optimal`** (z. B. „3–4") und **`Reichweite max`** (z. B. 5); die Anzeige-Notation `3–4/5` wird daraus abgeleitet. Nahkampf- und Zauberwaffen behalten die einfache Reichweiten-Zahl.
- Dies gilt ebenso für das **Ankerfeld von Bogenschützenfähigkeiten**.
  - Beispiel: Ein **Pfeilhagel**, der von einem Jagdbogen auf ein Feld in 5 Feldern Entfernung gewirkt wird (Wirkungsbereich 2 Felder, Manhattan), hat auf jedem Feld um das Zielfeld eine Chance von **70 %**, insgesamt **70 % Schaden** zu verursachen.

**Nahkampf**

- Je nach Waffe haben Bögen Nahkampfmali; diese werden in der jeweiligen Waffe klar beschrieben.
- „Nahkampf" bedeutet für den Bogen **immer ein Feld orthogonaler Abstand**.

**Distanzprofile**

| Waffe | Optimale Reichweite | Nahkampf | Max. Reichweite | Identität |
|---|---|---|---|---|
| **Repetierarmbrust** *(E, Wendig)* | 1–2 Felder | kein Malus (0–1) | 3 | Einhändig, leicht — mobiler Kurzdistanz-Schütze; Offhand möglich |
| **Kriegsarmbrust** *(B, Bedächtig)* | 1–2 Felder | kein Malus (0–1) | 3 | Beidhändig, schwer — maximaler Einzelschaden & RD auf kurze Distanz |
| **Jagdbogen** *(B, Wendig)* | 3–4 Felder | −50 % | 5 | Mittlere Distanz, Generalist |
| **Langbogen** *(B, Ausgeglichen)* | 4–5 Felder | **kein Angriff** | 6 | Maximale Reichweite, maximales Nahkampf-Risiko |

> **Gewichtsklassen korrigiert** *(2026-07-03)*: Diese Tabelle widersprach der Eigenarten-Tabelle und `data/weapons.json` — es gilt die Daten-Version (Kriegsarmbrust *Bedächtig*, Jagdbogen *Wendig*, Langbogen *Ausgeglichen*).  
> **Kriegsarmbrust vs. Repetierarmbrust — bewusst identisches Distanzprofil** *(entschieden 2026-07-03)*: Beide 1–2/3. Die Differenzierung läuft über Hand (E vs. B), Gewicht (Wendig vs. Bedächtig) und Eigenart (*Techniker* vs. *50 % RD*), nicht über die Reichweite.

**Adlerauge-Interaktion:** erweitert **beide** Grenzen um +1 (optimale Zone und Malus-/Reichweitengrenze).

| Waffe | Optimale Reichweite | Nahkampf | Max. Reichweite |
|---|---|---|---|
| **Jagdbogen** ohne Adlerauge | 3–4 Felder | −50 % (0–1) | 5 |
| **Jagdbogen** mit Adlerauge | 3–5 Felder | −50 % (0–1) | 6 |

> **Konsequenz:** Adlerauge auf der Armbrust ist mechanisch sinnlos — das System zeigt das von selbst, ohne ein explizites Verbot.

---

#### Einhand / Zweihand & Offhand-System

Waffen sind **Einhand (E)** oder **Zweihand (B)** — siehe `Hand (E/B)` in `data/weapons.json`.

| Waffentyp | Zweite Hand | Ausgleich |
|-----------|-------------|-----------|
| **Einhand (E)** | Offhand **oder** zweite Einhandwaffe (Dualwielding) | — |
| **Zweihand (B)** | belegt, kein Offhand | **+35 % auf die Grundwerte** + **Grundkapazität +1 (bis Stahl) / +2 (ab Titan)** |

- **Zweihand-Ausgleich:** Da Zweihänder kein Offhand führen können, erhalten sie **+35 %** auf ihre Grundwerte (Prim./Sek. Wert).
- **Zweihand-Kapazitätsbonus** *(entschieden 2026-07-04)*: zusätzlich **+1 Grundkapazität bis Stufe 3 (Stahl), +2 ab Stufe 4 (Titan)** — mehr Kapazität, **nicht** mehr Slots. Ziel-Balance: Einhand allein < Zweihand < Einhand+Offhand (E+O bleibt bewusst „ein kleines bisschen" vorn — das Offhand bringt Kapazität = Stufe, eigene Slots und die Eigenart). Anders als der %-Bonus **direkt in die B-Einträge** von `data/weapons.json` eingerechnet (dokumentiert in `meta.zweihand_kapazitaet_bonus`; `slot_templates` bleiben die Einhand-Basis). Seit der Stellar-Kalibrierung *(2026-07-04)* in allen Stufen 1–7 eingerechnet.
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
| **Hilfsmittel** | Fackel | Schnell | GES | **Hetzjagd** — +0,2 Speed (zusätzlich zur Gewichtsklasse) |
| **Hilfsmittel** | Signalhorn | Wendig | WIL | **Sammeln** *(automatisch)* — alle 5 Züge zu Beginn des Träger-Zuges: Verbündete +10 % Initiative bis zum nächsten Zug |
| **Hilfsmittel** | Standarte | Träge | WIL | **Heerführer** — Verbündete in 3 Feldern +10 % Schaden & +10 % Schadensreduktion |
| **Hilfsmittel** | Rauchschwenker | Wendig | INT | **Spezereien** — vom Träger gewirkte Heilungen +20 % effektiver |
| **Hilfsmittel** | Köderkolben | Schnell | VIT | **Achtung!** — +20 % Threat-Gen.; Threat-Aura 2 Felder (Präsenz-Aggro, §5.2) |

> Vollständige Daten (12 Typen × 7 Stufen = 84 Einträge, mit Materialien, Preisen, Slots): **`data/offhands.json`**.

**Offhand-Werte** *(kalibriert 2026-07-03)*:

| Stufe | 1 (Kupfer) | 2 (Eisen) | 3 (Stahl) | 4 (Titan) | 5 (Adamant) | 6 (Kosmium) | 7 (Stellar) |
|-------|-----------|-----------|-----------|-----------|-------------|-------------|-------------|
| **Prim.-Wert** | 3 | 5 | 7 | 10 | 14 | 18 | 24 |
| **Grundkapazität** | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| **Max. Verfeinerung** | 1× | 2× | 3× | 3× | 3× | 3× | 3× |
| **Gravur-Slots** | 1 | 1 | 1 | 2 | 2 | 2 | 2 |

- **Begründung Prim.-Wert:** ≈ 50 % des Zweihand-Äquivalents (der +35 %-Bonus entspricht Ø 5/8/12/18/25/35 Attributspunkten über alle Waffenklassen). Die andere Hälfte des Offhand-Werts steckt in **Eigenart + Gravur-Slots** — Offhands sind Eigenart-Träger, keine Stat-Sticks. Der Tier ist identisch mit dem Sekundärslot-Tier von Kopf-/Fußausrüstung; Stufe 7 = Kurvenfortsetzung (×1,33).
- **Verfeinerung** analog Waffen (Kupfer 1× / Eisen 2× / Stahl+ 3×). Offhand-Slots sind *Flex* → Gravuren kosten dort immer die vollen Level-Kapazitätskosten (§5.7).

---

#### Rüstungsausrüstung — Kopf / Körper / Füße *(kalibriert 2026-07-04)*

Daten: `data/kopf-/koerper-/fussausruestung.json` (je v1.3, 49 Einträge: 5 Rüstungs-Archetypen × 7 Stufen + 2 Zubehör-Typen × 7 Stufen).

**Leitprinzip — Attributsbudget 2/5 : 3/5** *(Nutzer-Entscheidung 2026-07-04)*:
Attribute kommen zu **2/5 aus der Rüstung** (Körper+Kopf+Füße zusammen) und zu **3/5 aus dem universellen Skilltree** (Annahme: ~70 Punkte pro fokussiertem Attribut über Attributsnodes erreichbar → Rüstungsanteil ≈ 47). Verhindert, dass Gear-Stacking + Attributsnodes zusammen explodieren.

**Prim.-Attributswerte** (jedes Teil trägt genau 1 Hauptattribut):

| Stufe | 1 (Kupfer) | 2 (Eisen) | 3 (Stahl) | 4 (Titan) | 5 (Adamant) | 6 (Kosmium) | 7 (Stellar) |
|-------|-----------|-----------|-----------|-----------|-------------|-------------|-------------|
| **Körper** | 3 | 5 | 7 | 10 | 13 | 17 | 23 |
| **Kopf / Füße** (je) | 2 | 3 | 4 | 5 | 7 | 9 | 12 |

→ Voll-Set auf ein Attribut fokussiert: **35 auf Stufe 6, 47 auf Stufe 7** (= das 2/5-Budget). Gilt auch für die Zubehör-Typen (Köcher, Buchrolle, Zielvisier, Diadem, Steigeisen, Windsohle).

**Defensiv-Basiswerte** (pro Teil; Endwert = Basis × Archetyp-Multiplikator aus den JSONs, kaufmännisch gerundet):

| Basis pro Stufe | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| **Körper** Rüstung = Resistenz | 2 | 3 | 4 | 5 | 6 | 8 | 10 |
| **Kopf/Füße** Rüstung = Resistenz | 1 | 2 | 2 | 3 | 4 | 5 | 6 |
| **Körper** VIT/LP | 6 | 10 | 14 | 20 | 27 | 35 | 47 |
| **Kopf/Füße** VIT/LP | 4 | 6 | 8 | 12 | 16 | 21 | 28 |

- **Flat-Anker:** Voll-Platte-Set fängt mit dem flachen Abzug ≈ **25 % eines gleichstufigen Einzeltreffers** (deckungsgleich mit dem §5.2-Beispiel „Rüstung 12 bei Treffern von 45–60": Voll-Platte Stufe 3 = 13). Kette ≈ 15 %, Robe physisch ≈ 0 (Squishy-Doktrin) — dafür ist Robe gegen Magie, was Platte gegen physisch ist (Multiplikatoren Robe 0,2 Rüstung / 1,6 Resistenz … Platte 1,7 / 0,7). Voll-Platte Stufe 6 = 32 Flat — bewusst unter der Obergrenze von ~50 (Nutzer-Vorgabe: ein Stufe-6-Set darf einen ~110er-Rohtreffer nicht annähernd halbieren).
- **WID-Defensivzeile gestrichen** *(2026-07-04)*: Rüstung trägt **keinen separaten WID-Wert** mehr — das wäre Double-Dipping, weil die Platte-Archetypen WID bereits als Prim-Attribut tragen. WID kommt nur über Prim-Wert (Platte) + Skilltree; passt zur §5.2-Doktrin „WID = allgemeine Zähigkeit, Flat = Panzerung".
- **Slots & Kapazität (final, 2026-07-04):** Grundkapazität = Stufe (1–7), Gravur-Slots 1 bis Stahl / 2 ab Titan, Max. Verfeinerung 1× Kupfer / 2× Eisen / 3× ab Stahl — identisch zu Waffen/Offhands.

**Bewusste Budget-Ausnahmen** *(dokumentiert, Prüfung in Phase 1)*:
- **WID-Offhands** (Turmschild, Fester Gürtel: Prim bis 24) liegen außerhalb des 2/5-Budgets — wer sie wählt, verzichtet dafür auf Dualwield/Fokus-Offhands. Bewusster Trade-off.
- **Waffen-WID** — ✅ **budget-konform** *(2026-07-04 Stellar-Kalibrierung, 2026-07-07 Kriegsgeräte-Neuordnung)*: Jagdbogen & Langbogen von Sek-WID auf STR umgestellt. WID-tragende Waffen sind jetzt Hammer & Rammbock (**Prim**) sowie Zepter (**Sek**) — alle nutzen den Körper-Rüstungs-Tier 3/5/7/10/13/17/23 statt einer eigenen, unkontrollierten Reihe (→ „Waffensystem — Stellar-Stufe" & „Kriegsgeräte-Neuordnung").

---

### 5.4 Skill- & Fähigkeitssystem

- **Ein einziger, universeller Skilltree** mit klassenabhängigem Einstiegspunkt — kein separater Baum pro Klasse (siehe §5.3, „Modulare Ausrüstungs-/Skilltree-Philosophie")
- Synergien zwischen Klassen sind zentral für taktische Tiefe
- Erste Synergien werden im Prolog-Tutorial eingeführt
- Klassen-Arks (→ §9.5) schalten besondere Aufträge per klassenspezifischer Herausforderung frei

**Skilltree-Struktur (Grundlage, 2026-07-07):**

- **Form:** Radialer Baum mit **6 Sektoren**, einer pro Attribut (STR, GES, WIL, INT, VIT, WID), angeordnet wie ein Rad. Jede Klasse hat einen festen **Einstiegspunkt** im Sektor ihres Identitätsattributs (Krieger→STR/WID-Grenze, Schütze→GES, Magier→WIL, Mystiker→INT, Assassine→GES/STR-Grenze). Von dort führen Pfade **radial nach außen** (Spezialisierung im eigenen Attribut) und **tangential zu Nachbarsektoren** (Hybridisierung) — bildet „Jede Klasse kann alles" ab, ohne dass der Baum strukturlos wird: die Entfernung zum Einstiegspunkt ist die natürliche Bremse gegen unbalancierte Chaos-Builds.
- **Node-Typen:**
  - **Attributsnodes** (klein, günstig): +1 bis +3 auf ein Attribut; Dichte so kalibriert, dass ein reiner Pfad in den eigenen Sektor **bis zum Endgame** die **~70 Punkte** erreicht, die das Rüstungsbudget 2/5:3/5 voraussetzt (§5.3). Die genaue Levelmarke ist Balancing-Sache (Attributsnode-Dichte/-Kosten-Tabelle, s. u.); **Leitplanke: fokussierte Werte wachsen bewusst langsam** — insbesondere **WID** soll die 100er-Marke (= 50 % Reduktion, `WID/(WID+100)`, §5.2) erst spät überschreiten, damit Rüstung/Zähigkeit nicht zu früh überproportional wird.
  - **Notable-Nodes** (mittel, an Sektorgrenzen/Knotenpunkten): konkrete Boni (Mana-Pool, MOB, Krit-Chance-Quelle, Ausweichen-Quelle)
  - **Keystone-Nodes** (selten, an Pfad-Enden): build-definierend, entsprechen den Spezialisierungspfaden aus §5.3 (z. B. Magier-Chaos-Build „Fähigkeiten kosten HP statt Mana", Mystiker-DoT-Build)
- **Punkte-Ökonomie:** 1 Punkt/Level = 50 Punkte total, aber nicht linear ausgebbar — Wegkosten (Attributsnodes zum Durchqueren) skalieren mit der Entfernung vom Sektor-Zentrum und erzeugen dadurch von selbst die in §5.3 festgelegte Kurve (linear bis ~25, strafft sich ab 35). Level 46–50 = 5 Bonuspunkte, ausschließlich für die letzten Keystones — natürlicher Ort für die in §5.3 vorgesehene Klassen-Prüfung/den Herausforderungsmodus als Freischaltbedingung.
- **Frühgame-Führung:** Die ersten ~10 Punkte ab dem Einstiegspunkt liegen auf einem einzigen, optisch hervorgehobenen Pfad (kein Fork) — reine Führung für neue Spieler, jederzeit verlassbar, keine Sperre (§5.3, „lineare, empfohlene Pfade").
- **Attributsvoraussetzungen für starke Kombos** (löst die in §5.3 offene Evaluationsfrage): keine harten Zahlenschranken, sondern **weiche Gates über Keystone-Kosten** — ein Hybrid-Keystone (z. B. Fernkampf-GES + magischer Schaden) kostet mehr Punkte UND sitzt an einer Stelle, die nur über Wegkosten durch beide Sektoren erreichbar ist. Reguliert starke Kombos über Investitionsaufwand statt einer separaten Sonderregel.
- **Respec:** frei bis Level 15 (Experimentierphase, deckt sich mit dem linearen Frühgame), danach kostenpflichtig über eine Bergheim-Einrichtung (Ressourcenkosten, skalierend mit investierten Punkten).
- **Offen:** konkrete Notable-/Keystone-Listen pro Klasse, exakte Attributsnode-Dichte/-Kosten-Tabelle, Godot-Umsetzung im Yggdrasil-Editor (→ §11)

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
| WID | Widerstandskraft | Prozentuale Schadensreduktion (physisch, magisch + elementar) — Formel in §5.2; flache Reduktion läuft typ-getrennt über Rüstung/Resistenz/Elementardiffusion |
| STR | Stärke | Physischer Schaden (Abkürzung STR statt STÄ) |
| GES | Geschicklichkeit | Bewegung, Ausweichen, Schütze-Skalierung |
| *(weitere folgen)* | | |

### 5.7 Gravurensystem

*(übernommen aus dem nie gemergten Branch `claude/waffenkiste-engraving-discussion-h9m12r` (GDD-v0.7-Ära); Verfeinerungs-Tabelle an den aktuellen Datenstand `data/weapons.json` v7 angepasst — bei Abweichungen gilt die Daten-Version)*

Gravuren sind Waffenmodifikatoren, die in freie Slots einer Waffe eingesetzt werden. Das System orientiert sich an PoE-Ability-Gems, mit eigenem Energie- und Mana-Management. Die maschinenlesbaren Grunddaten (Typen, Leveling, Seltenheit, Slot-Templates) liegen in `data/weapons.json`.

#### Gravurtypen

| Typ | Funktion | Mana-Mechanik |
|-----|----------|---------------|
| **Aktiv** | Gibt eine aktive Fähigkeit | Verbrauch bei Nutzung der Fähigkeit |
| **Passiv** | Gibt eine passive Fähigkeit | Reserviert Mana dauerhaft — blockiert für Aktive & weitere Passive |
| **Reaktiv** | Gibt eine reaktive Fähigkeit mit Cooldown und Auslösungs-Deckelung pro Zug | — |
| **Modifikativ** | Modifiziert alle anderen Gravuren auf der Waffe (Aktiv, Passiv, Reaktiv, teils auch Signatur); wirkt ohne spezifische Verbindung automatisch auf alle | Erhöht Mana-Kosten/-Reservierung und ggf. Cooldown der modifizierten Gravuren |
| **Spezial/Signatur** | Einzigartige Effekte außerhalb des normalen Rahmens | Sehr variabel |

**Mana-Reservierung (Passiv-Logik):**
Passive Gravuren reservieren Mana fix (Reservierung erfolgt beim Platzieren in der Homezone, siehe §5.2). Reserviertes Mana ist weder für Aktive noch für weitere Passive verfügbar. Sobald der verfügbare Mana-Pool erschöpft ist, können keine weiteren aktiven oder passiven Gravuren eingesetzt werden.
*Beispiel: Zwei Passive mit je 50 Mana Reservierung → 100 Mana reserviert → keine weiteren Aktiven oder Passiven möglich.*

**Reaktive Gravuren — Balance:**
Reaktive Fähigkeiten wie Gegenschlag oder Parry brauchen sowohl einen Cooldown als auch eine Deckelung (max. Auslösungen pro Zug), um Tank- und Assassinen-Builds nicht zu dominieren. Standard-Deckelung: **3 pro Zug** — finale Werte folgen im Balancing (Phase 1).

**Spezial/Signatur — Beispiele:**
- Transformiert eine bestehende Fähigkeit grundlegend (z. B. Power Strike → andere Fähigkeit)
- Wandelt eine passive Fähigkeit in eine Charaktereigenschaft um
- Beinhaltet eine eigene aktive Fähigkeit

#### Slots & Energie

Jede Waffe besitzt eine **Energiekapazität** und eine Anzahl **Slots**. Slots sind entweder generisch (*Flex*) oder typisiert (Aktiv, Passiv, Reaktiv, Modifikativ, Spezial). Anzahl Slots und Kapazität hängen von der **Seltenheit** der Waffe ab (Slot-Templates in `data/weapons.json`).

**Kostenmodell** *(entschieden 2026-07-03)*: Die Kapazitätskosten einer Gravur hängen **ausschließlich von ihrem Level** ab (Tabelle unter „Gravur-Leveling": L1 = 2 … L5 = 10) — der Gravur-Typ hat keine eigenen Basiskosten. **Typisierter Slot = halbe Kapazitätskosten** für eine passende Gravur; im nicht passenden oder generischen (*Flex*-)Slot gelten die vollen Kosten.
*Konsequenz-Beispiel: Waffe mit Kapazität 1 und einem Aktiv-Slot → nur eine Aktiv-Gravur L1 passt (2 → 1); jede andere Gravur (voller Preis 2) passt nicht.*

| Belegung | Slot-Typ | Gravur | Kosten |
|----------|----------|--------|--------|
| Passend | Aktiv | Aktiv-Gravur Level 2 (Kosten 4) | **2** |
| Nicht passend | Passiv | Reaktiv-Gravur Level 1 (Kosten 2) | **2** |
| Passend | Passiv | Passiv-Gravur Level 1 (Kosten 2) | **1** |

*Beispiel-Schwert (Stahl: Kapazität 3 · 1× Aktiv-Slot · 1× Passiv-Slot):*
- Option A: Aktiv-Gravur L2 (4→2) + Passiv-Gravur L1 (2→1) = **3** ✓
- Option B: Aktiv-Gravur L1 (2→1) + Reaktiv-Gravur L1 im Passiv-Slot (2, kein Rabatt) = **3** ✓

#### Verfeinern (Kapazitäts-Erweiterung)

Jede Verfeinerung erhöht die Kapazität um **+1**. *(Werte = Daten-Version aus `data/weapons.json`)*

| Waffenmaterial | Max. Verfeinerungen |
|----------------|---------------------|
| Kupfer | 1× |
| Eisen | 2× |
| Stahl (und höher) | 3× |
| Stellar | 3× *(entschieden 2026-07-05)* |

#### Gravur-Seltenheit

| Stufe | Einordnung |
|-------|-----------|
| Stahl | Basis |
| Titan | Mittel |
| Kosmium | Selten |

#### Gravur-Leveling

Alle Gravuren können von Level 1 auf maximal Level 3 aufgewertet werden. Spezial/Signatur-Gravuren sind die Ausnahme — sie erreichen Level 5.

| Level | Kapazitätskosten | Verfügbar für |
|-------|-----------------|---------------|
| 1 | 2 | Alle |
| 2 | 4 | Alle |
| 3 | 6 | Alle |
| 4 | 8 | Spezial/Signatur |
| 5 | 10 | Spezial/Signatur |

Höheres Level = stärkerer Effekt der Gravur. Die Kapazitätskosten sind zugleich die Einsetzkosten der Gravur in einen Slot (siehe „Slots & Energie" — passender typisierter Slot halbiert sie).

#### Entfernen & Wiederverwenden

Gravuren können jederzeit aus einer Waffe entfernt und in eine andere eingesetzt werden. Das Entfernen ist mit **hohen Kosten** verbunden, aber nicht permanent.

> **Umbenennung** *(2026-07-05)*: Das Stufe-6-Material heißt **Kosmium** (vorher „Diamant") — entschieden im Zuge des Crafting-Systems, weil Material-Ressourcen als **Barren** vorliegen und „Diamantbarren" nicht funktioniert. Kosmium schlägt zudem die thematische Brücke zur Stellar-Stufe. Umbenennung in allen Daten-JSONs + Excel durchgezogen.

#### Crafting

Das Crafting-System (Resonanz-Matrix) ist in **§5.8** vollständig definiert. Grundsatz bleibt: Zutaten lenken Wahrscheinlichkeiten, ohne den RNG-Faktor zu eliminieren — Loot behält seine Rolle, garantiertes 100%-Crafting aller Gravuren ist nicht vorgesehen. *(Konkreter Gravuren-Katalog → folgt)*

---

### 5.8 Crafting — Die Resonanz-Matrix

*(entschieden 2026-07-05 — Systemdesign komplett; alle konkreten Zahlenwerte stehen unter Balancing-Vorbehalt für Phase 1)*

**Leitprinzip: Man kauft eine Verteilung, kein Item.** Crafting ist niemals deterministisch (einzige Ausnahme: Verbessern, s. u.) — Zutaten verschieben Wahrscheinlichkeiten, das Ergebnis wird immer gewürfelt. Crafting fängt schlechten Loot ab, ersetzt den Loot-Faktor aber nicht: Alle Crafting-Ressourcen stammen aus zerlegtem Loot, die Highlights (Stellar, Spezial-/Signatur-Gravuren) sind nie craftbar.

#### Zerlegen (Ressourcen-Gewinnung)

Jedes unerwünschte Item kann zerlegt werden und liefert:

| Ressource | Achse | Herkunft |
|-----------|-------|----------|
| **Barren** | Materialstufe (Kupfer- bis Kosmiumbarren; **kein Stellarbarren**) | Materialstufe des zerlegten Items |
| **Aspektsplitter** | Waffentyp / Gravurtyp (z. B. Breitschwert-Aspekt, Aktiv-Aspekt) | Was das zerlegte Item war |
| **Essenzen** | Element (z. B. Feuer-Essenz) | Zerlegte Element-Gravuren + seltene Direktdrops |

**Umwandlung** *(schließt den Doppel-RNG-Kanal)*: **3 beliebige → 1 gewählte** Ressource derselben Sorte und Stufe (3 Splitter → 1 gewählter Splitter, 3 Essenzen → 1 gewählte Essenz). Damit konvergiert auch „falscher" Loot in endlicher Zeit zur gewünschten Lenkung — nur langsamer, was den Loot-Motor intakt lässt. *Notwendig auch wegen Regionsbindung der Loot-Pools: Die Ork-Region droppt keinen Magie-Loot (§9.6) — ohne Umwandlung wären magische Lenkzutaten im Endlos-Modus nicht erspielbar.*

**Aufstufung**: **7× Barren Stufe N → 1× Barren Stufe N+1** *(Zahl Balancing-Vorbehalt)* — verhindert, dass Kupferbarren ab Midgame toter Ballast sind. **Ausnahmen: endet bei Adamant.** Kosmiumbarren entstehen ausschließlich aus zerlegten Kosmium-Items (Kosmium-Ressourcen bleiben ein reiner Loot-Beweis); zu Stellar stuft nichts auf.

#### Das Grid (3×3-Setzkasten an der Schmiede in Bergheim)

- **Mitte = Basis**: ein Bauteil oder eine Prägung (s. Tabelle unten) — bestimmt die Output-Kategorie (Waffentyp bzw. Gravur).
- **8 Randfelder = Lenkzutaten**: Barren, Aspektsplitter, Essenzen. Jede Zutat verschiebt die Wahrscheinlichkeiten auf ihrer Achse (Stufe / Typ / Element).
- **Start: Ecken gesperrt** (Plus-Form, 4 nutzbare Randfelder — gegenüberliegende Paare funktionieren ab Minute 1). Der **Schmiede-Ausbau** (Hub-Progression, §9) schaltet die Ecken frei; der volle Ring ist das Endausbau-Feature.

**Muster & Resonanz:**

| Muster | Effekt |
|--------|--------|
| Einzelne Zutat | Leichte Gewichtung ihrer Achse (z. B. +15 %) |
| Zwei gleiche Zutaten gegenüberliegend | **Resonanz** — Gewichtung verdoppelt |
| Voller Ring (8 Felder, nur bei Vollausbau) | Chance auf **+1 Seltenheitsstufe** des Ergebnisses |

*Beispiel: 2× Feuer-Essenz (gegenüber) + 2× Breitschwert-Aspekt (gegenüber) + 2× Stahlbarren (gegenüber) → mit hoher Wahrscheinlichkeit ein Feuer-Elementar-Ergebnis in Breitschwert-Ausprägung auf Stahl-Stufe.*

**Lenkungs-Deckelung**: Lenkung ist hart gedeckelt (**max. ~75 % Richtung einer Kategorie** `[Balancing]`); innerhalb der Kategorie wird das konkrete Ergebnis immer gewürfelt. Kein Muster ergibt jemals ein garantiertes Ziel-Item.

**⚠️ PFLICHT — Live-Vorschau der Verteilung**: Das Grid zeigt **vor** dem Auslösen die vollständige aktuelle Wahrscheinlichkeitsverteilung (Kategorien-Prozente, aufklappbar bis zur Einzelgravur/Einzelwaffe). Jede gelegte oder entfernte Zutat aktualisiert die Anzeige sofort. Keine versteckten Quoten — nirgends. *(Harte UI-Anforderung analog zu den Plattform-UI-Regeln in §10.5.)*

#### Was craftbar ist — und was nicht

| Craftbar | Nicht craftbar (Loot-exklusiv) |
|----------|-------------------------------|
| **Komplette Waffen** — ohne Gravuren, Stufe durch eingesetzte Barren gedeckelt | Alles **Stellar** (Waffen, Barren, Ressourcen) |
| **Komplette Rüstung & Offhands** — ohne Gravuren, Stufe durch eingesetzte Barren gedeckelt (Zielslot bei Rüstung über das Basis-Bauteil Geschirr/Haube/Riemen, Archetyp über den Aspektsplitter) | **Spezial-/Signatur-Gravuren** |
| **Gravuren** — nur Level 1; höhere Level nur über Aufwertung | |
| **Verfeinerungskerne** (für die Kapazitäts-+1-Verfeinerung, §5.7) | |
| **Bauteile & Prägungen** (Grid-Basen, s. Tabelle) | |
| **Kosmium-Gravuren** — nur mit Kosmiumbarren (die nur aus zerlegten Kosmium-Items stammen → limitiert sich selbst) | |

*(2026-07-06 entschieden: Ausnahmslos alle Ausrüstungskategorien sind von Grund auf craftbar — symmetrisch zu Waffen. Einzige craftfreie Zone bleibt Stellar + Spezial-/Signatur-Gravuren.)*

#### Bauteile & Prägungen (Grid-Basen)

Pro Ausrüstungskategorie ein craftbares Kernbauteil; Benennung nach der Item-Namensregel (§5.3): „Stahl-Griff", „Kosmium-Prägung", „titanbeschlagener Stave" (`material_form`/`genus` pro Bauteil in den Daten zu hinterlegen).

| Kategorie | Bauteil |
|-----------|---------|
| Schwerter | **Griff** |
| Stichwaffen | **Stichklinge** |
| Äxte | **Axtblatt** |
| Kriegsgeräte | **Schlagkopf** |
| Stabwaffen | **Schaft** |
| Bogenwaffen | **Stave** |
| Zauberwaffen | **Fokuskern** |
| Rüstung — Körper | **Geschirr** |
| Rüstung — Kopf | **Haube** |
| Rüstung — Füße | **Riemen** |
| Offhands (alle 12 Typen) | **Beschlag** |
| Gravur-Rohling | **Prägung** |

#### Pity-System (Anti-Frust ohne Determinismus)

- **Duplikat-Zerfall als Motor**: Eine erwürfelte Gravur, die auf gleichem Level bereits besessen wird, zerfällt automatisch in Aspektsplitter **und** zählt den Duplikat-Zähler ihrer Kategorie hoch. Nach **X Duplikaten** `[Balancing]` liefert der nächste Craft dieser Kategorie garantiert eine noch nicht besessene Gravur (sofern eine existiert).
- **Untergewichtung**: Bereits besessene Gravuren rollen mit reduziertem Gewicht (z. B. ×0,5 `[Balancing]`).
- **Resonanzladung**: Jeder Craft, der die gelenkte Kategorie verfehlt, lädt einen Zähler auf — **geführt pro Kategorie × Seltenheitsstufe** (Billig-Crafts können nichts aufladen, was man bei einem Kosmium-Craft einlöst). Bei voller Ladung trifft der nächste Craft die Kategorie garantiert; das konkrete Item bleibt zufällig.

#### Verbessern (Stufen-Upgrade)

**Der einzige deterministische Vorgang im System** — es erschafft nichts Neues, es hebt Vorhandenes:

- Hebt ein Item um **+1 Materialstufe** (Werte auf die Reihe der neuen Stufe).
- **Maximal 1× pro Item.**
- **Kosmium-Items sind nicht verbesserbar** (danach käme nur das nicht craftbare Stellar).
- Kosten: **Barren der Zielstufe + passendes Bauteil** (Beispiel: Breitschwert Eisen→Stahl braucht Stahlbarren + Stahl-Griff; Turmschild Titan→Adamant braucht Adamantbarren + Adamant-Beschlag).
- Gilt für **Waffen, Rüstungen und Offhands** — alle mit ihrem jeweiligen Bauteil (s. Tabelle oben).

#### Drop & Herkunft *(entschieden 2026-07-06)*

Die drei Ressourcen-Ebenen unterscheiden sich bewusst im RNG-Grad — Farmen fühlt sich anders an als Glück haben:

| Ressource | RNG-Grad | Herkunft |
|-----------|----------|----------|
| **Barren** | Niedrig — überwiegend farmbar | Droppt von **jedem Gegner** (stufenabhängige Chance) **und** garantiert aus Zerlegen (jedes Item liefert mind. 1 Barren seiner Stufe) |
| **Aspektsplitter** | Mittel | Bestimmte Einheiten droppen sie zusätzlich; aus Zerlegen kommt **immer garantiert** einer. *(Offen: teilweise auch im Shop erwerbbar? → Phase 1, sobald das Shop-System ansteht.)* |
| **Essenzen** | Hoch — bewusst selten | Geringe Drop-Chance von Elite-/Boss-Gegnern; der verlässliche Grundstrom kommt über die 3:1-Umwandlung aus zerlegten Element-Gravuren. Essenzen lenken sehr spezifisch (Element/Set) — in Region 1 (Orks) unwichtig, da die Ork-Strategie auf rohem Schaden/Resistenz statt Elementen/Sets basiert (deckt sich mit „kein Magie-Loot", §9.6) |

**Drop-Skalierung**: nach **Gegner-Stufe** (höhere Stufe → höherstufige Barren/Splitter wahrscheinlicher) **und Archetyp** (z. B. Bogenschützen-Gegner droppen bevorzugt Materialien/Splitter, die Bogenschützen-Ausrüstung begünstigen).

**Kein zusätzliches Pity auf Drop-Ebene**: Die garantierte Loot-Truhe am Levelende (§9.4 — „zumindest etwas Loot" bei jeder Wiederholung) deckt das bereits ab; ein separater Drop-Pity-Mechanismus ist nicht nötig.

#### Offener Punkt: Element- & Materialliste `[Phase-0-Abschluss]`

*(2026-07-06)* Herkunfts-Prinzipien stehen (s. o.), aber die **konkrete Elementliste** (fest, z. B. Feuer/Eis/Blitz/Gift/…) und eine **vollständige Materialliste** „mit allem drum und dran" (alle Barren/Aspektsplitter/Essenzen inkl. Drop-Zuordnung nach Stufe & Archetyp) fehlen noch. Beides ist Grundlage für **Lex Tactica** (§8.5) — siehe §11.

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

### 8.5 Lex Tactica — Kompendium

*(neu 2026-07-06; Struktur & erster Grundstock 2026-07-09)* **Lex Tactica** ist das große Buch des Protagonisten — narrativ sein persönliches Nachschlagewerk, funktional das **interne Wiki/Kompendium des Spiels**. Es wächst mit dem Spielfortschritt und bündelt perspektivisch alles Wissenswerte: Material- & Elementliste (Barren/Aspektsplitter/Essenzen, §5.8), Item-/Gravuren-Katalog, Bestiarium, Kampfregeln, Lore.

#### Aufbau — Rubriken (Kapitel)

| Rubrik | Inhalt | Stand |
|---|---|---|
| **1. Materialien** | Barren-Stufen, Aspektsplitter, Essenzen (§5.8) | Grundstock befüllt (s. u.) |
| **2. Bauteile & Prägungen** | die 12 Crafting-Rohlinge (§5.8) | befüllt (s. u.) |
| **3. Ausrüstung** | Waffen, Rüstung, Offhands — Katalog aus den Daten-JSONs | Platzhalter (Daten stehen, Einzug folgt) |
| **4. Gravuren** | Gravuren-Katalog nach Typ (§5.7) | Platzhalter (Katalog offen, §11) |
| **5. Bestiarium** | Gegnertypen mit Schaden / Resistenzen / Schwächen | Platzhalter (Gegner-Design offen) |
| **6. Kampf-Kodex** | Schadenstypen ↔ Resistenzen, Statuseffekte, Kernregeln | spiegelt §5.2 (s. u.) |
| **7. Welt & Lore** | Regionen, Fraktionen, Story-Kodex | Platzhalter (aus §2–§4) |

#### Eintrags-Template & Freischaltung

- **Knappe Wiki-Card:** Jeder Eintrag folgt demselben schlanken Schema — **Name · Kategorie (Stufe/Typ) · Herkunft** (wo bekomme ich es) **· Verwendung** (wofür) **· ein Satz Flavor**. Bewusst kompakt, damit hunderte Item-/Material-Einträge pflegbar bleiben; längere Lore lebt in Rubrik 7, nicht in jeder Card.
- **Freischaltung „Entdeckung":** Ein Eintrag füllt sich **automatisch bei der ersten Begegnung** (erstes Looten/Craften eines Materials, erstes Töten eines Gegnertyps, erstes Betreten einer Region). Vorher ist der Slot als **„? — unentdeckt"** sichtbar (man sieht, *dass* es etwas gibt = Sammel-/Fortschrittsanreiz), Werte bleiben verborgen. Deckt sich mit „wächst mit dem Spielfortschritt", braucht kein eigenes Kauf-/Forschungssystem.
- **Bestiarium-Sonderfall (progressiv):** Erst-*Sichtung* schaltet Name/Bild frei; die **Schwächen/Resistenzen** eines Gegnertyps werden erst nach einigen Kämpfen (oder per Scout-Fähigkeit) sichtbar — belohnt Wiederbegegnung und macht Aufklärung taktisch wertvoll.

#### Rubrik 1 — Materialien *(Grundstock)*

**Barren (Materialstufen)** — die Fortschritts-Achse der Ausrüstung; jede Stufe hebt Werte-Tier & Slot-Kapazität. Beschaffung: **von jedem Gegner farmbar** (Stufe skaliert mit Gegner-Stufe) **+ garantiert aus dem Zerlegen** gleichstufiger Items; Aufstufung im Crafting **7:1**, endet bei Adamant (§5.8).

| Stufe | Barren | Beschaffung | Flavor |
|---|---|---|---|
| 1 | **Kupfer** | frühe Regionen, jeder Standard-Gegner | *(folgt)* |
| 2 | **Eisen** | breit farmbar | *(folgt)* |
| 3 | **Stahl** | mittlere Regionen | *(folgt)* |
| 4 | **Titan** | spätere Regionen / stärkere Gegner | *(folgt)* |
| 5 | **Adamant** | höchste farm- & aufstufbare Stufe | *(folgt)* |
| 6 | **Kosmium** | **nur aus zerlegten Kosmium-Items** (nicht aufstufbar) | *(folgt)* |
| ✦ | **Stellar** | **nicht craftbar** — ausschließlich Loot/Drop (§5.3) | *(folgt)* |

**Aspektsplitter** — bestimmen im Crafting den **Typ / die Identität** des Outputs auf der Typ-Achse (Grid-Randfeld, §5.8). **Namensregel: Item-Identität + „Aspektsplitter"** (z. B. „Falchion-Aspektsplitter", „Plattenaspekt-Splitter"). Beschaffung: von bestimmten Einheiten + garantiert aus dem Zerlegen des passenden Item-Typs; Umwandlung 3:1 (§5.8).

- **Waffen (16 — je Waffentyp):** Breitschwert-, Falchion-, Dolchpaar-, Stilett-, Rapier-, Kampfaxt-, Pike-, Hammer-, Rammbock-, Zepter-, Jagdbogen-, Langbogen-, Kriegsarmbrust-, Repetierarmbrust-, Zauberstab-, Energiesphäre-Aspektsplitter.
- **Offhands (12 — je Offhand-Typ):** Buckler-, Turmschild-, Foliant-, Energiekristall-, Kampfkette-, Laterne-, Fester-Gürtel-, Fackel-, Signalhorn-, Standarte-, Rauchschwenker-, Köderkolben-Aspektsplitter.
- **Rüstung (5 — je Archetyp-Familie):** Stoffaspekt-, Lederaspekt-, Kettenaspekt-, Schuppenaspekt-, Plattenaspekt-Splitter. *(Der Ziel-**Slot** kommt beim Rüstungs-Craft vom Basis-Bauteil Geschirr/Haube/Riemen, der **Archetyp** vom Aspektsplitter — §5.8.)*
- **Gravuren (5 — je Gravurtyp, §5.7):** Aktiv-, Passiv-, Reaktiv-, Modifikativ-, Spezial-Aspektsplitter. *(Konkreter Gravuren-Katalog noch offen → Platzhalter, §11.)*

> **Zubehör** (Köcher, Buchrolle, Zielvisier, Diadem, Steigeisen, Windsohle): eigene Aspektsplitter erst, sobald die Craftbarkeit von Zubehör entschieden ist (§5.8 nennt bislang nur Waffen/Rüstung/Offhands) — offen (§11).

**Essenzen** — tragen das **Element** in Waffen/Gravuren (Grid-Element-Achse, §5.8). Vier Sorten, deckungsgleich mit den vier Elementen (§5.2). **In-World-/Lex-Name lateinisch** (Flavor); der schlichte „&lt;Element&gt;-Essenz"-Begriff bleibt als Synonym gültig:

| Essenz (Lex-Name) | Herkunft des Namens | Element / Schadensart | Beschaffung |
|---|---|---|---|
| **Ignis-Essenz** | lat. *ignis* = Feuer | Feuer / Hitzeschaden | selten, elite-/boss-gebunden |
| **Glacies-Essenz** | lat. *glacies* = Eis | Eis / Kälteschaden | selten, elite-/boss-gebunden |
| **Silva-Essenz** | lat. *silva* = Wald/Natur | Natur / Terraschaden | selten, elite-/boss-gebunden |
| **Fulmen-Essenz** | lat. *fulmen* = Blitz/Donnerkeil | Donner / Elektroschaden | selten, elite-/boss-gebunden |

> Region 1 (Orks) bleibt **bewusst ohne Elementfokus** — dort droppen keine Essenzen (deckt sich mit §9.6 „kein Magie-Loot"). Essenzen kommen erst mit späteren, elementaffinen Regionen/Gegnern.

#### Rubrik 2 — Bauteile & Prägungen *(befüllt)*

Die 12 Crafting-Rohlinge (§5.8). Beschaffung: aus dem Zerlegen bzw. craftbar; Verwendung: als **Grid-Mitte** bestimmen sie die Output-Kategorie. Benennung nach Item-Namensregel („Stahl-Griff", „Kosmium-Prägung").

| Rohling | Output-Kategorie |
|---|---|
| **Griff** | Schwerter |
| **Stichklinge** | Stichwaffen |
| **Axtblatt** | Äxte |
| **Schlagkopf** | Kriegsgeräte |
| **Schaft** | Stabwaffen |
| **Stave** | Bogenwaffen |
| **Fokuskern** | Zauberwaffen |
| **Geschirr** | Rüstung (Körper) |
| **Haube** | Rüstung (Kopf) |
| **Riemen** | Rüstung (Füße) |
| **Beschlag** | Offhands (alle 12 Typen) |
| **Prägung** | Gravur-Rohling |

#### Rubrik 6 — Kampf-Kodex *(spiegelt §5.2)*

Übernimmt die **Schadenstyp-↔-Resistenz-Matrix** und die Statuseffekt-Liste direkt aus §5.2 — **Single Source of Truth bleibt §5.2**, Lex spiegelt nur:

| Schadenstyp | Herkunft (Beispiel) | Zusatzeffekt | Flat-Resistenz | %-Reduktion |
|---|---|---|---|---|
| Physisch | Nahkampf (STR+STR), Bögen/Armbrüste | Krit ×1,5 | **Rüstung** | WID |
| Magisch | Chaos-Schule (WIL+WIL), Fluch/Schatten | — | **Resistenz** | WID |
| Feuer (Hitze) | Feuer-Essenz, Elementarzauber | jeder 3. Treffer → 1 Stapel Brennen | **Elementardiffusion** | WID |
| Eis (Kälte) | Eis-Essenz | jeder 3. → Initiative −1 Platz | **Elementardiffusion** | WID |
| Natur (Terra) | Natur-Essenz, Gift | jeder 3. → Verankerung 1 Zug | **Elementardiffusion** | WID |
| Donner (Elektro) | Donner-Essenz | jeder 3. → Sprung ~25 % (2 Felder) | **Elementardiffusion** | WID |

*Ergänzt in Lex: RD senkt den Flat-Wert aller drei Typen; Blutung = hälftig physisch/magisch. Statuseffekt-Elementzuordnung (Brennen→Feuer, Gift→Natur) s. §5.2.*

**Noch offen** *(→ §11)*: Rubriken 3–5 & 7 inhaltlich befüllen (hängen an Item-Einzug bzw. Gravuren-/Gegner-/Lore-Design); Flavor-Texte je Eintrag; UI-Darstellung des Buchs (Blätter-/Register-Metapher).

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

> **Gravuren** sind Waffen-Modifikatoren → §5.7

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
- **Tileset-Specs (v1, umgesetzt):**
  - Terrain-Tiles: 128×64 px (2:1-Iso-Raute), logische Auflösung 64×32 mit 2× Nearest-Upscale
  - Hohe Tiles (Berge, Klippen, Bäume, Gestrüpp): 128×192 px, Rautenbasis unten (`texture_origin (0, 64)`) → 2,5D-Höhenillusion
  - Godot-TileSet: `Isometric` / `Diamond Down` — quadratische Grid-Logik bleibt erhalten (Manhattan-Distanz)
  - Terrain-Umfang v1: Gras (+Blumen), Fluss & See (16 Verbindungen + 13 Ufer-Übergänge), Straße (16 Verbindungen), Brücke & Furt (je 2 Ausrichtungen), Berge (+Schneevariante), dichtes Gestrüpp, Klippen-Plateau, Sand, Acker, Bäume, Findling
  - Jedes Tile trägt Custom-Data fürs Taktik-Grid: `terrain` (String), `move_cost` (int), `walkable` (bool)
  - Quelle: prozeduraler Generator `tools/generate_tileset.py` (Platzhalter-Qualität, später durch handgemalte Assets ersetzbar — gleiche Maße/Slots). Details: `docs/TILESET.md`
- **Sprite-Größen (Charaktere):** *(folgt)*

### 10.2 Speichersystem

- **Format:** JSON, im Release-Build verschlüsselt via Godot 4 `FileAccess.open_encrypted_with_pass`
- **Im Dev-Build:** Unverschlüsselt (lesbar für Debugging)
- **Gespeicherter Inhalt:** Game State, Inventar, Charakter-Progression, Region-Fortschritt, Spielzeit, Zeitstempel
- **Speicherort:** Godot-Standard-User-Verzeichnis (`user://`)
- **Anzahl Slots:** 3

### 10.3 Engine & Projektstruktur

- **Engine:** Godot 4
- **Sprache:** GDScript
- **Zielplattform:** PC/Steam primär, Android als geplanter Post-Release-Port — Details in **§10.5**
- **Projektstruktur (angelegt):** `addons/` (Editor-Plugins, u. a. Yggdrasil-Skilltree-Editor), `assets/` (Grafiken, TileSets; `assets/placeholder/` für MVP-Assets), `data/` (Item-JSONs, Coding-Datenbank), `scenes/` (Szenen + zugehörige Scripts), `scripts/` (geteilte Scripts/Autoloads), `tools/` (Generator-/Hilfsskripte, Python), `docs/` (interne Doku)
- **Audio:** AudioStreamPlayer + Audio Bus (nativ in Godot)

**Plugins (Godot Asset Library — kostenlos):**

| Plugin | Zweck |
|--------|-------|
| Dialogue Manager (Nathan Hoad) | Story-Szenen, Dialoge, Prolog-Text |
| Phantom Camera 2D | Smooth Camera Follow, Zoom-Effekte, Cutscene-Kamera |

**Game Feel — Kernpatterns (alle nativ in Godot, kein Plugin nötig):**

| Effekt | Was es macht | Tool |
|--------|-------------|------|
| Hitstop | Kurzes Einfrieren (2–5 Frames) beim Treffer | `Engine.time_scale` per Tween |
| Screen Shake | Kamera wackelt nach Impact | Camera2D + Noise |
| Hit Flash | Gegner blitzt weiß auf | Shader (minimal) |
| Floating Numbers | Schadenszahlen steigen auf | AnimationPlayer + Label |
| Impact Particles | Funken/Staub/Magie beim Treffer | GPUParticles2D |
| Anticipation | Windup vor dem Angriff | AnimationPlayer Timing |
| Sound Punch | Treffergeräusch macht ~50% des Feels | AudioStreamPlayer |

### 10.4 Placeholder-Assets (MVP)

Alle Placeholder-Grafiken liegen unter `assets/placeholder/` bzw. `assets/tiles/`. Sie werden durch finale Grafiken ersetzt, sobald die Spiellogik steht.

**Charaktere & Gegner**

| Asset | Quelle | Pfad | Animationen |
|-------|--------|------|-------------|
| Soldat (Mensch-Placeholder) | Tiny RPG Character Asset Pack v1.03 (Free) | `assets/placeholder/characters/tiny-rpg-soldier-orc/` | Idle, Walk, Attack (3x), Hurt, Death |
| Ork (Gegner-Placeholder) | Tiny RPG Character Asset Pack v1.03 (Free) | `assets/placeholder/characters/tiny-rpg-soldier-orc/` | Idle, Walk, Attack (2x), Hurt, Death |
| Pfeil-Projektil | Tiny RPG Character Asset Pack v1.03 (Free) | `assets/placeholder/characters/tiny-rpg-soldier-orc/` | — |

> **Hinweis Richtung:** Sprites zeigen nur in eine Richtung. Für MVP: horizontales Spiegeln in Godot + Richtungsindikator (Pfeil/Dreieck) auf dem Tile. Richtung ist Spielmechanik (Backstab, Flanke) — visuell durch den Indikator gelöst bis finale Sprites vorliegen.

**Umgebung / Tilesets**

| Asset | Quelle | Pfad | Inhalt |
|-------|--------|------|--------|
| Taverne (Innenraum) | Vledic's Pixel RPG — Tavern (32x16 isometrisch) | `assets/placeholder/environments/tavern/` | 126 Items: Boden, Wände, Tische, Tresen, Fässer, Props |
| Außen-Terrain (Wald, Wasser, Wege) | Eigener prozeduraler Generator (`tools/generate_tileset.py`), 128×64 isometrisch | `assets/tiles/` | Terrain-Tileset v1, siehe §10.1 / `docs/TILESET.md` |

> **Skalierungs-Hinweis:** Taverne (32×16) und eigenes Terrain-Tileset (128×64, logisch 64×32) haben unterschiedliche Rastermaße — Kompatibilität beim Zusammenbauen in Godot prüfen (Taverne ggf. skalieren oder nur für Innenraum-Szenen nutzen).

**Placeholder-Sprite-Strategie (Charaktere, geplant):** Ein Grayscale-Sprite für alle Charaktertypen, Farb-Differenzierung über Godot `modulate` (Spieler Blau `Color(0.29, 0.56, 0.89)`, Gegner Rot `Color(0.89, 0.29, 0.29)`); Format 4 ISO-Richtungen (S/N/O/W) als 2×2-Sprite-Sheet. Tool der Wahl: Pixellab.ai (Prompt in CLAUDE.md hinterlegt).

### 10.5 Zielplattform & Plattform-Strategie *(entschieden 2026-07-04)*

**Primäre Zielplattform (Release):** **PC via Steam — Windows + Linux**, mit **Steam Deck** als explizitem Ziel (Steam-Deck-verified anstreben).

- **Referenzauflösung:** 1920×1080 (16:9); UI muss auf **1280×800 / 7 Zoll** (Steam Deck, 16:10) lesbar bleiben → Mindest-Schriftgrößen, Item-Karten nicht zu textlastig; **Integer-Scaling** für die Pixel Art
- **Input:** Maus/Tastatur first; **Controller als gleichwertiges Schema ab dem Godot-MVP** (Phase 1) — Grid-Cursor-Logik statt reiner Mauszeiger-Logik (bei Tile-Spiel ohnehin natürlich)
- **macOS:** technisch mit Godot machbar (Signing/Notarization = Zusatzaufwand) — **später evaluieren**, kein Release-Ziel

**Geplanter Post-Release-Port: Android.** Rundenbasiert + Grid passt gut zu Touch und das Genre hat dort eine große Zielgruppe — aber der Android-Markt ist zu ~95 % F2P, Premium-Titel verkaufen sich dort ohne bestehende PC-Reputation schlecht. Erfolgsmuster im Genre (Slay the Spire, XCOM & Co.): PC-first, Mobile-Port später mit Zugkraft des Namens. Kein Launch-Ziel, aber fest eingeplant.

**Verbindliche Design-Regeln fürs Phase-1-UI** (halten den Android-Port billig, kosten jetzt fast nichts):

1. **Input-Abstraktion dreistufig:** Maus / Controller / Touch als drei Consumer derselben Grid-Cursor-Logik (Controller wird für Steam Deck ohnehin gebaut; Touch ist danach der kleinste Schritt)
2. **Keine Information nur hinter Hover:** jeder Tooltip/jede Detailinfo auch per Klick/Taste aufrufbar (lässt sich später kaum nachrüsten)
3. **UI-Skalierungsfaktor von Anfang an** + flexibles Auflösungs-/Seitenverhältnis-Setup im Godot-Projekt (16:9 und 16:10 testen)

**Ausdrücklich kein Ziel:** Konsolen (mit Godot nur über Porting-Partner wie W4 Games — frühestens nach Release evaluieren); Web-Export nur ggf. für Demos (in Godot 4.3 die schwächste Export-Säule). Das Speichersystem (encrypted JSON via `FileAccess`, §10.2) ist bereits plattformportabel. ✓

---

## 11. Offene Punkte & ToDos

### Phasenplan & Phase-0-Abschlusskriterien

- **Phase 0 — Vorüberlegung & Design (aktuell):** GDD und Daten-JSONs sind so weit vollständig, dass die Spiellogik gebaut werden kann.
- **Phase 1 — Playtest & Integration:** beginnt mit dem ersten Code-Projekt (Skilltree / Godot-MVP). Feintuning von Balancing-Werten gehört hierhin, weil es Playtests braucht.

**Phase 0 gilt als abgeschlossen, wenn:** *(Zuordnungs-Vorschlag — vom Nutzer zu bestätigen)*

- [x] Offhand Prim.-Werte & Slot-Kapazitäten kalibriert + Stufe-7-Offhands ausgearbeitet *(2026-07-03)*
- [x] Rüstungswerte Kopf/Körper/Füße kalibriert *(2026-07-04)*: Slot-Kapazitäten & Verfeinerung final (Grundkapazität = Stufe, Slots 1/2, Verfeinerung 1×/2×/3×); Prim-Tiers Körper 3/5/7/10/13/17/23 + Kopf/Füße 2/3/4/5/7/9/12 (2/5-Rüstung-zu-3/5-Skilltree-Budget); Flat-Basis Körper 2/3/4/5/6/8/10 + Kopf/Füße 1/2/2/3/4/5/6; WID-Defensivzeile gestrichen; Stufe 7 befüllt (§5.3)
- [x] Stufe-7-Waffen (Stellar) Werte/Slots ausgearbeitet *(2026-07-04, §5.3 „Stellar-Stufe")*: Prim 84/100/70, Kapazität +2 über Kosmium (L4/L5-Signatur-Unlock), Verfeinerung 3×, Stellar-Eigenarten ✦, Lichtresonanz-Flag; Sek-WID eingedampft (Hammer → Körper-Tier, Jagd-/Langbogen → Sek STR); Zweihand-Kapazitätsbonus auf S7-B-Waffen angewandt; Zepter → B
- [x] `itemliste_v7.xlsx` erstellt (Offhands, Rüstung, Bogen-Notation) *(2026-07-03)*
- [ ] Waffensystem-Rest designt — **Crafting-System komplett** *(2026-07-05/06, §5.8 Resonanz-Matrix: Zerlegen/Barren/Aspektsplitter/Essenzen, 3×3-Grid mit Resonanz-Mustern, Pity via Duplikat-Zerfall, Verbessern, Bauteile/Prägungen inkl. Geschirr/Haube/Riemen/Beschlag, alle Ausrüstungskategorien craftbar, Kosmium-Umbenennung, Stellar-Verfeinerung 3×)*; **offen nur noch: Gravuren-Katalog + Materialherkunft/Essenzen (s. u.)**
- [x] Skilltree-Struktur designt *(2026-07-07, §5.4)*: radialer Baum mit 6 Attribut-Sektoren, klassenabhängige Einstiegspunkte, Attributs-/Notable-/Keystone-Nodes, Punkte-Ökonomie (1/Level, Wegkosten erzeugen die §5.3-Kurve), Frühgame-Führungspfad, weiche Kombo-Gates über Keystone-Kosten, Respec (frei bis Level 15, danach kostenpflichtig). Offen bleiben Notable-/Keystone-Listen pro Klasse + die *Umsetzung* in Godot — das ist dann der Startschuss für Phase 1 (Editor-Plugin Yggdrasil liegt bereits unter `addons/`)
- [x] Technische Specs vervollständigt *(2026-07-04)*: **Zielplattform entschieden (§10.5)** — PC/Steam (Windows + Linux, Steam Deck) primär, Android als geplanter Post-Release-Port inkl. verbindlicher UI-Design-Regeln; Projektstruktur ist angelegt (§10.3)

**Bewusst nach Phase 1 verschoben** (braucht Playtests oder blockiert den Code-Start nicht): Aggro/Threat- & Sicht-Feintuning, Reaktiv-Gravur-Deckelung, Menschen-Fraktionsbonus-Werte, Klassen-Arks, Ork-Klassen/KI/Fraktionsbonus, weitere Regionen, Hub-Logik & -Progression, Rekrutierungs-Taverne, Charakter-Erstellung, Arathos-Backstory, Tileset-/Sprite-Specs, Credits, Audio-Konzept.

**Ideen für Phase 1 vorgemerkt** *(2026-07-06)*:
- **Ressourcen-Minispiel/Gamemodus (Idee)**: Kupfer-/Eisen-/Stahl-„Golems" als Gegnertyp in einer eigenen Minenregion, die gezielt zum Ressourcenfarmen aufgesucht wird; alternativ/ergänzend ein Warframe-artiges **Expeditions-System** — einen Trupp für eine festgelegte Zeit in Region X aussenden, danach Ressourcen-Ertrag abholen. Noch unentschieden, ob eigener Gamemodus oder Hub-Feature.
- **Aspektsplitter im Shop kaufbar?** — Frage, ob Aspektsplitter (teilweise) käuflich erwerbbar sein sollen; wird im Rahmen des noch zu designenden Shop-Systems mitbesprochen.
- **Elementar-Reaktionssystem — geparkt (2026-07-09, → §5.2)**: Genshin-artiges Kombinationssystem zweier Elemente wurde diskutiert, aber bewusst nicht in die Planung übernommen (Idee A/Zusatzeffekte reicht wahrscheinlich aus; UI-/Tracking-Aufwand, Namenskollision mit „Reaktionen", fehlende Element-Itemisierung). Nur bei Bedarf später erneut aufgreifen.

---

**Erledigt (Referenz):**

- [x] **Kriegsgeräte-Neuordnung entschieden** *(2026-07-07, §5.3)*: Hammer & Rammbock → Prim **WID** / Sek **STR** (physische Zäh-Bruiser); Zepter → Prim **WIL** (unverändert) / Sek **WID** (statt INT) — bleibt voller Magie-Schadensträger + wird zäher („Battlemage"). WID-Reihe überall 3/5/7/10/13/17/23 (Rüstungs-Prim-Tier, 2/5-Budget-konform). Löst zugleich die Metadaten-Inkonsistenz in `stat_skalierung.Kriegsgeräte` (Klassen-Default deckte Zepters echtes Prim/Sek nicht ab)
- [x] **Rohschaden-Formel Magisch final entschieden** *(2026-07-08, §5.2, löst die am 2026-07-07 vertagte Diskussion ab)*: Eine Formel (WIL+WIL) gilt für Nah- **und** Fernkampf-Magie, kein Falloff, Zauberwaffen-Reichweite bleibt bei 3 — wer aus der Backline zaubern will, muss näher ran. Ausgleich Fernkampf-/Frontline-Magier läuft über den Skilltree-Pfad, nicht über eine eigene Formel; Feintuning bei Bedarf über die Reichweiten-Zahl (Playtests Phase 1)
- [x] **Elementar-Durchdringung entschieden** *(2026-07-08, §5.2)*: kein eigener Stat — RD ist bereits generisch und wirkt auf Rüstung/Resistenz/**Elementardiffusion** gleichermaßen. Dedizierter Elementar-Piercing-Waffentyp bewusst vertagt, bis Element-/Themen-Set-Ausrüstung existiert
- [x] **Elementare Zusatzeffekte designt** *(2026-07-09, §5.2)*: Rollen-Rahmen (Schaden-Achse Feuer/Donner, Kontroll-Achse Eis/Natur), deterministischer Trigger „jeder 3. Elementartreffer" (kein Prozent-Proc, DoT-Ticks zählen bewusst nicht mit), vier finale Effekte — Feuer appliziert 1 Stapel Brennen (bewusster Regelbruch gegen „kein Statuseffekt", da bestehende Mechanik wiederverwendet statt neu erfunden), Donner springt fix 2 Felder um das Ziel (unabhängig von Waffenreichweite), Eis verzögert Initiative um 1 Platz, Natur verankert fürs nächste Ziel-Zug. Zusatzeffekt an Schadenstyp gekoppelt, nicht an Sets. Elementar-Reaktionssystem (Idee B) bewusst geparkt
- [x] **Statuseffekt-Harmonisierung entschieden** *(2026-07-07, §5.2)*: Brennen + „In Brand gesteckt" → **Hitzeschaden** (Feuer); Vergiftet/Gift + Giftnebel → **Terraschaden** (Natur); Blutung bleibt hälftig physisch/magisch (an physische Waffen gebunden, kein Element). Zudem geklärt: „Zauberschaden"-Boni (Foliant/Energiekristall) wirken auf den **Rohschaden vor dem Elementar-Split** — treffen also automatisch beide Anteile eines gemischten Zaubertreffers
- [x] Crafting-System designt *(2026-07-05, §5.8 „Resonanz-Matrix")*: nicht-deterministisch, Grid-basiert, Live-Verteilungs-Vorschau als PFLICHT; Zerlegen → Barren/Aspektsplitter/Essenzen, Umwandlung 3:1, Aufstufung 7:1 (endet bei Adamant), Pity über Duplikat-Zerfall + Resonanzladung (pro Kategorie × Stufe), Verbessern (deterministisch, 1×, Kosmium ausgenommen), Bauteile Griff/Stichklinge/Axtblatt/Schlagkopf/Schaft/Stave/Fokuskern/Geschirr/Prägung; craftbar: Waffen (ohne Gravuren) + Gravuren (L1); nie: Stellar & Spezial-Gravuren
- [x] Stufe-6-Material umbenannt: **Diamant → Kosmium** *(2026-07-05)* — alle 5 Daten-JSONs + Excel + GDD; Stellar-Verfeinerung = 3× (Platzhalter §5.7 aufgelöst)
- [x] Crafting-Detailfragen entschieden *(2026-07-06, §5.8)*: **alle Ausrüstungskategorien craftbar** (Waffen, Rüstung, Offhands — symmetrisch, Zielslot bei Rüstung via Slot-Aspektsplitter); Bauteil-Tabelle verfeinert — **Geschirr** (Körper), **Haube** (Kopf), **Riemen** (Füße), **Beschlag** (Offhands, alle 12 Typen). Offen bleibt nur noch Materialherkunft/Essenzen (s. u.)
- [x] Drop & Herkunft entschieden *(2026-07-06, §5.8)*: Barren farmbar (jeder Gegner) + garantiert aus Zerlegen; Aspektsplitter zusätzlich von bestimmten Einheiten + garantiert aus Zerlegen (Shop-Kauf offen, → Phase 1); Essenzen selten/elite-gebunden, Region 1 (Orks) bewusst ohne Elementfokus (deckt sich mit §9.6); Skalierung nach Gegner-Stufe **und** Archetyp; kein zusätzliches Drop-Pity nötig (Level-Ende-Truhe reicht, §9.4)
- [x] **Lex Tactica** als neues Konzept eingeführt *(2026-07-06, §8.5)*: das große Buch des Protagonisten, funktional das interne Spiel-Wiki (Material-/Elementliste, Item-/Gravuren-Katalog, Bestiarium, Lore); Struktur/Freischalt-Logik/UI noch zu designen (§11)
- [x] Einhand/Zweihand-Systematik + Offhand-System definiert; `data/offhands.json` befüllt (12 Typen × 7 Stufen, §5.3)
- [x] Zweihand-Ausgleich (+35 %) festgelegt: globaler Aufschlag beim Anzeigen/Ausrüsten (`meta.zweihand_grundwert_bonus`), Grundwerte bleiben echt; Infokarte zeigt Endwert + Bonus-Zeile
- [x] Rüstungs-Items Kopf/Körper/Füße designt und befüllt (`data/kopf-/koerper-/fussausruestung.json`, je 49 Einträge); Eigenarten abgesegnet *(2026-07-03, Werte weiterhin Platzhalter)*
- [x] Waffentypen Gewichtsklassen-Zuweisung — alle 16 Typen zugewiesen (`data/weapons.json`)
- [x] Kriegsarmbrust vs. Repetierarmbrust — bewusst identisches Distanzprofil 1–2/3, Differenzierung über Hand/Gewicht/Eigenart *(2026-07-03, §5.3)*
- [x] Trefferchance & Krit-Grundregeln definiert *(2026-07-03, §5.2)*: 100 % Basis, Falloff = Trefferchance, Ausweichen nur aus Quellen; Krit 5 % Basis / ×1,5 Rohschaden
- [x] WID-Cap entschieden: **kein Cap**, Formel begrenzt sich selbst *(2026-07-03, §5.2)*
- [x] Reaktionen definiert (§5.2: Gegenschlag, Parieren/Block, Zauberblock, Konter); Kälte-Malus auf Reaktionen: **−10 % pro Stapel** *(2026-07-03)*
- [x] Eigenarten-Grundregel: niemals aktiv, immer passiv/reaktiv/automatisch *(2026-07-03, §5.3)* — Spruchrolle & Sammeln auf Auto-Trigger umgestellt, Windsohle-Eigenart ersetzt (*Aufwind*)
- [x] `itemliste_v6.xlsx` → **v7** aktualisiert: Waffen-Sheet aus `weapons.json` v7 (Bogen-Notation `optimal/max`), neue Sheets Offhands (84), Kopf-/Körper-/Fußausrüstung (je 49, inkl. Köcher/Buchrolle im Körper-Slot), Referenz-Sheet Offhand- & Rüstungstypen *(2026-07-03)*
- [x] Techstack dokumentiert (§10.3): GDScript, Audio nativ, Plugins (Dialogue Manager, Phantom Camera 2D), Game-Feel-Kernpatterns — übernommen aus dem nie gemergten Branch `claude/game-content-roadmap-jotfhn` *(2026-07-03)*
- [x] Gravur-Kostenmodell entschieden *(2026-07-03, §5.7)*: Kapazitätskosten **rein Level-basiert** (L1=2 … L5=10), passender typisierter Slot halbiert, Flex/unpassend = volle Kosten; Typ-Basiskosten gestrichen
- [x] Offhands kalibriert *(2026-07-03, §5.3)*: Prim.-Wert **3/5/7/10/14/18/24** (≈ 50 % des Zweihand-Äquivalents, = Sekundärslot-Tier), Grundkapazität = Stufe (1–7), Max. Verfeinerung **1×/2×/3×** (Stahl+ = 3×) — inkl. Stufe-7-Offhands; `data/offhands.json` v1.3 + Excel aktualisiert
- [x] Gestrandete Branch-Inhalte gerettet *(2026-07-03)*: Gravurensystem → §5.7 (Verfeinerungs-Tabelle an Datenstand angepasst), Placeholder-Assets (`assets/placeholder/`: Tiny-RPG Soldat/Ork, Taverne) + §10.4, Terrain-Tileset v1 (`assets/tiles/`, `docs/TILESET.md`) + Tileset-Specs in §10.1, Godot-Projektskelett (`project.godot`, `scenes/`, `scripts/`, `tools/`), Yggdrasil-Skilltree-Editor (`addons/yggdrasil/`), Placeholder-Sprite-Strategie (§10.4/CLAUDE.md)

**Offen — Balancing & Daten:**

- [x] Rüstungswerte Kopf/Körper/Füße kalibrieren *(2026-07-04, §5.3 — JSONs v1.3 + Excel aktualisiert)*
- [x] Stufe-7-Waffen (Stellar) Werte/Slots ausgearbeitet *(2026-07-04, §5.3 — weapons.json v8 + Excel)*: inkl. Sek-WID-Eindampfung (Hammer → Körper-Tier; Jagd-/Langbogen → Sek STR), Zweihand-Kapazitätsbonus für S7-B-Waffen, Zepter → B (alle Stufen), Stellar-Eigenarten ✦ + verstecktes Lichtresonanz-Flag
- [x] Zweihand-Grundkapazität entschieden & eingerechnet *(2026-07-04)*: +1 bis Stahl / +2 ab Titan, Slots unverändert — 36 B-Waffen Stufe 1–6 in `weapons.json` v7.1 (+ Excel); dabei Altlast bereinigt: `slot_templates`-Klasse „Dolche" → „Stichwaffen"
- [ ] Aggro/Threat- und Sicht-Detailwerte final tunen (§5.2) *(→ Phase 1, braucht Playtests)*

**Offen — Systeme:**

- [ ] Skilltree-Notable-/Keystone-Listen pro Klasse + Attributsnode-Dichte/-Kosten final ausarbeiten (Grundstruktur steht, §5.4) — erstes gemeinsames Code-Projekt (Yggdrasil-Plugin)
- [ ] Gravuren-Katalog ausarbeiten (konkrete Gravuren pro Typ) — Systemrahmen §5.7, Crafting §5.8 stehen
- [ ] **Elementliste + vollständige Materialliste ausarbeiten** *(§5.8/§8.5, Phase-0-Abschlusskriterium)*: Herkunfts-Prinzipien sind entschieden (Barren farmbar+garantiert, Aspektsplitter Drop+garantiert aus Zerlegen, Essenzen selten/elite-gebunden; Skalierung nach Gegner-Stufe & Archetyp; kein Drop-Pity nötig, Level-Ende-Truhe reicht). Die **vier Elemente stehen jetzt** *(2026-07-06, §5.2 „Elementarschaden": Feuer/Hitze, Eis/Kälte, Natur/Terra, Donner/Elektro)* — es fehlt noch die **vollständige Materialliste** „mit allem drum und dran" (Barren/Aspektsplitter/Essenzen) als Grundlage für **Lex Tactica** (§8.5)
- [ ] **Element-/Themen-Set-Ausrüstung designen** *(§5.2, 2026-07-07)* — die einzige Quelle für **Elementardiffusion**: Werteskala, Mischverhältnis mit Rüstung/Resistenz, Drop/Craft-Herkunft (heutige „Pures Material"-Rüstung bleibt Diffusion-frei)
- [ ] **Elementarschaden-Feinschliff** *(§5.2, 2026-07-06/07)*: konkrete Element-Anteile auf Waffen/Gravuren (Phase 1)
- [~] **Lex Tactica (§8.5)** — **Struktur + Grundstock steht** *(2026-07-09)*: 7 Rubriken, knappe-Wiki-Card-Template, Freischaltung „Entdeckung" (automatisch bei Erstbegegnung, Bestiarium progressiv). Befüllt: Materialien (Barren-Stufen, **vollständige Aspektsplitter-Liste** — 16 Waffen + 12 Offhands + 5 Rüstungs-Archetypen + 5 Gravurtypen, Zubehör offen; 4 Essenzen mit lat. Namen Ignis/Glacies/Silva/Fulmen), Bauteile & Prägungen (12 Rohlinge), Kampf-Kodex (spiegelt §5.2). **Offen:** Rubriken 3–5 & 7 inhaltlich befüllen (hängen an Item-Einzug bzw. Gravuren-/Gegner-/Lore-Design), Flavor-Texte je Eintrag, UI-Darstellung
- [ ] Umschmieden von Waffeneigenarten — bewusst aus Crafting v1 gestrichen *(2026-07-05)*, ggf. Phase-1+-Evaluation
- [ ] Klassen-Arks für alle Klassen definieren (Freischalt-Bedingungen & Rewards)
- [ ] Reaktiv-Gravur-Deckelung final festlegen (aktuell „max. 3 Auslösungen/Zug (TBD)", `data/weapons.json`)

**Offen — Welt & Inhalt:**

- [ ] Ork-Klassen & KI-Verhalten definieren
- [ ] Ork-Fraktionsbonus definieren
- [ ] Menschen-Fraktionsbonus „Gemeinschaft" — konkrete Regenerationswerte festlegen
- [ ] Weitere Regionen definieren
- [ ] Hub Tag/Nacht-Logik definieren
- [ ] Hub visuelle Progression (Siedlung wächst) konzipieren
- [ ] Rekrutierungs-Taverne ausarbeiten
- [ ] Charakter-Erstellungssystem (Erscheinungsbild) definieren
- [ ] Arathos-Backstory intern dokumentieren (spoilerbehaftet)

**Offen — Technik:**

- [x] Technische Specs vervollständigt *(2026-07-04)*: Zielplattform entschieden (§10.5 — PC/Steam + Steam Deck primär, Android-Port geplant); Sprache (GDScript), Audio & Projektstruktur waren bereits festgelegt (§10.3)
- [x] Tileset-Specs definiert & Terrain-Tileset v1 umgesetzt (siehe §10.1, `docs/TILESET.md`) *(gerettet 2026-07-03)*
- [ ] Sprite-Specs für Charaktere definieren (Auflösung, Größen, Palette) — Strategie in §10.4, Umsetzung via Pixellab.ai ausstehend
- [ ] Tileset ausbauen: Klippen-Rampen, Winter-Biom, animiertes Wasser, Bergheim-Gebäude
- [ ] Skalierungs-Kompatibilität Taverne (32×16) vs. eigenes Terrain-Tileset (128×64) in Godot prüfen
- [ ] Credits-Liste aufbauen (Assets, Tools, Plugins)

> **Tech-Evaluation (29.06.2026) — GodotGAS / Gameplay Ability System:** Geprüft, ob das GAS-Framework ([Asset Store](https://store.godotengine.org/asset/indiegamedad/godotgas/)) als Engine für das Gravursystem taugt. Fazit: konzeptionell passend (Gravuren = datengetriebene „Gameplay Effects", die Attribute modifizieren), aber GAS ist ein Fundament für die *gesamte* Stat-/Skill-/Buff-Schicht, kein Einzel-Plugin — und primär auf Echtzeit ausgelegt (Cast-Zeiten/Cooldowns in Sekunden statt Runden). **Entscheidung: vorerst kein Framework.** Erst Waffen- & Gravursystem im GDD designen, dann prüfen, ob schlanker Eigenbau reicht (vermutlich ja). Kostenlose MIT-Alternative zum Reinschnuppern ins Muster: `OctoD/godot-gameplay-systems`.
