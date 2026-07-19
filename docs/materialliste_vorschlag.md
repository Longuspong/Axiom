# Materialliste — Barren · Aspektsplitter · Essenzen (komplett)

> **Status:** **Freigegeben (Review 2026-07-19)** und übertragen: GDD §8.5 (Lex-Rubrik 1) + §5.8 nachgezogen, Daten in `data/materials.json` (Coding-DB). Diese Datei bleibt als Design-Referenz mit den Flavor-Texten erhalten.
> **Review-Ergebnisse eingearbeitet:** Zubehör craftbar (Option A, 44 Splitter) · Level-Bänder relativ zur Regions-Progression · Element-Teaser ab Region 1 · Essenz-Verwendung an das Elementpaket des Gravuren-Reworks gekoppelt.
> **Ziel:** Das Phase-0-Abschlusskriterium „vollständige Materialliste mit allem drum und dran" (§5.8/§11) schließen: alle Materialien mit **Wiki-Card-Feldern** (Name · Kategorie · Herkunft · Verwendung · 1 Satz Flavor) + **konkrete Drop-Zuordnung** nach Stufe & Archetyp.
> Alle Zahlen **Balancing-Vorbehalt** (Phase 1).

---

## 0. Leitprinzip Drop-Zuordnung: „Der Drop spiegelt den Träger"

Formalisiert die bestehende Regel aus §5.8 („Bogenschützen droppen bogenrelevante Materialien") zu **einem** Satz, der jede Einzelzuordnung überflüssig macht:

> **Ein Gegner droppt bevorzugt Aspektsplitter der Ausrüstung, die er sichtbar trägt** (Waffe, Rüstungs-Archetyp, Offhand). Barren droppt jeder Gegner (Stufe skaliert), Gravur-Aspektsplitter droppen von Gegnern, die sichtbar Gravur-Effekte einsetzen (i. d. R. Elite+), Essenzen nur von elementaffinen Elite-/Boss-Gegnern.

**Vorteile:** selbsterklärend fürs Farmen („ich will Pike-Splitter → ich jage Speerträger"), braucht keine Loot-Tabellen-Pflege pro Gegner, und macht Gegner-Design automatisch zu Loot-Design. Ausnahmen (z. B. Quest-Belohnungen) bleiben möglich, sind aber nie nötig.

---

## 1. Barren (7 Stufen)

**Verwendung (alle):** Stufen-Achse im Crafting-Grid (Randfeld), Kosten beim Verbessern, Aufstufung 7:1 bis Adamant (§5.8).

**Bänder relativ zur Regions-Progression** *(entschieden 2026-07-19)*: Die Drop-Bänder sind an die **Regionen** gebunden, nicht an absolute Gegner-Level — absolute Zahlen setzen implizit ein Level-Cap voraus, das noch nicht entschieden ist (offener Punkt „Level-Cap & Level-Kurve", §11), und würden bei jeder Progression-Änderung kippen. Die absoluten Level bleiben nur als **abgeleitete Richtwerte in Klammern** stehen; Zuschnitt `[Balancing]`, Überlappungen bewusst (weiche Übergänge statt harter Regionsgrenzen).

| Stufe | Barren | Band (relativ zur Region) `[Balancing]` | Beschaffung | Flavor (Lex-Card) |
|---|---|---|---|---|
| 1 | **Kupfer** | Region 1 *(Richtwert ~L1–10)* | jeder Gegner früher Regionen + Zerlegen | *Weich, geduldig und überall — jede Schmiedekunst beginnt mit einem Kupferbarren.* |
| 2 | **Eisen** | Region 1 (spät) – Region 2 *(~L8–18)* | breit farmbar + Zerlegen | *Das ehrliche Metall: schwer, verlässlich, das Rückgrat jeder Feldschmiede.* |
| 3 | **Stahl** | Region 2 – Region 3 *(~L15–27)* | mittlere Regionen + Zerlegen | *Im Feuer veredeltes Eisen — wo Stahl auftaucht, enden Scharmützel und beginnen Kriege.* |
| 4 | **Titan** | Region 3 – Region 4 *(~L24–36)* | spätere Regionen / stärkere Gegner + Zerlegen | *Federleicht und doch unnachgiebig; gute Schmiede sagen, es wolle geformt werden.* |
| 5 | **Adamant** | Region 4+ / Endgame-Farm *(~L33–46)* | höchste farmbare Stufe + Zerlegen; Ende der Aufstufungskette | *Das härteste Metall, das die Erde freiwillig hergibt — alles darüber muss man ihr abringen.* |
| 6 | **Kosmium** | — (kein Barren-Direktdrop) | **nur aus zerlegten Kosmium-Items** (Items: **Elite/Boss der letzten Regionen**, *Richtwert ~L42+*); nicht aufstufbar | *Keine Mine hat je eine Kosmium-Ader gesehen — man findet es nur in Dingen, die schon jemandem gehört haben.* |
| ✦ | **Stellar** | — (existiert nicht als Barren) | **nicht craftbar, kein Barren** — Stellar gibt es ausschließlich als fertige Items (Loot, §5.3) | *Geronnenes Sternenlicht: lässt sich nicht schmelzen, nicht gießen, nicht zähmen — nur finden.* |

**Drop-Mischung pro Gegner** `[Balancing]`: ~70 % Barren der eigenen Band-Stufe, ~20 % eine Stufe darunter, ~10 % eine Stufe darüber.

---

## 2. Aspektsplitter (44)

**Verwendung (alle):** Typ-Achse im Crafting-Grid (Randfeld) — bestimmen die **Identität** des Outputs. Umwandlung 3:1 (§5.8).
**Herkunft (alle, nach Leitprinzip §0):** garantiert aus dem Zerlegen des passenden Item-Typs + bevorzugter Drop von Gegnern, die den Typ führen. *(Shop-Kauf → offen, Phase 1.)*
**Namensregel:** Item-Identität + „Aspektsplitter" (Waffen/Offhands/Zubehör) bzw. „…aspekt-Splitter" (Rüstungs-Archetypen, Gravurtypen als „&lt;Typ&gt;-Aspektsplitter").

### 2.1 Waffen (16)

| Aspektsplitter | Flavor (Lex-Card) |
|---|---|
| **Breitschwert** | *Erinnert sich an gerade, ehrliche Hiebe.* |
| **Falchion** | *Eine gebogene Ahnung von Schwung und Schneide.* |
| **Dolchpaar** | *Zwei Gedanken, ein Ziel — flüstert nur im Doppel.* |
| **Stilett** | *Schmal, still, zielstrebig: der Traum vom perfekten Stich.* |
| **Rapier** | *Tänzelt selbst als Splitter noch auf Fingerspitzen.* |
| **Kampfaxt** | *Grollt leise, wenn man ihn zu sanft anfasst.* |
| **Pike** | *Hält alles auf Abstand — sogar die anderen Splitter im Beutel.* |
| **Hammer** | *Schwer wie ein Versprechen, das gehalten wird.* |
| **Rammbock** | *Kennt genau eine Richtung: hindurch.* |
| **Zepter** | *Herrschaftlich — verlangt Willen und Zähigkeit zugleich.* |
| **Jagdbogen** | *Riecht nach Wald, Wind und geduldigem Warten.* |
| **Langbogen** | *Spannt sich dem Horizont entgegen.* |
| **Kriegsarmbrust** | *Spannkraft genug für ganze Schlachtreihen.* |
| **Repetierarmbrust** | *Tickt ungeduldig, als zähle er Bolzen.* |
| **Zauberstab** | *Kribbelt in jeder Hand, die ihn hält.* |
| **Energiesphäre** | *Rund, ruhelos, voller eingefangenem Licht.* |

### 2.2 Offhands (12)

| Aspektsplitter | Flavor (Lex-Card) |
|---|---|
| **Buckler** | *Klein, keck, immer im Weg — genau richtig.* |
| **Turmschild** | *Ein Stück Mauer, das mitmarschieren will.* |
| **Foliant** | *Raschelt, obwohl er keine Seiten hat.* |
| **Energiekristall** | *Summt auf der Frequenz ungesagter Zauber.* |
| **Kampfkette** | *Klirrt kampflustig bei jedem Schritt.* |
| **Laterne** | *Bewahrt einen Rest Licht für dunkle Stunden.* |
| **Fester Gürtel** | *Hält zusammen, was auseinanderfallen will.* |
| **Fackel** | *Glimmt weiter, wo längst alles erloschen ist.* |
| **Signalhorn** | *Trägt ein fernes Echo von „Sammeln!" in sich.* |
| **Standarte** | *Weht innerlich noch immer im Feldwind.* |
| **Rauchschwenker** | *Riecht nach Nebel und guten Ausreden.* |
| **Köderkolben** | *Verspricht Ärger — nur nie dem eigenen Träger.* |

### 2.3 Rüstungs-Archetypen (5)

*Slot kommt beim Craft vom Basis-Bauteil (Geschirr/Haube/Riemen), der Archetyp vom Splitter (§5.8).*

| Aspektsplitter | Flavor (Lex-Card) |
|---|---|
| **Stoffaspekt** | *Leicht wie ein Gedanke an Zuhause.* |
| **Lederaspekt** | *Geschmeidig und zäh; erzählt gern vom Wetter.* |
| **Kettenaspekt** | *Tausend kleine Ringe, ein großes Vertrauen.* |
| **Schuppenaspekt** | *Legt sich übereinander wie gute Argumente.* |
| **Plattenaspekt** | *Ein Splitter, der sich für eine Festung hält.* |

### 2.4 Gravurtypen (5)

*Herkunft-Besonderheit: droppen bevorzugt von Gegnern, die sichtbar Gravur-Effekte einsetzen (i. d. R. Elite+); garantiert aus dem Zerlegen von Gravuren des Typs.*

| Aspektsplitter | Flavor (Lex-Card) |
|---|---|
| **Aktiv** | *Zuckt bei Berührung — will benutzt werden.* |
| **Passiv** | *Ruht in sich und wirkt trotzdem.* |
| **Reaktiv** | *Wartet. Und wartet. Und schlägt zu.* |
| **Modifikativ** | *Verändert alles um sich herum, nur nie sich selbst.* |
| **Spezial** | *Folgt Regeln, die er niemandem verrät.* |

### 2.5 Zubehör (6) *(entschieden 2026-07-19: Option A — Zubehör ist craftbar)*

Die frühere Entscheidungsvorlage ist mit **Option A** aufgelöst: **Zubehör ist craftbar**, die 6 Zubehör-Aspektsplitter gehören zur Gesamtliste (Splitter-Summe **44**). Begründung: null neue Systeme (Slot vom Basis-Bauteil Haube/Geschirr/Riemen, Identität vom Splitter — die Mechanik existiert), und die 2026-07-06-Entscheidung „ausnahmslos alle Ausrüstungskategorien craftbar" (§5.8) wird wirklich ausnahmslos. Ein **Zubehör-Aspektsplitter statt eines Archetyp-Splitters** im Grid lenkt auf Zubehör statt Rüstung.

**Seltenheits-Regel statt Craft-Ausschluss:** Damit Zubehör trotzdem etwas Besonderes bleibt, droppen Zubehör-Aspektsplitter **seltener** als Waffen-/Rüstungs-Splitter — Richtwert **halbe Drop-Rate** `[Balancing]`. (Das Zerlegen von Zubehör liefert seinen Splitter weiterhin garantiert.)

| Aspektsplitter | Slot | Flavor (Lex-Card) |
|---|---|---|
| **Zielvisier** | Kopf | *Blinzelt nie.* |
| **Diadem** | Kopf | *Denkt in klaren, kühlen Linien.* |
| **Köcher** | Körper | *Hat immer noch einen Pfeil übrig.* |
| **Buchrolle** | Körper | *Aufgerollt schweigt sie — entrollt widerspricht sie.* |
| **Steigeisen** | Füße | *Beißt sich in jeden Untergrund.* |
| **Windsohle** | Füße | *Trägt einen Rest Rückenwind in sich.* |

---

## 3. Essenzen (4)

**Verwendung (alle):** Element-Achse im Crafting-Grid (Randfeld) — lenken auf Element-Ergebnisse: konkret auf das **Elementpaket** des Gravuren-Reworks (`docs/gravuren_vorschlag_v2.md`: je Element **mind. 2 Element-Gravuren**, verteilt über die Attribut-Paletten, Schadenstyp-Achse = elementar), künftig zusätzlich Element-/Themen-Set-Ausrüstung (§5.2). Umwandlung 3:1.
> ⚠ **Abhängigkeit:** Das Elementpaket ist noch **nicht freigegeben** — `data/engravings.json` enthält Stand 2026-07-19 noch keine Element-Gravuren. In `data/materials.json` referenziert das Feld `verwendung.element_gravur_ids` jeder Essenz die Element-Gravur-IDs; der Konsistenz-Check (`tools/check_materials.py`) verlangt **mind. 2 existierende Element-Gravuren pro Essenz** und schlägt bis zur Übernahme des Elementpakets erwartungsgemäß fehl.

**Herkunft (alle):** geringe Drop-Chance nur von **elementaffinen Elite-/Boss-Gegnern**; verlässlicher Grundstrom über 3:1-Umwandlung aus zerlegten Element-Gravuren. **Faustregel:** Die Element-Affinität des Gegners bestimmt die Essenz-Sorte (Feuerschamane → Pyros) — „der Drop spiegelt den Träger" gilt auch hier.

**Element-Teaser ab Region 1** *(entschieden 2026-07-19, ersetzt „Region 1/Orks bewusst essenzfrei")*: Der Spieler soll das Element-/Essenz-System nicht erst ab Region 2 zum ersten Mal sehen — erste Eindrücke zählen. Deshalb:
- **Mindestens zwei Elementartypen** kommen als Teaser bereits in Region 1 vor. *Vorschlag (vom Nutzer zu bestätigen, thematisch naheliegend für die Waldregion):* **Natur/Gaios** (Wald-Schamanen) und **Feuer/Pyros** (Feuer-Ritualisten).
- Orks sind keine Hochmagier, aber sie **nutzen Buffs und einfache Schamanen-Magie** (deckt sich mit der Revision 2026-07-12 — „Orks droppen keine Magie" ist aufgehoben). Ein Ork-Schamanen-Archetyp gehört ins Ork-Klassendesign (§11).
- **Teaser-Essenz-Drop:** Elementaffine Ork-Eliten haben eine geringe Essenz-Chance; der **Regionsboss von Region 1 droppt garantiert 1 Essenz** seines Elements. Essenzen *häufen* sich weiterhin erst ab Region 2 mit dediziert elementaffinen Gegnern.

| Essenz | Element / Schadensart | Flavor (Lex-Card) |
|---|---|---|
| **Pyros-Essenz** | Feuer / Hitze | *Ein Tropfen gebändigter Mittagsglut — wärmt durch das Fläschchen hindurch.* |
| **Kryos-Essenz** | Eis / Kälte | *Still und klar; die Kälte darin hat es nicht eilig.* |
| **Gaios-Essenz** | Natur / Terra | *Riecht nach Regen auf frisch aufgeworfener Erde.* |
| **Fulguros-Essenz** | Donner / Elektro | *Zuckt ungeduldig, als suche sie den kürzesten Weg.* |

---

## 4. Drop-Matrix nach Gegner-Archetyp

Konkretisiert die §5.8-Skalierung „nach Stufe **und** Archetyp". Die Archetypen sind bewusst generisch (das Ork-/Gegner-Design ist noch offen, §11) — jede künftige Einheit wird nur einem Archetyp zugeordnet und erbt dessen Drop-Profil:

| Gegner-Archetyp | Barren | Aspektsplitter (bevorzugt) | Essenzen | Beispiel (künftig) |
|---|---|---|---|---|
| **Standard-Nahkämpfer** | ✓ (Band) | seine Waffe + sein Rüstungs-Archetyp | — | Ork-Plänkler |
| **Schütze** | ✓ | Bogen-/Armbrust-Typ + Leder-/Stoffaspekt, Köcher | — | Ork-Jäger |
| **Zauberkundiger** | ✓ | Zauberwaffen-Typ + Stoffaspekt, Buchrolle | nur wenn elementaffin | Ork-Schamane (Region-1-Teaser, §3) |
| **Bruiser / Tank** | ✓ (+höhere Menge) | Kriegsgeräte-Typ + Ketten-/Schuppen-/Plattenaspekt, Schild-Offhands | — | Ork-Brecher |
| **Elite / Anführer** | ✓ (+1 Band-Tendenz) | wie Basis-Archetyp **+ Gravurtyp-Splitter** | geringe Chance (elementaffin) | Ork-Kriegsherr |
| **Boss** | ✓ garantiert, oberes Band | wie Elite, erhöhte Menge | beste Chance; elementaffine Bosse garantiert 1 (inkl. Regionsboss Region 1, §3) | Regionsboss |

*(Zubehör-Splitter — Köcher, Buchrolle usw. — mit halber Drop-Rate, s. §2.5.)*

**Anforderung ans Gegner-Design** *(2026-07-19, → §11)*: Die Zeile „Elite/Anführer + Gravurtyp-Splitter" ist ein Commitment — **jeder Elite-/Boss-Gegner führt mind. 1 sichtbare Gravur-Fähigkeit** (mit Telegraphing/VFX erkennbar), die sein Drop-Profil begründet. Das macht Gegner-Design automatisch zu Loot-Design; der Bestiarium-Eintrag (Lex, §8.5) listet die sichtbare Gravur als Farm-Hinweis.

**Kosmium-Sonderweg:** Kosmium kommt nie als Barren/Splitter-Drop, sondern nur als **Item-Drop** von Elite/Boss der letzten Regionen *(Richtwert ~L42+)* — Kosmiumbarren entstehen ausschließlich beim Zerlegen (§5.8, unverändert).

---

## 5. Annex: Flavor für Bauteile & Prägungen (Lex-Rubrik 2)

Rubrik 2 ist strukturell befüllt, ihr fehlen nur die Flavor-Sätze — hier gleich mitgeliefert:

| Rohling | Flavor (Lex-Card) |
|---|---|
| **Griff** | *Wartet auf eine Klinge, die ihn verdient.* |
| **Stichklinge** | *Schon als Rohling unangenehm spitz.* |
| **Axtblatt** | *Wird beim Schleifen sichtbar besserer Laune.* |
| **Schlagkopf** | *Ein Argument, dem wenige widersprechen.* |
| **Schaft** | *Gerade, geduldig, verlässlich.* |
| **Stave** | *Biegt sich. Bricht nicht.* |
| **Fokuskern** | *Pulsiert leise im Takt fremder Magie.* |
| **Geschirr** | *Trägt sich fast von selbst.* |
| **Haube** | *Sitzt fester als jeder Vorsatz.* |
| **Riemen** | *Hält Schritt — wörtlich.* |
| **Beschlag** | *Passt sich an, ohne nachzugeben.* |
| **Prägung** | *Glatt und leer — und voller Möglichkeiten.* |

---

## 6. Umsetzung *(erledigt 2026-07-19)*

1. ✅ **Übertrag in GDD §8.5 Rubrik 1** (Flavor + Beschaffung, Zubehör-Splitter integriert) und **§5.8** (Drop-Matrix + Leitprinzip, offener Punkt „Element- & Materialliste" geschlossen).
2. ✅ **`data/materials.json` angelegt** (self-contained Coding-DB): `barren` (7) · `aspektsplitter` (44) · `essenzen` (4, mit `element_gravur_ids`-Referenzfeld) · `drop_matrix` · `regions_baender` — Wiki-Card-Schema (`name`, `kategorie`, `herkunft`, `verwendung`, `flavor`), damit Lex Tactica direkt daraus rendern kann. Konsistenz-Check: `tools/check_materials.py` (schlägt bis zur Freigabe des Elementpakets erwartungsgemäß fehl, s. §3).
3. ✅ **§11:** Phase-0-Kriterium „Elementliste + vollständige Materialliste" abgehakt; neue Punkte „Level-Cap & Level-Kurve entscheiden" sowie Ork-Design-Anforderungen (Schamanen-Archetyp, sichtbare Elite-Gravur) eingetragen.
