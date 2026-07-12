#!/usr/bin/env python3
"""
Axiom — Isometrischer Terrain-Tileset-Generator
================================================
Erzeugt das komplette isometrische HD-Pixel-Art-Tileset prozedural:

  assets/tiles/terrain_ground.png   Boden-Atlas  (Zellen 128x64,  8x8 Tiles)
  assets/tiles/terrain_tall.png     Hoch-Atlas   (Zellen 128x192, 4x2 Tiles)
  assets/tiles/terrain_tileset.tres Godot-4-TileSet (beide Atlanten, Custom-Data)
  scripts/tile_ids.gd               GDScript-Konstanten (Atlas-Koordinaten)

Look: HD-2D-inspiriert (Octopath-Richtung, aber hell & freundlich) —
native 128x64-Pixeldichte, hue-geshiftete Farbrampen (kühle Schatten,
warme Lichter), Mikrodetails wie Grasbüschel und Kiesel.
Hohe Tiles (Berge, Bäume, ...) nutzen 128x192 mit texture_origin (0, 64),
damit die Rautenbasis auf dem Grid sitzt (2.5D-Effekt).

Grid-Konvention (Godot TILE_LAYOUT_DIAMOND_DOWN):
  N = -y (Bildschirm: Kante oben rechts)   E = +x (unten rechts)
  S = +y (unten links)                     W = -x (oben links)
Verbindungs-Bitmaske für Fluss/Strasse: N=1, E=2, S=4, W=8.
"""

import math
import os
import random

from PIL import Image

SEED = 1337

TW, TH = 128, 64         # Rauten-Grundfläche (nativ, kein Upscale)
TALL_H = 192             # hohe Zellen
SCALE = 1

GROUND_COLS, GROUND_ROWS = 8, 8
TALL_COLS, TALL_ROWS = 4, 2

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_TILES = os.path.join(ROOT, "assets", "tiles")
OUT_SCRIPTS = os.path.join(ROOT, "scripts")

# ------------------------------------------------------------------ Paletten
# Alle Rampen sind hue-geshiftet: Schatten kühl (blau/teal), Lichter warm.
GRASS = [(64, 120, 84), (86, 150, 80), (110, 178, 82), (138, 202, 92), (166, 222, 108)]
GRASS_LIGHT = (198, 238, 132)
GRASS_DARK = (50, 100, 74)
STONE_SPECK = [(168, 168, 158), (138, 140, 134)]
FLOWER_COLORS = [(255, 255, 255), (255, 208, 70), (255, 126, 156), (170, 140, 255)]
FLOWER_CORE = (255, 238, 130)

WATER = [(26, 82, 156), (36, 114, 190), (56, 146, 214), (86, 178, 232), (128, 206, 244)]
WATER_SPARKLE = (222, 244, 252)
WATER_GLINT = (170, 224, 246)
FOAM = (248, 253, 255)

SAND = [(178, 138, 96), (202, 166, 116), (222, 190, 138), (238, 212, 162), (250, 232, 188)]
SAND_SPECK = (160, 122, 86)

ROAD = [(138, 104, 78), (162, 126, 92), (184, 148, 106), (204, 170, 122), (220, 190, 140)]
ROAD_PEBBLE = (232, 216, 186)
ROAD_RUT = (122, 90, 66)
ROAD_EDGE = (106, 78, 58)

DIRT = [(108, 74, 52), (132, 94, 62), (154, 114, 74), (174, 132, 88), (192, 152, 102)]
FIELD_DARK = (96, 64, 46)

ROCK = [(76, 80, 102), (100, 104, 124), (126, 130, 146), (154, 158, 170), (184, 188, 196), (212, 214, 218)]
SNOW = [(196, 212, 236), (226, 238, 250), (248, 252, 255)]

WOOD = [(94, 60, 44), (120, 80, 52), (146, 102, 62), (170, 124, 76), (192, 148, 92)]
WOOD_DARK = (74, 46, 34)

TRUNK = [(74, 48, 40), (100, 66, 46), (126, 88, 56), (152, 112, 68)]
LEAF = [(36, 102, 66), (58, 132, 66), (86, 162, 72), (116, 190, 84), (148, 216, 100)]
PINE = [(26, 86, 72), (40, 110, 86), (58, 136, 100), (80, 160, 114), (106, 184, 128)]
BRUSH = [(32, 84, 54), (48, 108, 56), (66, 130, 62), (86, 152, 70), (110, 174, 82)]
BERRY = (222, 72, 94)
LILY = [(66, 146, 68), (96, 178, 86)]
LILY_BLOOM = (255, 170, 192)

BAYER4 = [
    [0, 8, 2, 10],
    [12, 4, 14, 6],
    [3, 11, 1, 9],
    [15, 7, 13, 5],
]


def clamp(x, lo, hi):
    return lo if x < lo else hi if x > hi else x


def hash01(x, y, salt=0):
    """Deterministischer Pixel-Hash in [0,1)."""
    n = (x * 374761393 + y * 668265263 + salt * 2246822519 + SEED * 3266489917) & 0xFFFFFFFF
    n = ((n ^ (n >> 13)) * 1274126177) & 0xFFFFFFFF
    return ((n >> 8) & 0xFFFF) / 65536.0


class VNoise:
    """Periodisches Value-Noise (Periode = freq) -> nahtlos kachelbar."""

    def __init__(self, seed, freq):
        rnd = random.Random(seed)
        self.f = freq
        self.g = [[rnd.random() for _ in range(freq)] for _ in range(freq)]

    def at(self, u, v):
        f = self.f
        x, y = u * f, v * f
        xi, yi = math.floor(x), math.floor(y)
        xf, yf = x - xi, y - yi
        xi %= f
        yi %= f
        sx = xf * xf * (3 - 2 * xf)
        sy = yf * yf * (3 - 2 * yf)
        g = self.g
        a = g[yi][xi]
        b = g[yi][(xi + 1) % f]
        c = g[(yi + 1) % f][xi]
        d = g[(yi + 1) % f][(xi + 1) % f]
        return (a + (b - a) * sx) * (1 - sy) + (c + (d - c) * sx) * sy


N1 = VNoise(SEED + 1, 5)
N2 = VNoise(SEED + 2, 9)
N3 = VNoise(SEED + 3, 17)
N4 = VNoise(SEED + 6, 29)   # Mikrodetail
NWOB = VNoise(SEED + 4, 4)  # Ufer-/Wegkanten-Wobble
NW2 = VNoise(SEED + 5, 7)


def fbm(u, v):
    return 0.5 * N1.at(u, v) + 0.28 * N2.at(u, v) + 0.14 * N3.at(u, v) + 0.08 * N4.at(u, v)


def wobble(u, v, amp=0.07):
    return (NWOB.at(u, v) - 0.5) * 2 * amp + (NW2.at(u, v) - 0.5) * amp


def ramp(colors, t, px, py, dither=0.4):
    """Dither-quantisierte Farbauswahl aus einer Rampe."""
    t = t + (BAYER4[py % 4][px % 4] / 16.0 - 0.5) * dither / len(colors) * 2
    idx = clamp(int(t * len(colors)), 0, len(colors) - 1)
    return colors[idx]


def mix(a, b, t):
    return (int(a[0] * (1 - t) + b[0] * t),
            int(a[1] * (1 - t) + b[1] * t),
            int(a[2] * (1 - t) + b[2] * t))


def uv_at(px, py):
    """Screen-Pixel -> Grid-Koordinaten (u,v) in [0,1] innerhalb der Raute."""
    x = px + 0.5 - TW / 2
    y = py + 0.5
    u = x / TW + y / TH
    v = y / TH - x / TW
    return u, v


def in_diamond(u, v):
    return 0.0 <= u < 1.0 and 0.0 <= v < 1.0


# -------------------------------------------------------------- Bodenfarben
def grass_at(u, v, px, py, variant=0):
    # Zwei Noise-Ebenen: grosse weiche Flecken + feines Rauschen
    macro = fbm(u + variant * 0.31, v + variant * 0.17)
    micro = N4.at(u * 2 + variant, v * 2)
    t = macro * 0.72 + micro * 0.28
    c = ramp(GRASS, t, px, py)
    h = hash01(px, py, 11 + variant)
    if h > 0.978:  # helle Halmspitzen
        return GRASS_LIGHT
    if h < 0.012:  # dunkle Büschel
        return GRASS_DARK
    return c


def flower_positions(variant, count=9):
    rnd = random.Random(SEED * 7 + variant)
    out = []
    for _ in range(count):
        out.append((rnd.uniform(0.12, 0.88), rnd.uniform(0.12, 0.88),
                    rnd.choice(FLOWER_COLORS)))
    return out


FLOWERS_A = flower_positions(1)
FLOWERS_B = flower_positions(2, 13)


def grass_flowers_at(u, v, px, py, variant=0):
    flowers = FLOWERS_A if variant == 0 else FLOWERS_B
    for fu, fv, col in flowers:
        d = math.hypot(u - fu, (v - fv))
        if d < 0.016:
            return FLOWER_CORE
        if d < 0.042:
            return col
        if d < 0.058:  # dunkler Blattkranz um die Blüte
            return GRASS[1]
    return grass_at(u, v, px, py, 2 + variant)


def sand_at(u, v, px, py, variant=0):
    t = fbm(u + variant * 0.43, v) * 0.8 + N4.at(u * 3, v * 3) * 0.2
    c = ramp(SAND, t, px, py)
    if hash01(px, py, 21 + variant) > 0.975:
        return SAND_SPECK
    return c


def dirt_at(u, v, px, py):
    t = fbm(u + 0.71, v + 0.29)
    c = ramp(DIRT, t, px, py)
    if hash01(px, py, 31) > 0.98:
        return ROAD_PEBBLE
    return c


def field_at(u, v, px, py):
    """Acker: Furchen entlang der u-Achse."""
    row = (v * 7.0 + (fbm(u, v) - 0.5) * 0.35) % 1.0
    t = fbm(u, v) * 0.5 + (0.55 if row < 0.55 else 0.08)
    c = ramp(DIRT, t, px, py)
    if row >= 0.55 and hash01(px, py, 41) > 0.94:
        return FIELD_DARK
    return c


def water_at(u, v, px, py, depth=1.0):
    t = 0.4 + 0.45 * fbm(u * 2 + 0.13, v * 2 + 0.57) - 0.5 * clamp(depth, 0, 1)
    c = ramp(WATER, clamp(t, 0, 0.99), px, py)
    # Grobe Wellen-Glitzer entlang der Iso-Diagonalen
    w = math.sin((u + v) * 22 + fbm(u, v) * 9)
    if w > 0.93 and hash01(px, py, 51) > 0.5:
        return WATER_SPARKLE
    # Feine Gegenrichtung-Glints
    w2 = math.sin((u - v) * 31 - fbm(v, u) * 7)
    if w2 > 0.965 and hash01(px, py, 52) > 0.55:
        return WATER_GLINT
    return c


# ------------------------------------------------- Wasser-/Wegformen (Felder)
SHORE_SAND = 0.075   # Sandstreifen-Breite (Grid-Einheiten)
SHORE_FOAM = 0.045   # Schaumsaum im Wasser


def shore_color(d, u, v, px, py, land_fn):
    """d > 0: Wasser (Tiefe), d <= 0: Land; Sand + Schaum am Übergang."""
    if d > 0:
        if d < SHORE_FOAM and hash01(px, py, 61) > 0.3:
            return FOAM
        if d < SHORE_FOAM * 2.2:  # türkises Flachwasser
            return mix(water_at(u, v, px, py, 0.0), SAND[3], 0.25)
        return water_at(u, v, px, py, depth=d / 0.22)
    if d > -SHORE_SAND:
        return sand_at(u, v, px, py)
    return land_fn(u, v, px, py)


def lake_field(kind, u, v):
    """Signierte Wassertiefe für See-Übergangstiles.

    kind: ('edge', side) / ('outer', corner) / ('inner', corner) / ('full',)
    side/corner benennen die GRAS-Seite(n).
    """
    t = 0.42
    w = wobble(u, v)

    def side_d(side):
        if side == "N":
            return v - (t + w)
        if side == "S":
            return (1 - t + w) - v
        if side == "E":
            return (1 - t + w) - u
        return u - (t + w)  # W

    if kind[0] == "full":
        return 0.5
    if kind[0] == "edge":
        return side_d(kind[1])
    a, b = kind[1][0], kind[1][1]
    if kind[0] == "outer":   # Gras auf zwei Seiten -> Wasser = Schnittmenge
        return min(side_d(a), side_d(b))
    return max(side_d(a), side_d(b))  # inner: Gras nur in der Ecke


ARM_END = {"N": (0.5, 0.0), "E": (1.0, 0.5), "S": (0.5, 1.0), "W": (0.0, 0.5)}
MASK_BITS = [("N", 1), ("E", 2), ("S", 4), ("W", 8)]


def seg_dist(u, v, ax, ay, bx, by):
    dx, dy = bx - ax, by - ay
    ln = dx * dx + dy * dy
    t = clamp(((u - ax) * dx + (v - ay) * dy) / ln, 0, 1) if ln else 0
    ex, ey = ax + dx * t, ay + dy * t
    return math.hypot(u - ex, v - ey)


def path_dist(mask, u, v):
    """Abstand zum Pfad-Skelett (Zentrum -> verbundene Kanten)."""
    if mask == 0:
        return math.hypot(u - 0.5, v - 0.5)
    best = 9.0
    for side, bit in MASK_BITS:
        if mask & bit:
            ex, ey = ARM_END[side]
            best = min(best, seg_dist(u, v, 0.5, 0.5, ex, ey))
    return best


def river_at(mask, u, v, px, py):
    uu = u + wobble(v + 0.37, u, 0.05)
    vv = v + wobble(u, v + 0.61, 0.05)
    hw = 0.26 if mask else 0.30
    d = hw - path_dist(mask, uu, vv)
    return shore_color(d, u, v, px, py, grass_at)


def road_at(mask, u, v, px, py):
    uu = u + wobble(v + 0.83, u, 0.035)
    vv = v + wobble(u + 0.19, v, 0.035)
    hw = 0.20 if mask else 0.16
    dist = path_dist(mask, uu, vv)
    d = hw - dist
    if d <= 0:
        if d > -0.022:  # dunkle Wegkante
            return ROAD_EDGE
        if d > -0.05 and hash01(px, py, 72) > 0.82:  # Randsteine
            return STONE_SPECK[hash01(px, py, 73) > 0.5]
        return grass_at(u, v, px, py)
    if abs(dist - 0.10) < 0.013 and mask:  # Wagenspuren
        return ROAD_RUT
    t = fbm(u * 1.7 + 0.41, v * 1.7 + 0.09) * 0.8 + N4.at(u * 3, v * 3) * 0.2
    if hash01(px, py, 71) > 0.965:
        return ROAD_PEBBLE
    return ramp(ROAD, t, px, py)


def ford_at(u, v, px, py, ew=True):
    """Furt: Strasse quert seichtes Wasser mit Trittsteinen.

    ew=True: Weg verläuft E-W, Wasser N-S.
    """
    wmask = (1 | 4) if ew else (2 | 8)  # Wasserkanal quer zum Weg
    rmask = 15 ^ wmask
    uu = u + wobble(v + 0.37, u, 0.05)
    vv = v + wobble(u, v + 0.61, 0.05)
    d = 0.26 - path_dist(wmask, uu, vv)  # Wassertiefe (>0 = Wasser)
    ru = u + wobble(v + 0.83, u, 0.035)
    rv = v + wobble(u + 0.19, v, 0.035)
    rdist = path_dist(rmask, ru, rv)
    if d > 0 and rdist < 0.20:
        if N3.at(u * 2.3, v * 2.3) > 0.64:  # Trittsteine
            t = 0.5 + (fbm(u * 4, v * 4) - 0.5) * 0.6
            return ramp(ROCK, clamp(t, 0, 0.99), px, py)
        return mix(water_at(u, v, px, py, 0.05), SAND[2], 0.35)
    return shore_color(d, u, v, px, py,
                       lambda u2, v2, px2, py2: road_at(rmask, u2, v2, px2, py2))


LILIES = [(0.3, 0.35), (0.62, 0.28), (0.45, 0.62), (0.72, 0.7), (0.25, 0.75)]


def water_lily_at(u, v, px, py):
    for i, (lu, lv) in enumerate(LILIES):
        d = math.hypot(u - lu, v - lv)
        if d < 0.017 and i % 2 == 0:
            return LILY_BLOOM
        if d < 0.07 and not (u - lu > 0 and abs(v - lv) < 0.016):
            return LILY[1] if hash01(px, py, 81) > 0.4 else LILY[0]
    return water_at(u, v, px, py, 0.55)


WROCKS = [(0.3, 0.4, 0.10), (0.6, 0.65, 0.08), (0.7, 0.3, 0.06)]


def water_rocks_at(u, v, px, py):
    for ru, rv, rr in WROCKS:
        d = math.hypot(u - ru, v - rv)
        if d < rr:
            t = 0.35 + (rv - v + ru - u) * 2.2 + fbm(u * 3, v * 3) * 0.4
            return ramp(ROCK, clamp(t, 0, 0.99), px, py)
        if d < rr + 0.03 and hash01(px, py, 91) > 0.4:
            return FOAM
    return water_at(u, v, px, py, 0.6)


# ------------------------------------------------------------ Tile-Renderer
def paint_ground(img, ox, oy, color_fn):
    pix = img.load()
    for py in range(TH):
        for px in range(TW):
            u, v = uv_at(px, py)
            if in_diamond(u, v):
                pix[ox + px, oy + py] = color_fn(u, v, px, py) + (255,)


def add_grass_details(img, ox, oy, salt, tufts=16, stones=3):
    """Grasbüschel + Kiesel als Overlay — nur auf bereits gefüllten Pixeln."""
    pix = img.load()
    rnd = random.Random(SEED * 13 + salt)

    def on_tile(px, py):
        return 0 <= px < TW and 0 <= py < img.height - oy and pix[ox + px, oy + py][3] == 255

    for _ in range(tufts):
        u, v = rnd.uniform(0.08, 0.92), rnd.uniform(0.08, 0.92)
        sx = int((u - v) * (TW / 2) + TW / 2)
        sy = int((u + v) * (TH / 2))
        for b in (-1, 0, 1):
            h = rnd.randint(2, 4) - abs(b)
            for k in range(h):
                px_, py_ = sx + b * 2, sy - k
                if on_tile(px_, py_):
                    col = GRASS_LIGHT if k == h - 1 else GRASS[3 + (k % 2)]
                    pix[ox + px_, oy + py_] = col + (255,)
        if on_tile(sx, sy + 1):
            pix[ox + sx, oy + sy + 1] = GRASS_DARK + (255,)
    for _ in range(stones):
        u, v = rnd.uniform(0.15, 0.85), rnd.uniform(0.15, 0.85)
        sx = int((u - v) * (TW / 2) + TW / 2)
        sy = int((u + v) * (TH / 2))
        for dx, dy, ci in ((0, 0, 0), (1, 0, 0), (0, 1, 1), (1, 1, 1)):
            if on_tile(sx + dx, sy + dy):
                pix[ox + sx + dx, oy + sy + dy] = STONE_SPECK[ci] + (255,)


def paint_grass_base(img, ox, oy, variant=0, details=True):
    paint_ground(img, ox, oy, lambda u, v, px, py: grass_at(u, v, px, py, variant))
    if details:
        add_grass_details(img, ox, oy, salt=variant)


def blit_shadow(img, cx, cy, rx, ry, alpha=60):
    pix = img.load()
    for py in range(int(cy - ry), int(cy + ry + 1)):
        for px in range(int(cx - rx), int(cx + rx + 1)):
            if not (0 <= px < img.width and 0 <= py < img.height):
                continue
            dx, dy = (px - cx) / rx, (py - cy) / ry
            if dx * dx + dy * dy < 1:
                r, g, b, a = pix[px, py]
                if a == 0:
                    pix[px, py] = (30, 44, 30, alpha)
                else:
                    f = alpha / 255.0
                    pix[px, py] = (int(r * (1 - f * 0.6)), int(g * (1 - f * 0.6)),
                                   int(b * (1 - f * 0.6)), a)


def paint_bridge(img, ox, oy, ew=True):
    """Holzbrücke über den Fluss (leicht gewölbtes Plankendeck)."""
    wmask = (1 | 4) if ew else (2 | 8)
    paint_ground(img, ox, oy, lambda u, v, px, py: river_at(wmask, u, v, px, py))
    pix = img.load()
    deck_hw = 0.21
    for py in range(TH):
        for px in range(TW):
            u, v = uv_at(px, py)
            if not in_diamond(u, v):
                continue
            along = u if ew else v
            cross = (v if ew else u) - 0.5
            if abs(cross) > deck_hw:
                continue
            lift = int(round(5.0 * math.sin(math.pi * clamp(along, 0, 1))))
            t = 0.3 + fbm(u * 2 + 0.53, v * 2 + 0.11) * 0.55
            col = ramp(WOOD, t, px, py)
            if (along * 9) % 1.0 < 0.1:           # Plankenfugen
                col = WOOD_DARK
            if abs(cross) > deck_hw - 0.04:       # Brüstungskante
                col = WOOD_DARK if abs(cross) > deck_hw - 0.02 else WOOD[4]
            ty = py - lift
            if ty >= 0:
                pix[ox + px, oy + ty] = col + (255,)
            for k in range(1, lift + 1):          # Seitenfläche unter dem Deck
                yy = py - lift + k
                if 0 <= yy < TH:
                    pix[ox + px, oy + yy] = (int(col[0] * 0.5), int(col[1] * 0.5),
                                             int(col[2] * 0.55), 255)


def paint_mountain(img, ox, oy, snow=False, variant=0):
    """Heightfield-Berg, back-to-front als Voxelsäulen gerendert."""
    base_y = TALL_H - TH  # Rautenbasis beginnt hier
    paint_grass_base(img, ox, oy + base_y, variant, details=False)

    hn = VNoise(SEED + 40 + variant, 6)
    rn = VNoise(SEED + 44 + variant, 13)
    hmax = 104.0 if not snow else 112.0
    cu, cv = 0.46, 0.42
    cu2, cv2 = 0.66, 0.66  # Nebengipfel
    pix = img.load()

    steps = 288
    for si in range(steps * 2):      # Iso-Tiefe = u+v aufsteigend
        for sj in range(steps):
            s = si / (2.0 * steps)
            q = sj / float(steps)
            u = clamp(s + (q - 0.5), 0.02, 0.98)
            v = clamp(s - (q - 0.5), 0.02, 0.98)
            fall = 1.0 - max(abs(u - cu), abs(v - cv)) / 0.44
            fall2 = 1.0 - max(abs(u - cu2), abs(v - cv2)) / 0.32
            rough = 0.45 + 0.95 * hn.at(u * 1.2, v * 1.2)
            h = hmax * max(fall, 0.0) ** 1.15 * rough
            h = max(h, hmax * 0.62 * max(fall2, 0.0) ** 1.2 * rough)
            if h < 5.0:
                continue
            sx = int((u - v) * (TW / 2) + TW / 2)
            sy_ground = int((u + v) * (TH / 2)) + base_y
            top = sy_ground - int(h)
            # Beleuchtung über Gradient (Licht von rechts oben)
            e = 0.02
            gu = (hn.at(u + e, v) - hn.at(u - e, v)) * hmax * 0.18 + \
                 (-1 if u > cu else 1) * hmax * 0.014
            gv = (hn.at(u, v + e) - hn.at(u, v - e)) * hmax * 0.18 + \
                 (-1 if v > cv else 1) * hmax * 0.014
            shade = clamp(0.45 + 0.015 * (gu - gv), 0.04, 0.96)
            shade = clamp(shade + (rn.at(u, v) - 0.5) * 0.35, 0.02, 0.98)
            snowline = hmax * (0.52 + (rn.at(u * 2, v * 2) - 0.5) * 0.25)
            for yy in range(top, sy_ground + 1):
                if not (0 <= sx < TW and 0 <= yy < TALL_H):
                    continue
                depth = (yy - top) / max(h, 1)
                t = shade * (1.0 - depth * 0.55)
                if snow and (sy_ground - yy) > snowline:
                    col = ramp(SNOW, clamp(t + 0.25, 0, 0.99), sx, yy)
                else:
                    col = ramp(ROCK, clamp(t, 0, 0.99), sx, yy)
                pix[ox + sx, oy + yy] = col + (255,)


def paint_cliff(img, ox, oy, height=44, variant=0):
    """Erhöhtes Gras-Plateau mit Felswänden (2.5D-Höhenstufe)."""
    base_y = TALL_H - TH
    pix = img.load()
    # Felswände: sichtbare SW-/SE-Flächen
    for px in range(TW):
        half = TW // 2
        if px < half:
            yb = base_y + TH // 2 + px * (TH / 2) / half   # linke Unterkante
            left = True
        else:
            yb = base_y + TH - (px - half) * (TH / 2) / half
            left = False
        yb = int(yb)
        for yy in range(yb - height, yb):
            strata = ((yy + fbm(px / TW, yy / TALL_H) * 14) // 6) % 4 / 4.0
            t = 0.32 + strata * 0.48 + (fbm(px / 42.0, yy / 26.0) - 0.5) * 0.3
            if left:
                t -= 0.24
            if yy >= yb - height and yy < yb - height + 2:
                t += 0.45
            col = ramp(ROCK, clamp(t, 0, 0.99), px, yy)
            if 0 <= yy < TALL_H:
                pix[ox + px, oy + yy] = col + (255,)
    # Grasdeckel oben
    paint_grass_base(img, ox, oy + base_y - height, 3 + variant)


def paint_boulder(img, ox, oy):
    base_y = TALL_H - TH
    blit_shadow(img, ox + TW / 2, oy + base_y + TH / 2 + 4, 30, 12)
    bn = VNoise(SEED + 60, 5)
    pix = img.load()
    for si in range(320):
        for sj in range(160):
            s, q = si / 320.0, sj / 160.0
            u = clamp(0.5 + (s - 0.5) * 0.55 + (q - 0.5) * 0.5, 0.02, 0.98)
            v = clamp(0.5 + (s - 0.5) * 0.55 - (q - 0.5) * 0.5, 0.02, 0.98)
            fall = 1.0 - math.hypot(u - 0.5, v - 0.52) / 0.26
            if fall <= 0:
                continue
            h = 30.0 * (fall ** 0.8) * (0.7 + 0.5 * bn.at(u * 2, v * 2))
            if h < 2.4:
                continue
            sx = int((u - v) * (TW / 2) + TW / 2)
            syg = int((u + v) * (TH / 2)) + base_y
            top = syg - int(h)
            shade = clamp(0.5 + (u - v) * 1.3 + (bn.at(u * 3, v * 3) - 0.5) * 0.5, 0.03, 0.97)
            for yy in range(top, syg + 1):
                depth = (yy - top) / max(h, 1)
                col = ramp(ROCK, clamp(shade * (1 - depth * 0.5), 0, 0.99), sx, yy)
                if 0 <= sx < TW and 0 <= yy < TALL_H:
                    pix[ox + sx, oy + yy] = col + (255,)


def paint_blob(img, ox, oy, cx, cy, rx, ry, palette, salt, light=(0.6, -0.75),
               berries=False):
    """Schattiere eine Busch-/Laubkugel (Licht von rechts oben)."""
    lx, ly = light
    pix = img.load()
    for py in range(int(cy - ry - 1), int(cy + ry + 2)):
        for px in range(int(cx - rx - 1), int(cx + rx + 2)):
            if not (0 <= px < TW and 0 <= py < TALL_H):
                continue
            dx, dy = (px - cx) / rx, (py - cy) / ry
            rr = dx * dx + dy * dy
            rr += (hash01(px, py, salt) - 0.5) * 0.25  # unruhige Silhouette
            if rr >= 1:
                continue
            t = 0.5 + 0.42 * (dx * lx + dy * ly) - rr * 0.22
            t += (fbm(px / 34.0, py / 34.0) - 0.5) * 0.35
            col = ramp(palette, clamp(t, 0, 0.99), px, py)
            if berries and hash01(px, py, salt + 5) > 0.97:
                col = BERRY
            pix[ox + px, oy + py] = col + (255,)


def paint_scrub(img, ox, oy, variant=0):
    """Dichtes Gestrüpp: Grasbasis + Buschballen mit Höhe."""
    base_y = TALL_H - TH
    paint_grass_base(img, ox, oy + base_y, variant, details=False)
    rnd = random.Random(SEED + 70 + variant)
    bushes = []
    for _ in range(11):
        u = rnd.uniform(0.16, 0.84)
        v = rnd.uniform(0.16, 0.84)
        bushes.append((u, v, rnd.uniform(14, 22), rnd.uniform(10, 15), rnd.uniform(4, 18)))
    bushes.sort(key=lambda b: b[0] + b[1])  # back to front
    for i, (u, v, rx, ry, lift) in enumerate(bushes):
        sx = (u - v) * (TW / 2) + TW / 2
        sy = (u + v) * (TH / 2) + base_y - lift
        paint_blob(img, ox, oy, sx, sy, rx, ry, BRUSH, 100 + i * 7 + variant,
                   berries=(variant == 1 and i % 3 == 0))
    # ein paar dornige Zweige oben heraus
    pix = img.load()
    for i in range(8):
        u, v, rx, ry, lift = bushes[rnd.randrange(len(bushes))]
        sx = int((u - v) * (TW / 2) + TW / 2)
        sy = int((u + v) * (TH / 2) + base_y - lift - ry)
        for k in range(rnd.randint(6, 10)):
            px, py = sx + (k if i % 2 else -k) // 2, sy - k
            if 0 <= px < TW and 0 <= py < TALL_H:
                pix[px + ox, py + oy] = BRUSH[0] + (255,)


def paint_tree_round(img, ox, oy):
    base_y = TALL_H - TH
    gx, gy = TW // 2, base_y + TH // 2
    blit_shadow(img, ox + gx, oy + gy + 4, 28, 10)
    pix = img.load()
    # Stamm
    for yy in range(gy - 52, gy + 1):
        w = 5 + (3 if gy - yy < 10 else 0) + (2 if gy - yy < 4 else 0)
        for xx in range(gx - w // 2 - 1, gx + w // 2 + 1):
            t = 0.35 + (xx - gx) * 0.14 + (hash01(xx, yy, 120) - 0.5) * 0.4
            pix[ox + xx, oy + yy] = ramp(TRUNK, clamp(t, 0, 0.99), xx, yy) + (255,)
    # Krone aus überlappenden Kugeln
    cx, cy = gx, gy - 84
    blobs = [(0, 4, 36, 28), (-24, 16, 24, 20), (24, 16, 24, 20),
             (-16, -18, 22, 18), (18, -16, 22, 18)]
    for i, (dx, dy, rx, ry) in enumerate(blobs):
        paint_blob(img, ox, oy, cx + dx, cy + dy, rx, ry, LEAF, 130 + i * 3)
    # Blüten-Tupfer (hell & freundlich)
    rnd = random.Random(SEED + 77)
    for _ in range(16):
        px = cx + rnd.randint(-26, 26)
        py = cy + rnd.randint(-18, 20)
        cur = pix[ox + px, oy + py]
        if cur[3] == 255 and cur[:3] in LEAF:
            pix[ox + px, oy + py] = (255, 192, 208, 255)
            if pix[ox + px + 1, oy + py][3] == 255 and pix[ox + px + 1, oy + py][:3] in LEAF:
                pix[ox + px + 1, oy + py] = (255, 214, 224, 255)


def paint_tree_pine(img, ox, oy):
    base_y = TALL_H - TH
    gx, gy = TW // 2, base_y + TH // 2
    blit_shadow(img, ox + gx, oy + gy + 4, 24, 10)
    pix = img.load()
    for yy in range(gy - 16, gy + 1):
        for xx in range(gx - 2, gx + 3):
            pix[ox + xx, oy + yy] = TRUNK[1] + (255,)
    tiers = [(gy - 116, 16, 32), (gy - 88, 24, 36), (gy - 56, 32, 40)]
    for ti, (apex_y, hw, hgt) in enumerate(tiers):
        for yy in range(apex_y, apex_y + hgt):
            frac = (yy - apex_y) / hgt
            w = hw * frac
            jag = (hash01(yy, ti, 140) - 0.5) * 6 if frac > 0.75 else 0
            for xx in range(int(gx - w - jag), int(gx + w + jag) + 1):
                t = 0.42 + (xx - gx) / max(w * 2, 1) * 0.7 - frac * 0.25
                t += (fbm(xx / 26.0, yy / 26.0) - 0.5) * 0.3
                if 0 <= xx < TW and 0 <= yy < TALL_H:
                    pix[ox + xx, oy + yy] = ramp(PINE, clamp(t, 0, 0.99), xx, yy) + (255,)


# ------------------------------------------------------------ Atlas-Layout
CORNERS = ["NE", "SE", "SW", "NW"]

GROUND_TILES = []  # (col, row, name, painter, terrain, cost, walkable)


def _reg(col, row, name, painter, terrain, cost, walkable):
    GROUND_TILES.append((col, row, name, painter, terrain, cost, walkable))


def build_ground_layout():
    _reg(0, 0, "GRASS_A", lambda i, x, y: paint_grass_base(i, x, y, 0), "grass", 1, True)
    _reg(1, 0, "GRASS_B", lambda i, x, y: paint_grass_base(i, x, y, 1), "grass", 1, True)
    _reg(2, 0, "GRASS_FLOWERS_A",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: grass_flowers_at(u, v, px, py, 0)),
         "grass", 1, True)
    _reg(3, 0, "GRASS_FLOWERS_B",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: grass_flowers_at(u, v, px, py, 1)),
         "grass", 1, True)
    _reg(4, 0, "SAND_A",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: sand_at(u, v, px, py, 0)),
         "sand", 1, True)
    _reg(5, 0, "SAND_B",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: sand_at(u, v, px, py, 1)),
         "sand", 1, True)
    _reg(6, 0, "DIRT", lambda i, x, y: paint_ground(i, x, y, dirt_at), "dirt", 1, True)
    _reg(7, 0, "FIELD", lambda i, x, y: paint_ground(i, x, y, field_at), "dirt", 1, True)

    for mask in range(16):
        col, row = mask % 8, 1 + mask // 8
        _reg(col, row, f"RIVER_{mask}",
             (lambda m: lambda i, x, y: paint_ground(
                 i, x, y, lambda u, v, px, py: river_at(m, u, v, px, py)))(mask),
             "water", 0, False)

    for mask in range(16):
        col, row = mask % 8, 3 + mask // 8
        _reg(col, row, f"ROAD_{mask}",
             (lambda m: lambda i, x, y: paint_ground(
                 i, x, y, lambda u, v, px, py: road_at(m, u, v, px, py)))(mask),
             "road", 1, True)

    for idx, side in enumerate(["N", "E", "S", "W"]):
        _reg(idx, 5, f"LAKE_EDGE_{side}",
             (lambda k: lambda i, x, y: paint_ground(
                 i, x, y, lambda u, v, px, py: shore_color(
                     lake_field(k, u, v), u, v, px, py, grass_at)))(("edge", side)),
             "water", 0, False)
    for idx, cor in enumerate(CORNERS):
        _reg(4 + idx, 5, f"LAKE_OUT_{cor}",
             (lambda k: lambda i, x, y: paint_ground(
                 i, x, y, lambda u, v, px, py: shore_color(
                     lake_field(k, u, v), u, v, px, py, grass_at)))(("outer", cor)),
             "water", 0, False)
    for idx, cor in enumerate(CORNERS):
        _reg(idx, 6, f"LAKE_IN_{cor}",
             (lambda k: lambda i, x, y: paint_ground(
                 i, x, y, lambda u, v, px, py: shore_color(
                     lake_field(k, u, v), u, v, px, py, grass_at)))(("inner", cor)),
             "water", 0, False)
    _reg(4, 6, "WATER_FULL",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: water_at(u, v, px, py, 0.7)),
         "water", 0, False)
    _reg(5, 6, "WATER_DEEP",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: water_at(u, v, px, py, 1.0)),
         "water", 0, False)
    _reg(6, 6, "WATER_LILY", lambda i, x, y: paint_ground(i, x, y, water_lily_at),
         "water", 0, False)
    _reg(7, 6, "WATER_ROCKS", lambda i, x, y: paint_ground(i, x, y, water_rocks_at),
         "water", 0, False)

    _reg(0, 7, "BRIDGE_EW", lambda i, x, y: paint_bridge(i, x, y, True), "bridge", 1, True)
    _reg(1, 7, "BRIDGE_NS", lambda i, x, y: paint_bridge(i, x, y, False), "bridge", 1, True)
    _reg(2, 7, "FORD_EW",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: ford_at(u, v, px, py, True)),
         "ford", 2, True)
    _reg(3, 7, "FORD_NS",
         lambda i, x, y: paint_ground(i, x, y, lambda u, v, px, py: ford_at(u, v, px, py, False)),
         "ford", 2, True)


TALL_TILES = [
    (0, 0, "MOUNTAIN_A", lambda i, x, y: paint_mountain(i, x, y, False, 0), "mountain", 0, False),
    (1, 0, "MOUNTAIN_SNOW", lambda i, x, y: paint_mountain(i, x, y, True, 1), "mountain", 0, False),
    (2, 0, "CLIFF", lambda i, x, y: paint_cliff(i, x, y), "cliff", 1, True),
    (3, 0, "BOULDER", lambda i, x, y: paint_boulder(i, x, y), "boulder", 0, False),
    (0, 1, "SCRUB_A", lambda i, x, y: paint_scrub(i, x, y, 0), "brush", 2, True),
    (1, 1, "SCRUB_B", lambda i, x, y: paint_scrub(i, x, y, 1), "brush", 2, True),
    (2, 1, "TREE_ROUND", lambda i, x, y: paint_tree_round(i, x, y), "tree", 0, False),
    (3, 1, "TREE_PINE", lambda i, x, y: paint_tree_pine(i, x, y), "tree", 0, False),
]


# ------------------------------------------------ Feld-Funktionstypen (§5.1)
# Leitet die 8 Feld-Funktionstypen + Bewegungsdaten aus dem terrain-Tag ab.
# WICHTIG: field_type/conceals/destructible/hp sind INTRINSISCH (pro Atlas-Tile).
# flow_dir (Fluss-Richtung) und effect_id (Effekt-Feld-Nutzlast) sind dagegen
# PRO ZELLE und gehören in die Map-/Chunk-Daten, nicht in den Tileset (s. §10.1).
# Deckung/Blockade/Effekt-Feld haben in Tileset v1 noch keine eigene Kachel-Optik —
# folgen als neue Painter/Atlas-Slots (Custom-Data-Schema steht hier bereits bereit).
FIELD_PROPS = {
    # terrain:    (field_type, move_cost, walkable, conceals, destructible, hp)
    "grass":    ("boden",    1.0, True,  False, False, 0),
    "sand":     ("boden",    1.0, True,  False, False, 0),
    "dirt":     ("boden",    1.0, True,  False, False, 0),
    "road":     ("pfad",     0.5, True,  False, False, 0),
    "bridge":   ("boden",    1.0, True,  False, False, 0),
    "ford":     ("dickicht", 1.5, True,  False, False, 0),
    "brush":    ("dickicht", 1.5, True,  False, False, 0),
    "water":    ("fluss",    0.0, False, False, False, 0),
    "mountain": ("barriere", 0.0, False, False, False, 0),
    "cliff":    ("boden",    1.0, True,  False, False, 0),
    "boulder":  ("barriere", 0.0, False, False, False, 0),
    "tree":     ("barriere", 0.0, False, False, False, 0),
}


def field_props(terrain):
    return FIELD_PROPS.get(terrain, ("boden", 1.0, True, False, False, 0))


def custom_data_lines(key, terrain):
    ftype, cost, walkable, conceals, destr, hp = field_props(terrain)
    return [
        f'{key}/custom_data_0 = "{terrain}"',
        f"{key}/custom_data_1 = {cost}",
        f"{key}/custom_data_2 = {str(walkable).lower()}",
        f'{key}/custom_data_3 = "{ftype}"',
        f"{key}/custom_data_4 = {str(conceals).lower()}",
        f"{key}/custom_data_5 = {str(destr).lower()}",
        f"{key}/custom_data_6 = {hp}",
    ]


# ---------------------------------------------------------------- Ausgabe
def render_atlases():
    ground = Image.new("RGBA", (GROUND_COLS * TW, GROUND_ROWS * TH), (0, 0, 0, 0))
    for col, row, name, painter, *_ in GROUND_TILES:
        painter(ground, col * TW, row * TH)
    tall = Image.new("RGBA", (TALL_COLS * TW, TALL_ROWS * TALL_H), (0, 0, 0, 0))
    for col, row, name, painter, *_ in TALL_TILES:
        tile = Image.new("RGBA", (TW, TALL_H), (0, 0, 0, 0))
        painter(tile, 0, 0)
        tall.paste(tile, (col * TW, row * TALL_H))
    if SCALE != 1:
        ground = ground.resize((ground.width * SCALE, ground.height * SCALE), Image.NEAREST)
        tall = tall.resize((tall.width * SCALE, tall.height * SCALE), Image.NEAREST)
    return ground, tall


def write_tres():
    lines = []
    lines.append('[gd_resource type="TileSet" load_steps=5 format=3]')
    lines.append("")
    lines.append('[ext_resource type="Texture2D" path="res://assets/tiles/terrain_ground.png" id="1_ground"]')
    lines.append('[ext_resource type="Texture2D" path="res://assets/tiles/terrain_tall.png" id="2_tall"]')
    lines.append("")
    lines.append('[sub_resource type="TileSetAtlasSource" id="TileSetAtlasSource_ground"]')
    lines.append('texture = ExtResource("1_ground")')
    lines.append(f"texture_region_size = Vector2i({TW * SCALE}, {TH * SCALE})")
    for col, row, name, painter, terrain, cost, walkable in GROUND_TILES:
        key = f"{col}:{row}/0"
        lines.append(f"{key} = 0")
        lines.extend(custom_data_lines(key, terrain))
    lines.append("")
    lines.append('[sub_resource type="TileSetAtlasSource" id="TileSetAtlasSource_tall"]')
    lines.append('texture = ExtResource("2_tall")')
    lines.append(f"texture_region_size = Vector2i({TW * SCALE}, {TALL_H * SCALE})")
    origin_y = (TALL_H - TH) * SCALE // 2 + (TH * SCALE) // 2  # (192-64)/2 = 64
    for col, row, name, painter, terrain, cost, walkable in TALL_TILES:
        key = f"{col}:{row}/0"
        lines.append(f"{key} = 0")
        lines.append(f"{key}/texture_origin = Vector2i(0, {origin_y})")
        lines.extend(custom_data_lines(key, terrain))
    lines.append("")
    lines.append("[resource]")
    lines.append("tile_shape = 1")
    lines.append("tile_layout = 5")
    lines.append(f"tile_size = Vector2i({TW * SCALE}, {TH * SCALE})")
    lines.append('custom_data_layer_0/name = "terrain"')
    lines.append("custom_data_layer_0/type = 4")
    lines.append('custom_data_layer_1/name = "move_cost"')
    lines.append("custom_data_layer_1/type = 3")  # float (0,5 / 1,0 / 1,5)
    lines.append('custom_data_layer_2/name = "walkable"')
    lines.append("custom_data_layer_2/type = 1")
    lines.append('custom_data_layer_3/name = "field_type"')
    lines.append("custom_data_layer_3/type = 4")
    lines.append('custom_data_layer_4/name = "conceals"')
    lines.append("custom_data_layer_4/type = 1")
    lines.append('custom_data_layer_5/name = "destructible"')
    lines.append("custom_data_layer_5/type = 1")
    lines.append('custom_data_layer_6/name = "hp"')
    lines.append("custom_data_layer_6/type = 2")
    lines.append('sources/0 = SubResource("TileSetAtlasSource_ground")')
    lines.append('sources/1 = SubResource("TileSetAtlasSource_tall")')
    lines.append("")
    return "\n".join(lines)


def write_tile_ids():
    lines = []
    lines.append("## Automatisch generiert von tools/generate_tileset.py — nicht von Hand editieren.")
    lines.append("## Atlas-Koordinaten aller Terrain-Tiles + Verbindungsmasken (N=1, E=2, S=4, W=8).")
    lines.append("class_name TileIds")
    lines.append("")
    lines.append("const GROUND_SRC := 0")
    lines.append("const TALL_SRC := 1")
    lines.append("")
    river, road = {}, {}
    for col, row, name, *_ in GROUND_TILES:
        if name.startswith("RIVER_"):
            river[int(name.split("_")[1])] = (col, row)
        elif name.startswith("ROAD_"):
            road[int(name.split("_")[1])] = (col, row)
        else:
            lines.append(f"const {name} := Vector2i({col}, {row})")
    for col, row, name, *_ in TALL_TILES:
        lines.append(f"const {name} := Vector2i({col}, {row})")
    lines.append("")
    lines.append("## Index = Bitmaske der Verbindungen (N=1, E=2, S=4, W=8)")
    lines.append("const RIVER: Array[Vector2i] = [")
    lines.append("\t" + ", ".join(f"Vector2i({river[m][0]}, {river[m][1]})" for m in range(16)) + ",")
    lines.append("]")
    lines.append("const ROAD: Array[Vector2i] = [")
    lines.append("\t" + ", ".join(f"Vector2i({road[m][0]}, {road[m][1]})" for m in range(16)) + ",")
    lines.append("]")
    lines.append("")
    return "\n".join(lines)


def main():
    build_ground_layout()
    os.makedirs(OUT_TILES, exist_ok=True)
    os.makedirs(OUT_SCRIPTS, exist_ok=True)
    ground, tall = render_atlases()
    ground.save(os.path.join(OUT_TILES, "terrain_ground.png"))
    tall.save(os.path.join(OUT_TILES, "terrain_tall.png"))
    with open(os.path.join(OUT_TILES, "terrain_tileset.tres"), "w") as f:
        f.write(write_tres())
    with open(os.path.join(OUT_SCRIPTS, "tile_ids.gd"), "w") as f:
        f.write(write_tile_ids())
    print(f"OK: {len(GROUND_TILES)} Boden-Tiles, {len(TALL_TILES)} hohe Tiles.")


if __name__ == "__main__":
    main()
