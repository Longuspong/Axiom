#!/usr/bin/env python3
"""Erzeugt aus data/waffen.json eine Excel-Datei in der v6-Struktur.

Aufruf:  python3 tools/waffen_to_excel.py [ausgabe.xlsx]
Standard-Ausgabe: itemliste_waffen.xlsx

Hält die Spalten-/Layout-Struktur des Blatts "Waffen" aus itemliste_v6.xlsx
bei, damit Balancing weiterhin in gewohnter Excel-Form moeglich ist.
data/waffen.json bleibt die Single Source of Truth.
"""
import json, sys, os

try:
    import openpyxl
except ImportError:
    sys.exit("openpyxl fehlt:  pip install openpyxl")

HEADER = [
    "ID", "Name", "Klasse", "Typ", "Stufe\n(1–7)", "Material", "Eigenart",
    "Theme/Set", "Slots", "Slot 1", "Slot 2", "Slot 3", "Slot 4", "Slot 5",
    "Grund-\nkapazität", "Max.\nVerfeiner.", "Prim.\nAttr.", "Prim.\nWert",
    "Sek.\nAttr.", "Sek.\nWert", "Angriffe\n/Zug", "Reichweite", "Bauteile",
    "Kaufpreis\n(Barren)", "Verkaufs-\npreis",
]

FOOTNOTE = ('Theme/Set:  "Pures Material" → 100% Attribute  |  '
            'Set-Name (z.B. "Schlangenkopf") → 90% Attribute '
            '(Rest balanciert der Set-Bonus)')


def slot_cells(w):
    """Fuellt Slot 1..5; Platzhalter (Stellar) bekommen '?', sonst '—'."""
    filler = "?" if w.get("platzhalter") else "—"
    slots = list(w.get("slots", []))
    if w.get("platzhalter"):
        slots = ["?"] * 5
    return (slots + [filler] * 5)[:5]


def row_for(w):
    s = slot_cells(w)
    return [
        w["id"], w["name"], w["klasse"], w["typ"], w["stufe"], w["material"],
        w["eigenart"], "Pures Material", len(w.get("slots", [])),
        s[0], s[1], s[2], s[3], s[4],
        w["grundkapazitaet"], w["max_verfeinerung"],
        w["primaer"]["attribut"], w["primaer"]["wert"],
        w["sekundaer"]["attribut"], w["sekundaer"]["wert"],
        w["angriffe_pro_zug"], w["reichweite"], w["bauteile"],
        w.get("kaufpreis"), w.get("verkaufspreis"),
    ]


def main():
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    with open(os.path.join(here, "data", "waffen.json"), encoding="utf-8") as f:
        data = json.load(f)

    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "Waffen"
    ws.append(HEADER)

    last = None
    for w in data["waffen"]:
        if w["klasse"] != last:               # Klassen-Trennzeile
            ws.append(["  " + w["klasse"].upper()])
            last = w["klasse"]
        ws.append(row_for(w))
    ws.append([FOOTNOTE])

    out = sys.argv[1] if len(sys.argv) > 1 else "itemliste_waffen.xlsx"
    wb.save(out)
    print(f"geschrieben: {out}  ({len(data['waffen'])} Waffen)")


if __name__ == "__main__":
    main()
