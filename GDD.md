# AXIOM — Game Design Document

> *"In seinem eigenen Weltbild hat jeder Mensch Axiome, ob er es will oder nicht. Dieses Spiel lädt dazu ein, sie zu hinterfragen."*

**Version:** 0.15  
**Stand:** 2026-07-04  
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
    - 10.4 [Placeholder-Assets (MVP)](#104-placeholder-assets-mvp)
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

**WID-Cap — Entscheidung: kein Cap** *(2026-07-03)*: Die Formel begrenzt sich selbst — sie nähert sich 100 % nur asymptotisch (WID 100 = 50 %, WID 200 = 66,7 %), jeder weitere Punkt bringt prozentual weniger. Ein künstlicher Deckel ist damit überflüssig; das Balancing läuft über die **Verfügbarkeit** von WID (Items, Skilltree-Nodes, Buffs), nicht über eine Sonderregel.

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

- **Brennen** *(negativ, stapelbar bis 3)*: Beim Stapeln wird die Dauer auf 3 Züge zurückgesetzt; jede weitere Applikation setzt die Dauer erneut auf 3. Eine brennende Einheit erleidet **am Ende ihres Zuges physischen Schaden i. H. v. 6 % des max. Lebens pro Stapel**.
- **Kälte** *(negativ, stapelbar bis 10)*: Die Figur verliert pro Zug einen Stapel. Jeder Stapel hat eine **5 % Chance, die Figur einzufrieren (→ Gefroren)** und mindert den Wert/die Chance jeder **Reaktion** (Gegenschlag, Parieren/Block, Zauberblock, Konter — → Reaktionen, §5.2) um **fix 10 % pro Stapel** (bei vollen 10 Stapeln sind Reaktionen also komplett deaktiviert). **Bei vollen 10 Stapeln** löst der nächste Treffer (Fähigkeit o. Ä.) **sofort Gefroren** aus.
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

> **Sekundärattribut-Umstellung Bogenwaffen** *(Nutzer-Entscheidung 2026-07-04)*: Jagdbogen & Langbogen tragen als Sekundärattribut **STR statt WID** — damit sind **alle Bogenwaffen GES (prim) / STR (sek)**, passend zur Fernkampf-Rohschadensformel (GES×0,75 + STR×0,25). Die Werte-Reihe blieb unverändert. Waffen-Sek-WID existiert nur noch beim Hammer (eingedampft, s. u.).  
> **Zepter → Zweihand** *(2026-07-04)*: Das Zepter ist **beidhändig (B)** — die Dateneinträge in `data/weapons.json` (vorher fälschlich E) wurden angeglichen: +35 %-Anzeige-Bonus greift, Grundkapazität mit Zweihand-Bonus = 2/3/4/7/8/9/11.

---

#### Waffensystem — Stellar-Stufe (Stufe 7) *(kalibriert 2026-07-04)*

Stellar-Waffen sind die **Legendaries**: Endgame-Waffen mit verstärkter Typ-Eigenart, mehr Kapazität und Attributswerten als Diamant — und einem versteckten Story-Zweck. Optisch stechen sie deutlich hervor (Partikel-/Shader-Effekte in Godot, macht der Nutzer später selbst).

**Attributswerte Stufe 7** — Fortschreibung der bestehenden Reihen (~×1,35, analog Rüstung 17→23):

| Reihe (S1–S6) | S7 Stellar | betrifft |
|---|---|---|
| 10/15/22/32/45/62 | **84** | Prim: Breitschwert, Falchion, Hammer, Rammbock, Zepter, alle Bogenwaffen, Zauberstab, Energiesphäre |
| 12/18/26/38/54/74 | **100** | Prim: Kampfaxt |
| 8/12/18/26/38/52 | **70** | Prim: Pike, Dolchpaar, Rapier, Stilett; Sek: Stichwaffen & Zauberwaffen |
| 6/9/14/20/28/40 | **54** | Sek: Rammbock (VIT), Zepter (INT), Pike (STR) |
| 5/8/12/18/26/38 | **52** | Sek: Schwerter (GES) |
| 4/6/9/14/20/28 | **38** | Sek: Kampfaxt (VIT), alle Bogenwaffen (STR) |

**Sek-WID-Eindampfung** *(rückwirkend Stufe 1–7, löst die Budget-Ausnahme unten auf)*: Nach der Bogen-Umstellung trägt nur noch der **Hammer** Sek-WID. Seine WID-Reihe wurde von 6…40 auf den **Körper-Rüstungs-Prim-Tier 3/5/7/10/13/17/23** eingedampft — eine Waffe gibt damit maximal so viel WID wie ein Körper-Rüstungsteil (2/5-Budget-konform). In `data/weapons.json` als `sek_wid_werte` unter Kriegsgeräte hinterlegt.

**Slots & Kapazität**: 5 Slots wie Diamant (Aktiv/Passiv/Reaktiv/Mod./Spezial), aber **Grundkapazität +2 über Diamant** — das ist der eigentliche Stellar-Unlock: Erst damit werden **L4/L5-Signatur-Gravuren** (Kosten 8/10, im passenden Slot 4/5, §5.7) realistisch spielbar. Max. Verfeinerung 3×. Zweihänder erhalten regelkonform nochmal +2:

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

| Stufe | 1 (Kupfer) | 2 (Eisen) | 3 (Stahl) | 4 (Titan) | 5 (Adamant) | 6 (Diamant) | 7 (Stellar) |
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

| Stufe | 1 (Kupfer) | 2 (Eisen) | 3 (Stahl) | 4 (Titan) | 5 (Adamant) | 6 (Diamant) | 7 (Stellar) |
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
- **Waffen-Sekundär-WID** — ✅ **eingedampft** *(2026-07-04, Stellar-Kalibrierung)*: Jagdbogen & Langbogen von Sek-WID auf STR umgestellt; der Hammer als einzige verbleibende WID-Waffe nutzt jetzt den Körper-Rüstungs-Tier 3/5/7/10/13/17/23 statt 6…40 (→ „Waffensystem — Stellar-Stufe").

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
| Stellar | *(offen, Platzhalter)* |

#### Gravur-Seltenheit

| Stufe | Einordnung |
|-------|-----------|
| Stahl | Basis |
| Titan | Mittel |
| Diamant | Selten |

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

#### Crafting-Vorschau

Das Gravur-Crafting basiert auf generischen Rezepten, die durch spezifische Zutaten in eine Richtung gelenkt werden können — ohne den RNG-Faktor vollständig zu eliminieren. Loot soll seine Rolle behalten; garantiertes 100%-Crafting aller Gravuren ist nicht vorgesehen.

*(Detailliertes Crafting-System + konkreter Gravuren-Katalog → folgen)*

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
- **Zielplattform:** *(folgt — vermutlich PC/Desktop)*
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

---

## 11. Offene Punkte & ToDos

### Phasenplan & Phase-0-Abschlusskriterien

- **Phase 0 — Vorüberlegung & Design (aktuell):** GDD und Daten-JSONs sind so weit vollständig, dass die Spiellogik gebaut werden kann.
- **Phase 1 — Playtest & Integration:** beginnt mit dem ersten Code-Projekt (Skilltree / Godot-MVP). Feintuning von Balancing-Werten gehört hierhin, weil es Playtests braucht.

**Phase 0 gilt als abgeschlossen, wenn:** *(Zuordnungs-Vorschlag — vom Nutzer zu bestätigen)*

- [x] Offhand Prim.-Werte & Slot-Kapazitäten kalibriert + Stufe-7-Offhands ausgearbeitet *(2026-07-03)*
- [x] Rüstungswerte Kopf/Körper/Füße kalibriert *(2026-07-04)*: Slot-Kapazitäten & Verfeinerung final (Grundkapazität = Stufe, Slots 1/2, Verfeinerung 1×/2×/3×); Prim-Tiers Körper 3/5/7/10/13/17/23 + Kopf/Füße 2/3/4/5/7/9/12 (2/5-Rüstung-zu-3/5-Skilltree-Budget); Flat-Basis Körper 2/3/4/5/6/8/10 + Kopf/Füße 1/2/2/3/4/5/6; WID-Defensivzeile gestrichen; Stufe 7 befüllt (§5.3)
- [x] Stufe-7-Waffen (Stellar) Werte/Slots ausgearbeitet *(2026-07-04, §5.3 „Stellar-Stufe")*: Prim 84/100/70, Kapazität +2 über Diamant (L4/L5-Signatur-Unlock), Verfeinerung 3×, Stellar-Eigenarten ✦, Lichtresonanz-Flag; Sek-WID eingedampft (Hammer → Körper-Tier, Jagd-/Langbogen → Sek STR); Zweihand-Kapazitätsbonus auf S7-B-Waffen angewandt; Zepter → B
- [x] `itemliste_v7.xlsx` erstellt (Offhands, Rüstung, Bogen-Notation) *(2026-07-03)*
- [ ] Waffensystem-Rest designt (Gravuren-Katalog, Crafting-Details, Aufwertung) — Gravurensystem-Rahmen steht (§5.7), Verfeinerung definiert
- [ ] Skilltree-Struktur designt (universeller Baum, Einstiegspunkte, Punkte pro Level, Respec) — die *Umsetzung* in Godot ist dann der Startschuss für Phase 1 (Editor-Plugin Yggdrasil liegt bereits unter `addons/`)
- [ ] Technische Specs vervollständigt (Zielplattform) — Projektstruktur ist angelegt (§10.3)

**Bewusst nach Phase 1 verschoben** (braucht Playtests oder blockiert den Code-Start nicht): Aggro/Threat- & Sicht-Feintuning, Reaktiv-Gravur-Deckelung, Menschen-Fraktionsbonus-Werte, Klassen-Arks, Ork-Klassen/KI/Fraktionsbonus, weitere Regionen, Hub-Logik & -Progression, Rekrutierungs-Taverne, Charakter-Erstellung, Arathos-Backstory, Tileset-/Sprite-Specs, Credits, Audio-Konzept.

---

**Erledigt (Referenz):**

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

- [ ] Skilltree ausarbeiten (universeller Baum, Einstiegspunkte, Punkte pro Level, Respec) — erstes gemeinsames Code-Projekt (Yggdrasil-Plugin)
- [ ] Waffensystem-Rest ausarbeiten (Gravuren-Katalog, Crafting-Details, Aufwertung) — Systemrahmen in §5.7
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

- [ ] Technische Specs vervollständigen (Zielplattform) — Sprache (GDScript), Audio & Projektstruktur sind festgelegt (§10.3)
- [x] Tileset-Specs definiert & Terrain-Tileset v1 umgesetzt (siehe §10.1, `docs/TILESET.md`) *(gerettet 2026-07-03)*
- [ ] Sprite-Specs für Charaktere definieren (Auflösung, Größen, Palette) — Strategie in §10.4, Umsetzung via Pixellab.ai ausstehend
- [ ] Tileset ausbauen: Klippen-Rampen, Winter-Biom, animiertes Wasser, Bergheim-Gebäude
- [ ] Skalierungs-Kompatibilität Taverne (32×16) vs. eigenes Terrain-Tileset (128×64) in Godot prüfen
- [ ] Credits-Liste aufbauen (Assets, Tools, Plugins)

> **Tech-Evaluation (29.06.2026) — GodotGAS / Gameplay Ability System:** Geprüft, ob das GAS-Framework ([Asset Store](https://store.godotengine.org/asset/indiegamedad/godotgas/)) als Engine für das Gravursystem taugt. Fazit: konzeptionell passend (Gravuren = datengetriebene „Gameplay Effects", die Attribute modifizieren), aber GAS ist ein Fundament für die *gesamte* Stat-/Skill-/Buff-Schicht, kein Einzel-Plugin — und primär auf Echtzeit ausgelegt (Cast-Zeiten/Cooldowns in Sekunden statt Runden). **Entscheidung: vorerst kein Framework.** Erst Waffen- & Gravursystem im GDD designen, dann prüfen, ob schlanker Eigenbau reicht (vermutlich ja). Kostenlose MIT-Alternative zum Reinschnuppern ins Muster: `OctoD/godot-gameplay-systems`.
