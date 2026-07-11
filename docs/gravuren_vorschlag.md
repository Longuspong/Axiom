# Gravuren-Vorschlag — alle 6 Attribut-Paletten

> **Status:** Arbeitsvorschlag zum Korrigieren/Ergänzen. Noch **nicht** in `data/engravings.json` oder Lex übernommen — das passiert erst nach deiner Freigabe.
> **Struktur pro Attribut (13):** 3 Aktiv · 3 Passiv · 3 Reaktiv · 3 Modifikativ · **1 Signatur** — bewusst kein Aktiv-/Passiv-Übergewicht, quer über die 8 Eigenschaften verteilt („für alles etwas").
> **Achsen je Gravur:** Klasse (Attribut = Farbe) · Typ (= Form) · Eigenschaft · Schadenstyp. Werte inline als **L1/L2/L3** (Signatur bis L5). Schaden-% = Anteil eines Normalangriffs (100 % = normal). Alle Zahlen **Balancing-Vorbehalt**.

**Formen (Typ):** Raute = Aktiv · Dreieck = Passiv · Schild-Trapez = Reaktiv · Pentagon = Modifikativ · Kreis = Spezial · Hexagon = Flex-Slot
**Farben (Klasse):** STR Rot `#C0392B` · GES Grün `#2E9E5B` · WIL Violett `#8E44AD` · INT Blau `#2E6FD6` · VIT Bernstein `#E8A13A` · WID Türkis `#1FA8A0`
**Eigenschaften (8):** Schaden · Anhaltend (DoT) · Verteidigung · Kontrolle · Mobilität · Ressource · Präsenz · Beschwörung
**Mana-Spalte:** Aktiv = Verbrauch L1/L2/L3 · Passiv = „Res. X" (Reservierung) · Reaktiv = „—" (nutzt Cooldown/Deckelung)

---

## STR — Stärke (Rot) · physisch, Wucht, Nahkampf-Bruiser

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Wuchtschlag** | Schaden | physisch | Nächster Schlag = Angriff mit 120/140/160 % Waffen-Schaden auf ein Einzelziel. | 20/24/28 |
| Aktiv | **Drehschlag** | Schaden | physisch | Wirbelangriff trifft alle angrenzenden Feinde mit 80/95/110 % Waffen-Schaden. | 26/31/36 |
| Aktiv | **Sturmangriff** | Mobilität | physisch | Stürmt 3/4/4 Felder ans Ziel, trifft mit 110/120/130 %, Rückstoß 1/1/2 Felder. | 22/26/30 · CD 2 |
| Passiv | **Eiserne Haltung** | Verteidigung | — | Bei Stillstand im Zug bis zum nächsten Zug +6/+10/+15 Rüstung. | Res. 30 |
| Passiv | **Einschüchternde Aura** | Präsenz | — | Gegner in 2 Feldern erzeugen 20/30/45 % mehr Bedrohung gegen die Einheit. | Res. 30 |
| Passiv | **Schlachtruf der Meute** | Beschwörung | — | Beschworene Einheiten der Einheit verursachen +15/25/40 % Schaden. | Res. 35 |
| Reaktiv | **Abwehrreflex** | Verteidigung | — | Bei Nahkampftreffer: 25/40/60 % Chance, den Schaden vollständig zu parieren (nicht bei Backstab). | — · CD 2, max 3/Zug |
| Reaktiv | **Erschütternde Vergeltung** | Kontrolle | — | Bei Nahkampftreffer wird der Angreifer verankert (nächster Zug keine Bewegung). | — · CD 3/2/1 |
| Reaktiv | **Blutzoll** | Ressource | — | Fällt Leben erstmals unter 30 %, einmalig 15/25/40 % Heilung. | — · 1×/Kampf |
| Modifikativ | **Verschleppte Wunde** | Anhaltend | — | Alle Blutungs-/DoT-Gravuren: +15/25/35 % Schaden, +1 Zug Dauer; +Mana-Kosten. | erhöht mod. Kosten |
| Modifikativ | **Brachialverstärkung** | Schaden | — | Alle STR-Gravuren +15/22/30 % Wirkung; +20/25/30 % deren Mana. | erhöht mod. Kosten |
| Modifikativ | **Wuchtübertragung** | Kontrolle | — | Alle Schadens-Aktivgravuren stoßen zusätzlich 1 Feld zurück und ziehen −5/10/15 Initiativepunkte ab; +Mana. | erhöht mod. Kosten |
| **Signatur** | **Berserkerherz** | Schaden | physisch | Je 5 % fehlendem Leben +1/1/1,5/1,5/2 % phys. Rohschaden (max +10/16/24/32/40 %); L5 + 10 % Lebensraub. | Res. variabel · L5 |

---

## GES — Geschicklichkeit (Grün) · Präzision, Fernkampf, Finesse, Ausweichen

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Präzisionsschuss** | Schaden | physisch | Nächster Fernkampfangriff 120/140/160 % Schaden, ignoriert den Distanz-Falloff. | 20/24/28 |
| Aktiv | **Pfeilhagel** | Schaden | physisch | Pfeilregen auf ein Zielfeld: alle Gegner in 1 Feld Umkreis mit 70/85/100 % Schaden. | 26/31/36 |
| Aktiv | **Fesselschuss** | Kontrolle | physisch | Nächster Fernkampfangriff verankert das Ziel (nächster Zug), trifft mit 90/100/110 %. | 22/26/30 · CD 3 |
| Passiv | **Ausweichschritt** | Verteidigung | — | +8/12/18 % Ausweichchance dauerhaft. | Res. 30 |
| Passiv | **Leichtfüßig** | Mobilität | — | +1/+1/+2 Bewegung (MOB); ignoriert schwieriges Gelände. | Res. 30 |
| Passiv | **Wachsamkeit** | Präsenz | — | Verbündete in 2 Feldern +5/8/12 % Ausweichchance. | Res. 30 |
| Reaktiv | **Reflexausweichen** | Verteidigung | — | Erster Angriff/Runde gegen die Einheit wird mit 40/60/80 % Chance ausgewichen. | — · 1×/Runde |
| Reaktiv | **Windschnitt** | Ressource | — | Bei erfolgreichem Ausweichen: +10/15/22 Mana zurück. | — |
| Reaktiv | **Ausweichkonter** | Schaden | physisch | Weicht die Einheit aus: 30/50/70 % Chance auf einen Normalangriff als Konter. | — |
| Modifikativ | **Nachbluten** | Anhaltend | — | Alle Blutungs-/DoT-Gravuren: Krits +1 Zug & +15/25/35 % DoT-Schaden; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Zielsicherheit** | Schaden | — | Alle Aktiv-Angriffsgravuren +8/12/18 % Kritchance; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Schwächende Schüsse** | Kontrolle | — | Alle Schadens-Aktivgravuren verringern zusätzlich die MOB des Ziels um 1/1/2 (nächster Zug); +Mana. | erhöht mod. Kosten |
| **Signatur** | **Klingentanz** | Schaden | physisch | Mit einer Stichwaffe (Dolch) fließen +20/22/25/27/30 % der GES in den Rohschaden (L1/L3/L5 = 20/25/30 %). | Res. variabel · L5 |

---

## WIL — Willenskraft (Violett) · magischer Schaden (Chaos-Schule), Fluch/Schatten, Mana

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Willensschlag** | Schaden | magisch | Magischer Nuke auf ein Einzelziel mit 120/140/160 % Schaden. | 22/26/30 |
| Aktiv | **Schattenwelle** | Schaden | magisch | Welle trifft alle Gegner in einer Linie/2 Feldern mit 70/85/100 % magischem Schaden. | 28/33/38 |
| Aktiv | **Fluchmal** | Anhaltend | magisch | Legt einen Fluch (3/4/5 Züge): pro Zug 6/9/12 % magischer Schaden (Terra? → magisch). | 20/24/28 |
| Passiv | **Konzentrierter Wille** | Schaden | magisch | +8/12/18 % magischer Rohschaden. | Res. 40 |
| Passiv | **Manavampir** | Ressource | magisch | 8/12/18 % des verursachten magischen Schadens als Mana zurück. | Res. 30 |
| Passiv | **Schattenschleier** | Verteidigung | — | −10/15/22 % erlittener magischer Schaden. | Res. 30 |
| Reaktiv | **Fluchreflex** | Kontrolle | magisch | Bei erlittenem Treffer: Angreifer erhält 1/2/3 Stapel Schwächungsfluch (−10 % Schaden/Stapel). | — · CD 2 |
| Reaktiv | **Manaschild** | Verteidigung | — | Eingehender Schaden wird zu 30/45/60 % vom Mana statt vom Leben abgezogen. | — |
| Reaktiv | **Seelenernte** | Ressource | magisch | Schaltet die Einheit einen Gegner aus: +15/25/40 Mana. | — · pro Kill |
| Modifikativ | **Fluchverstärkung** | Anhaltend | — | Alle Fluch-/DoT-Gravuren +15/25/35 % Schaden & +1 Zug; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Chaosfokus** | Schaden | — | Alle Aktiv-Zaubergravuren +10/15/22 % magischer Schaden; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Manabrand** | Ressource | — | Alle Aktivgravuren +20 % Mana-Kosten, wirken aber +15/22/30 % stärker (High-Risk). | erhöht mod. Kosten |
| **Signatur** | **Chaosbrand** | Schaden | magisch | Fähigkeiten kosten HP statt Mana; solange aktiv +10/14/18/22/28 % magischer Schaden (§5.4-Keystone). | Res. variabel · L5 |

---

## INT — Intelligenz (Blau) · Mana, Heilung, Schutz, Buffs, arkane Beschwörung

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Heilstrom** | Verteidigung | — | Heilt einen Verbündeten um 40/55/75 (INT-skaliert). | 22/26/30 |
| Aktiv | **Schutzsiegel** | Verteidigung | — | Gibt einem Verbündeten einen Schild, der 30/45/65 Schaden absorbiert (2 Züge). | 24/28/32 |
| Aktiv | **Arkane Beschwörung** | Beschwörung | — | Beschwört einen arkanen Wächter (INT-skaliert), der 2/3/4 Züge kämpft. | 28/32/36 · CD 5 |
| Passiv | **Manabrunnen** | Ressource | — | +5/8/12 Mana-Regeneration pro Zug. | Res. 20 |
| Passiv | **Große Reserve** | Ressource | — | +20/35/50 maximales Mana. | Res. 15 |
| Passiv | **Verstärkte Segen** | Präsenz | — | Buffs der Einheit halten +1/1/2 Züge länger und wirken +10/15/22 % stärker. | Res. 30 |
| Reaktiv | **Notheilung** | Verteidigung | — | Sinkt ein Verbündeter in 3 Feldern unter 25 %, heilt ihn um 20/30/45. | — · CD 3 |
| Reaktiv | **Manarückschlag** | Ressource | — | Erreicht die Einheit 0 Mana: einmalig +20/30/45 Mana. | — · 1×/Kampf |
| Reaktiv | **Schutzreflex** | Verteidigung | — | Erleidet ein Verbündeter in 2 Feldern einen tödlichen Treffer, überlebt er mit 1 LP. | — · 1×/Kampf |
| Modifikativ | **Effizienzmatrix** | Ressource | — | Alle Aktivgravuren kosten 10/15/22 % weniger Mana. | erhöht mod. Kosten |
| Modifikativ | **Verstärkte Heilung** | Verteidigung | — | Alle Heil-/Schutz-Gravuren +15/25/35 % Wirkung; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Ausgedehnte Segnung** | Präsenz | — | Alle Buff-Gravuren wirken +1 Feld weiter & +1 Zug länger; +Mana. | erhöht mod. Kosten |
| **Signatur** | **Arkaner Überfluss** | Ressource | — | Mana-Regen +5/…; die Einheit lädt Mana über das Maximum (+10/15/20/25/30 %), einsetzbar als Schild oder Schadensbonus. | Res. variabel · L5 |

---

## VIT — Vitalität (Bernstein/Gold) · Leben, Regeneration, Beschwörung, Zähigkeit

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Lebensschlag** | Schaden | physisch | Angriff mit 100/110/120 %, heilt die Einheit um 30/40/50 % des verursachten Schadens. | 22/26/30 |
| Aktiv | **Bestienruf** | Beschwörung | — | Beschwört 1/1/2 Bestien (VIT-skaliert), die 3 Züge kämpfen. | 28/32/38 · CD 5 |
| Aktiv | **Aufopferung** | Verteidigung | — | Opfert 15/12/10 % eigenes Leben, um einen Verbündeten um das Doppelte zu heilen. | 18/22/26 |
| Passiv | **Zähe Haut** | Verteidigung | — | +30/50/75 maximales Leben. | Res. 30 |
| Passiv | **Regeneration** | Ressource | — | +3/5/8 % max. Leben Regeneration pro Zug. | Res. 30 |
| Passiv | **Bluterbe** | Beschwörung | — | Beschworene Einheiten +20/35/50 % maximales Leben (VIT-skaliert). | Res. 30 |
| Reaktiv | **Zweiter Atem** | Verteidigung | — | Fällt Leben erstmals unter 25 %, einmalig 20/30/45 % Heilung. | — · 1×/Kampf |
| Reaktiv | **Trotz** | Kontrolle | — | Bei erlittener Betäubung/Verankerung: 30/50/70 % Chance, sie sofort abzuschütteln. | — · CD 2 |
| Reaktiv | **Lebensband** | Präsenz | — | Erleidet ein Verbündeter in 2 Feldern Schaden, übernimmt die Einheit 15/25/35 % davon. | — |
| Modifikativ | **Vitalverstärkung** | Beschwörung | — | Alle Beschwörungs-Gravuren +1 Zug Dauer & +15/25/35 % Werte; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Blutmagie** | Schaden | — | Alle Schadens-Aktivgravuren +10/15/22 % Schaden, skalieren zusätzlich mit max. Leben; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Lebensquell** | Verteidigung | — | Alle Heil-/Regenerations-Effekte +15/25/35 %; +Mana. | erhöht mod. Kosten |
| **Signatur** | **Unsterblicher Wille** | Verteidigung | — | Überlebt 1×/Kampf einen tödlichen Treffer mit 1 LP und heilt 20/25/30/35/40 %; L5 zusätzlich 1 Zug unverwundbar. | Res. variabel · L5 |

---

## WID — Widerstandskraft (Türkis) · Schadensreduktion, Panzer, Provozieren, Reflect

| Typ | Name | Eigenschaft | Schaden | Wirkung (L1/L2/L3) | Mana / CD |
|---|---|---|---|---|---|
| Aktiv | **Schildstoß** | Kontrolle | physisch | Angriff 90/100/110 %; zieht −10/20/30 Initiativepunkte ab (ab L2 zusätzlich 1 Zug Betäubt). | 22/26/30 |
| Aktiv | **Provokation** | Präsenz | — | Zwingt alle Gegner in 3 Feldern, die Einheit anzugreifen (Taunt) für 1/2/2 Züge. | 24/28/32 |
| Aktiv | **Fels-Haltung** | Verteidigung | — | Bis zum nächsten Zug −30/45/60 % erlittener Schaden, kann sich aber nicht bewegen. | 20/24/28 |
| Passiv | **Abhärtung** | Verteidigung | — | +5/8/12 WID (prozentuale Schadensreduktion, §5.2). | Res. 40 |
| Passiv | **Standhaft** | Kontrolle | — | −20/35/50 % Dauer erlittener Kontroll-Effekte (Betäubung/Verankerung/Slow). | Res. 30 |
| Passiv | **Dornenpanzer** | Schaden | physisch | Reflektiert 10/15/22 % erlittenen Nahkampfschadens an den Angreifer. | Res. 30 |
| Reaktiv | **Konterschild** | Verteidigung | — | Bei Nahkampftreffer: blockt 40/60/80 % des Schadens. | — · CD 2, max 3/Zug |
| Reaktiv | **Vergeltungsschlag** | Schaden | physisch | Bei Nahkampftreffer: Gegenschlag mit 60/80/100 % Schaden (§5.2 Gegenschlag). | — · CD 2 |
| Reaktiv | **Unerschütterlich** | Kontrolle | — | Bei erlittener Betäubung: 40/60/80 % Chance, sie zu ignorieren. | — · CD 2 |
| Modifikativ | **Bollwerk** | Verteidigung | — | Alle Verteidigungs-/Schild-Gravuren +15/25/35 % Wirkung; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Reflexionsmatrix** | Schaden | — | Alle reaktiven Gravuren reflektieren zusätzlich 10/15/22 % Schaden; +Mana. | erhöht mod. Kosten |
| Modifikativ | **Provokateur** | Präsenz | — | Alle Gravuren erzeugen +25/40/60 % mehr Bedrohung (Aggro); +Mana. | erhöht mod. Kosten |
| **Signatur** | **Unzerstörbar** | Verteidigung | — | Je niedriger das eigene Leben, desto höher die Reduktion — bis +10/16/24/32/40 % WID-äquivalent bei niedrigem Leben. | Res. variabel · L5 |

---

## Abdeckung der 8 Eigenschaften (Übersicht)

| Attribut | Schaden | Anhaltend | Verteidigung | Kontrolle | Mobilität | Ressource | Präsenz | Beschwörung |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| STR | ✅✅✅ | ✅ | ✅✅ | ✅✅ | ✅ | ✅ | ✅ | ✅ |
| GES | ✅✅✅ | ✅ | ✅✅ | ✅✅ | ✅ | ✅ | ✅ | — |
| WIL | ✅✅✅ | ✅✅ | ✅✅ | ✅ | — | ✅✅ | — | — |
| INT | — | — | ✅✅✅✅ | — | — | ✅✅✅ | ✅✅ | ✅ |
| VIT | ✅✅ | — | ✅✅✅ | ✅ | — | ✅ | ✅ | ✅✅ |
| WID | ✅✅ | — | ✅✅✅ | ✅✅✅ | — | — | ✅✅ | — |

> Lücken sind **Absicht durch Attribut-Identität** (z. B. INT = Support, kaum Direktschaden; WID = Tank, keine Mobilität/Beschwörung). Falls du eine Lücke gefüllt haben willst, sag welche — leicht zu ergänzen (jeder Typ *kann* jede Eigenschaft, §5.7).

---

### Nächste Schritte
1. Du korrigierst/ergänzt hier direkt (Namen, Werte, Effekte, Eigenschafts-Zuordnung).
2. Danach übertrage ich den finalen Stand nach **`data/engravings.json`** (Struktur 3/3/3/3 + 1 Signatur) und in die **Lex-Tactica-Rubrik 4** (§8.5).
3. `engravings.json` v0.3 (STR/GES nach altem 17er-Muster) wird dabei auf dieses neue Schema umgestellt.
