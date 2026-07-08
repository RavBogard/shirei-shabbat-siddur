import json
units = json.load(open("units.json"))
units.sort(key=lambda u: int(u["meta"].get("order", 0)))
def s(x): return '"' + str(x).replace("\\","\\\\").replace('"','\\"') + '"'
def zip_blocks(u):
    rows=[]; hb,tr=u["hebrew"],u["translit"]; n=max(len(hb),len(tr))
    for i in range(n):
        hbk=hb[i] if i<len(hb) else {"label":None,"lines":[]}
        trk=tr[i] if i<len(tr) else {"label":None,"lines":[]}
        label=hbk.get("label") or trk.get("label")
        hl,tl=hbk["lines"],trk["lines"]; m=max(len(hl),len(tl)); pairs=[]
        for j in range(m):
            pairs.append({"he":hl[j] if j<len(hl) else "","tr":tl[j] if j<len(tl) else ""})
        rows.append({"label":label,"pairs":pairs})
    return rows

def emit_content(font):
    out=['#import "siddur.typ": unit','']
    for u in units:
        rows=zip_blocks(u); L=['#unit(']
        L.append(f'  order: {int(u["meta"].get("order",0))},')
        L.append(f'  title-en: {s(u["title_en"])},')
        L.append(f'  title-he: {s(u["title_he"])},')
        L.append(f'  kavanah: {s(u["kavanah"])},')
        L.append('  rows: (')
        for b in rows:
            lbl=s(b["label"]) if b["label"] else "none"
            L.append(f'    (label: {lbl}, pairs: (')
            for pr in b["pairs"]:
                L.append(f'      (tr: {s(pr["tr"])}, he: {s(pr["he"])}),')
            L.append('    )),')
        L.append('  ),')
        L.append('  translation: (')
        for t in u["translation"]:
            lbl=s(t["label"]) if t["label"] else "none"
            L.append(f'    (label: {lbl}, text: {s(t["text"])}),')
        L.append('  ),')
        L.append('  commentary: (')
        for c in u["commentary"]: L.append(f'    {s(c)},')
        L.append('  ),')
        L.append(f'  hebrew-font: {s(font)},')
        L.append(')')
        out.append("\n".join(L)); out.append('')
    return "\n".join(out)

for font,tag in [("David Libre","david"),("Frank Ruehl CLM","frank"),("Ezra SIL","ezra")]:
    open(f"typst/content_{tag}.typ","w",encoding="utf-8").write(emit_content(font))
    for size in ["6x9","7x10"]:
        main=f'''#import "siddur.typ": siddur
#show: doc => siddur(size: "{size}", hebrew-font: "{font}", doc)
#include "content_{tag}.typ"
'''
        open(f"typst/main_{size}_{tag}.typ","w",encoding="utf-8").write(main)
print("regenerated content + main files")
