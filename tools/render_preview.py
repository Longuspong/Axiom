#!/usr/bin/env python3
"""
Rendert docs/preview_map.png — eine Beispielkarte aus den generierten Atlanten.
Nutzt exakt dieselbe Karten- und Auswahllogik wie scenes/map_demo.gd, dient
also auch als Referenz-Implementierung für die Tile-Auswahl (Masken, Seeufer).
"""

import os

from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TILES = os.path.join(ROOT, "assets", "tiles")

CW, CH = 128, 64        # Zellgröße im Atlas (Boden)
TALL_CH = 192

# Muss mit scenes/map_demo.gd übereinstimmen.
MAP = [
    "MMMM..........r.....",
    "MMC....T......r..P..",
    "MC..F...BB....r.....",
    "C......T......r...T.",
    "..T..FF.......r.....",
    "...........O..rr....",
    "RRRRRRRRRRRRRRR=RRRR",
    "...T........R..r.B..",
    ".....BB.....R..r....",
    ".P..........R..r....",
    "............R..rWWW.",
    "..DDD.......R...WWWW",
    "..DDD..T....R...WWWW",
    "..DDD.......R...WWW.",
    "............R.......",
    "............RRRRRRRR",
]
H = len(MAP)
W = len(MAP[0])

# Atlas-Koordinaten (siehe scripts/tile_ids.gd)
GRASS = [(0, 0), (1, 0)]
FLOWERS = [(2, 0), (3, 0)]
FIELD = (7, 0)
RIVER = [(m % 8, 1 + m // 8) for m in range(16)]
ROAD = [(m % 8, 3 + m // 8) for m in range(16)]
LAKE_EDGE = {"N": (0, 5), "E": (1, 5), "S": (2, 5), "W": (3, 5)}
LAKE_OUT = {"NE": (4, 5), "SE": (5, 5), "SW": (6, 5), "NW": (7, 5)}
LAKE_IN = {"NE": (0, 6), "SE": (1, 6), "SW": (2, 6), "NW": (3, 6)}
WATER_FULL = (4, 6)
BRIDGE_EW = (0, 7)
MOUNTAIN = [(0, 0), (1, 0)]
CLIFF = (2, 0)
BOULDER = (3, 0)
SCRUB = [(0, 1), (1, 1)]
TREE_ROUND = (2, 1)
TREE_PINE = (3, 1)

DIRS = {"N": (0, -1), "E": (1, 0), "S": (0, 1), "W": (-1, 0)}
BITS = {"N": 1, "E": 2, "S": 4, "W": 8}


def cell(x, y, default):
    if 0 <= x < W and 0 <= y < H:
        return MAP[y][x]
    return default


def is_water(c):
    return c in "rW="


OPPOSITE = {"N": "S", "S": "N", "E": "W", "W": "E"}


def conn_mask(x, y, chars):
    mask = 0
    offmap = []
    for side, (dx, dy) in DIRS.items():
        c = cell(x + dx, y + dy, None)
        if c is None:
            offmap.append(side)
        elif c in chars:
            mask |= BITS[side]
    # Kartenrand: nur geradeaus weiterführen (kein Stich-Arm zum Rand)
    for side in offmap:
        if mask & BITS[OPPOSITE[side]]:
            mask |= BITS[side]
    return mask


def lake_tile(x, y):
    land = {}
    for side, (dx, dy) in DIRS.items():
        c = cell(x + dx, y + dy, "W")  # ausserhalb der Karte: Wasser
        land[side] = not is_water(c)
    n_land = [s for s in "NESW" if land[s]]
    if len(n_land) == 1:
        return LAKE_EDGE[n_land[0]]
    if len(n_land) == 2:
        pair = "".join(sorted(n_land))
        for cor in ("NE", "SE", "SW", "NW"):
            if "".join(sorted(cor)) == pair:
                return LAKE_OUT[cor]
        return WATER_FULL  # gegenüberliegende Seiten: Kanal -> Fluss nutzen
    if len(n_land) == 0:
        for cor, (dx, dy) in {"NE": (1, -1), "SE": (1, 1), "SW": (-1, 1), "NW": (-1, -1)}.items():
            if not is_water(cell(x + dx, y + dy, "W")):
                return LAKE_IN[cor]
        return WATER_FULL
    return WATER_FULL


def hashv(x, y):
    return ((x * 73856093) ^ (y * 19349663)) & 0xFFFF


def main():
    ground_atlas = Image.open(os.path.join(TILES, "terrain_ground.png"))
    tall_atlas = Image.open(os.path.join(TILES, "terrain_tall.png"))

    def ground_tile(col, row):
        return ground_atlas.crop((col * CW, row * CH, (col + 1) * CW, (row + 1) * CH))

    def tall_tile(col, row):
        return tall_atlas.crop((col * CW, row * TALL_CH, (col + 1) * CW, (row + 1) * TALL_CH))

    margin = 32
    img_w = (W + H) * (CW // 2) + margin * 2
    img_h = (W + H) * (CH // 2) + (TALL_CH - CH) + margin * 2
    canvas = Image.new("RGBA", (img_w, img_h), (244, 240, 228, 255))
    ox = H * (CW // 2) + margin - CW // 2
    oy = margin + (TALL_CH - CH)

    def blit_ground(x, y, coords):
        sx = ox + (x - y) * (CW // 2)
        sy = oy + (x + y) * (CH // 2)
        t = ground_tile(*coords)
        canvas.alpha_composite(t, (sx, sy))

    def blit_tall(x, y, coords):
        sx = ox + (x - y) * (CW // 2)
        sy = oy + (x + y) * (CH // 2) - (TALL_CH - CH)
        canvas.alpha_composite(tall_tile(*coords), (sx, sy))

    talls = []  # (depth, x, y, coords)
    for y in range(H):
        for x in range(W):
            c = MAP[y][x]
            if c == ".":
                blit_ground(x, y, GRASS[0] if hashv(x, y) % 5 else GRASS[1])
            elif c == "F":
                blit_ground(x, y, FLOWERS[hashv(x, y) % 2])
            elif c == "D":
                blit_ground(x, y, FIELD)
            elif c == "r":
                blit_ground(x, y, RIVER[conn_mask(x, y, "rW=")])
            elif c == "R":
                blit_ground(x, y, ROAD[conn_mask(x, y, "R=")])
            elif c == "=":
                blit_ground(x, y, BRIDGE_EW)
            elif c == "W":
                blit_ground(x, y, lake_tile(x, y))
            elif c in "MCB":
                blit_ground(x, y, GRASS[0])
                if c == "M":
                    talls.append((x + y, x, y, MOUNTAIN[hashv(x, y) % 2]))
                elif c == "C":
                    talls.append((x + y, x, y, CLIFF))
                else:
                    talls.append((x + y, x, y, SCRUB[hashv(x, y) % 2]))
            elif c in "TPO":
                blit_ground(x, y, GRASS[0] if hashv(x, y) % 5 else GRASS[1])
                coords = {"T": TREE_ROUND, "P": TREE_PINE, "O": BOULDER}[c]
                talls.append((x + y, x, y, coords))

    for _, x, y, coords in sorted(talls, key=lambda t: (t[0], t[1])):
        blit_tall(x, y, coords)

    os.makedirs(os.path.join(ROOT, "docs"), exist_ok=True)
    out = os.path.join(ROOT, "docs", "preview_map.png")
    canvas.convert("RGB").save(out)
    print(f"OK: {out} ({img_w}x{img_h})")


if __name__ == "__main__":
    main()
