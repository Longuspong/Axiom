#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Konsistenz-Check für data/materials.json (GDD §5.8/§8.5, Beschluss 2026-07-19).

Prüft:
  1. Strukturzahlen: 7 Barren, 44 Aspektsplitter (16+12+5+5+6), 4 Essenzen.
  2. Wiki-Card-Schema: jeder Eintrag trägt name/kategorie/herkunft/verwendung/flavor.
  3. Essenz→Element-Gravur-Referenzen: jede der 4 Essenzen muss über
     verwendung.element_gravur_ids auf MINDESTENS 2 in data/engravings.json
     existierende Gravuren mit schadenstyp "elementar" zeigen.
     (Schlägt fehl, bis das Elementpaket des Gravuren-Reworks
     — docs/gravuren_vorschlag_v2.md — freigegeben und übertragen ist; GDD §11.)

Exit-Code 0 = alles konsistent, 1 = Fehler (Liste auf stdout).
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ERRORS = []


def err(msg):
    ERRORS.append(msg)


def main():
    materials = json.loads((ROOT / "data" / "materials.json").read_text(encoding="utf-8"))
    engravings = json.loads((ROOT / "data" / "engravings.json").read_text(encoding="utf-8"))

    # --- 1. Strukturzahlen ---
    if len(materials["barren"]) != 7:
        err(f"Barren: erwartet 7, gefunden {len(materials['barren'])}")
    sp = materials["aspektsplitter"]
    gruppen = {"waffen": 16, "offhands": 12, "ruestung_archetypen": 5,
               "gravurtypen": 5, "zubehoer": 6}
    total = 0
    for gruppe, soll in gruppen.items():
        ist = len(sp.get(gruppe, []))
        total += ist
        if ist != soll:
            err(f"Aspektsplitter/{gruppe}: erwartet {soll}, gefunden {ist}")
    if total != 44 or sp.get("anzahl_gesamt") != 44:
        err(f"Aspektsplitter gesamt: erwartet 44, gefunden {total} (anzahl_gesamt={sp.get('anzahl_gesamt')})")
    if len(materials["essenzen"]) != 4:
        err(f"Essenzen: erwartet 4, gefunden {len(materials['essenzen'])}")

    # --- 2. Wiki-Card-Schema ---
    cards = list(materials["barren"]) + list(materials["essenzen"])
    for gruppe in gruppen:
        cards += sp.get(gruppe, [])
    for c in cards:
        for feld in ("name", "kategorie", "herkunft", "verwendung", "flavor"):
            if not c.get(feld):
                err(f"Wiki-Card „{c.get('name', '?')}“: Feld „{feld}“ fehlt oder leer")

    # --- 3. Essenz → Element-Gravur-Referenzen ---
    elementar_ids = {g["id"] for g in engravings.get("gravuren", [])
                     if g.get("schadenstyp") == "elementar"}
    alle_ids = {g["id"] for g in engravings.get("gravuren", [])}
    if not elementar_ids:
        err("engravings.json enthält KEINE Gravur mit schadenstyp 'elementar' — "
            "das Elementpaket (docs/gravuren_vorschlag_v2.md) fehlt noch (GDD §11)")
    for e in materials["essenzen"]:
        ids = e.get("verwendung", {}).get("element_gravur_ids", [])
        fehlend = [i for i in ids if i not in alle_ids]
        nicht_elementar = [i for i in ids if i in alle_ids and i not in elementar_ids]
        if fehlend:
            err(f"{e['name']}: referenzierte IDs existieren nicht in engravings.json: {fehlend}")
        if nicht_elementar:
            err(f"{e['name']}: referenzierte IDs sind keine Element-Gravuren (schadenstyp != elementar): {nicht_elementar}")
        gueltig = [i for i in ids if i in elementar_ids]
        if len(gueltig) < 2:
            err(f"{e['name']} ({e['element']}): muss auf mind. 2 existierende Element-Gravuren "
                f"zeigen — gefunden {len(gueltig)} (element_gravur_ids={ids})")

    if ERRORS:
        print(f"FEHLER — materials.json ist nicht konsistent ({len(ERRORS)} Problem(e)):")
        for e in ERRORS:
            print(f"  ✗ {e}")
        return 1
    print("OK — materials.json ist konsistent (Zahlen, Wiki-Card-Schema, Essenz-Referenzen).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
