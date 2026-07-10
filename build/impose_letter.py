#!/usr/bin/env python3
"""Center each trim page on US Letter with corner crop marks, for double-sided
home printing: trim is centered on the sheet so front/back align for cutting."""
import sys, io
from pypdf import PdfReader, PdfWriter, PageObject
from reportlab.pdfgen import canvas

LETTER_W, LETTER_H = 612.0, 792.0

def crop_overlay(x, y, w, h):
    buf = io.BytesIO()
    c = canvas.Canvas(buf, pagesize=(LETTER_W, LETTER_H))
    c.setLineWidth(0.4); c.setStrokeColorRGB(0.4, 0.4, 0.4)
    m, g = 16, 6
    for (cx, cy, dx, dy) in [(x,y,-1,-1),(x+w,y,1,-1),(x,y+h,-1,1),(x+w,y+h,1,1)]:
        c.line(cx+dx*g, cy, cx+dx*(g+m), cy)
        c.line(cx, cy+dy*g, cx, cy+dy*(g+m))
    c.setFont("Helvetica", 7); c.setFillColorRGB(0.5,0.5,0.5)
    c.drawString(x, y-26, f"Shirei Shabbat — trim {w/72:.0f}×{h/72:.0f} in — print double-sided (flip on long edge) at 100% (actual size), cut on the marks")
    c.save(); buf.seek(0)
    return PdfReader(buf).pages[0]

def main(src, dst):
    r = PdfReader(src); w = PdfWriter()
    for p in r.pages:
        tw = float(p.mediabox.width); th = float(p.mediabox.height)
        x = (LETTER_W-tw)/2; y = (LETTER_H-th)/2
        base = PageObject.create_blank_page(width=LETTER_W, height=LETTER_H)
        base.merge_translated_page(p, x, y, expand=False)
        base.merge_page(crop_overlay(x, y, tw, th))
        w.add_page(base)
    with open(dst, "wb") as f:
        w.write(f)
    print("wrote", dst)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
