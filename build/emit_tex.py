import json
units = json.load(open("units.json"))
units.sort(key=lambda u: int(u["meta"].get("order", 0)))

def esc(x):
    x = str(x)
    x = x.replace("\\", r"\textbackslash{}")
    for a, b in [("&", r"\&"), ("%", r"\%"), ("$", r"\$"), ("#", r"\#"),
                 ("_", r"\_"), ("{", r"\{"), ("}", r"\}"), ("~", r"\textasciitilde{}"),
                 ("^", r"\textasciicircum{}")]:
        x = x.replace(a, b)
    return x

def zip_blocks(u):
    rows = []; hb, tr = u["hebrew"], u["translit"]; n = max(len(hb), len(tr))
    for i in range(n):
        hbk = hb[i] if i < len(hb) else {"label": None, "lines": []}
        trk = tr[i] if i < len(tr) else {"label": None, "lines": []}
        label = hbk.get("label") or trk.get("label")
        hl, tl = hbk["lines"], trk["lines"]; m = max(len(hl), len(tl)); pairs = []
        for j in range(m):
            pairs.append((tl[j] if j < len(tl) else "", hl[j] if j < len(hl) else ""))
        rows.append({"label": label, "pairs": pairs})
    return rows

out = []
for idx, u in enumerate(units):
    rows = zip_blocks(u)
    comm = u["commentary"]
    title_en = esc(u["title_en"])
    if comm:
        title_en += r"\protect\footnote{" + esc(comm[0]) + "}"
    out.append(f"\\unittitle{{{title_en}}}{{{u['title_he']}}}")
    if u["kavanah"]:
        out.append(f"\\kav{{{esc(u['kavanah'])}}}")
    for b in rows:
        if b["label"]:
            out.append(f"\\seclabel{{{esc(b['label'])}}}")
        out.append("\\begin{hebtwocol}")
        for tl, hl in b["pairs"]:
            out.append(f"\\trow{{{esc(tl)}}}{{{hl}}}")
        out.append("\\end{hebtwocol}")
        out.append("\\vspace{4pt}")
    out.append("\\translationrule")
    for t in u["translation"]:
        lbl = esc(t["label"]) if t["label"] else ""
        out.append(f"\\transline{{{lbl}}}{{{esc(t['text'])}}}")
    for c in comm[1:]:
        out.append("\\footnote{" + esc(c) + "}")
    if idx != len(units) - 1:
        out.append("\\unitsep")
    out.append("")

open("latex/content.tex", "w", encoding="utf-8").write("\n".join(out))
print("wrote latex/content.tex")

FONTS = [("David Libre", "david"), ("Frank Ruehl CLM", "frank"), ("Ezra SIL", "ezra")]
for size in ["6x9", "7x10"]:
    for font, tag in FONTS:
        main = (
            "\\documentclass{article}\n"
            f"\\def\\TRIM{{{size}}}\n"
            f"\\def\\HEBREWFONT{{{font}}}\n"
            "\\input{siddur.tex}\n"
            "\\begin{document}\n"
            "\\raggedright\n"
            "\\input{content.tex}\n"
            "\\end{document}\n"
        )
        open(f"latex/main_{size}_{tag}.tex", "w", encoding="utf-8").write(main)
print("wrote latex main files")
