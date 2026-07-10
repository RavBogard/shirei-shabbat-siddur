#!/usr/bin/env python3
import re, glob, os, json

CONTENT = "/sessions/stoic-exciting-heisenberg/mnt/MavenAI/siddur-project/content"

def parse_file(path):
    raw = open(path, encoding="utf-8").read()
    parts = raw.split("---")
    fm = parts[1]
    body = "---".join(parts[2:])
    meta = {}
    for line in fm.strip().splitlines():
        m = re.match(r"^(\w+):\s*(.*)$", line)
        if m:
            meta[m.group(1)] = m.group(2).strip().strip('"')
    # title from first '# '
    title_en, title_he = "", ""
    for line in body.splitlines():
        m = re.match(r"^#\s+(.*)$", line)
        if m:
            t = m.group(1)
            if "·" in t:
                title_en, title_he = [x.strip() for x in t.split("·",1)]
            else:
                title_en = t.strip()
            break
    # sections
    secs = {}
    cur = None
    for line in body.splitlines():
        m = re.match(r"^##\s+(\w+)", line)
        if m:
            cur = m.group(1); secs[cur] = []
            continue
        if re.match(r"^#\s+", line):
            continue
        if cur is not None:
            secs[cur].append(line)
    def blocks(name):
        """Return list of {label, lines:[...]} for hebrew/translit sections."""
        out = []
        cur_lbl = None; cur_lines = []
        for line in secs.get(name, []):
            m = re.match(r"^###\s+(.*)$", line)
            if m:
                if cur_lines or cur_lbl is not None:
                    out.append({"label": cur_lbl, "lines": cur_lines})
                cur_lbl = m.group(1).strip(); cur_lines = []
            elif line.strip():
                cur_lines.append(line.strip())
        if cur_lines or cur_lbl is not None:
            out.append({"label": cur_lbl, "lines": cur_lines})
        return [b for b in out if b["lines"] or b["label"]]
    # translation paragraphs
    trans = []
    para = "\n".join(secs.get("translation", []))
    for chunk in re.split(r"\n\s*\n", para):
        chunk = chunk.strip()
        if not chunk: continue
        lbl = None
        mm = re.match(r"^\*\*(.+?):\*\*\s*(.*)$", chunk, re.S)
        if mm:
            lbl = mm.group(1).strip(); chunk = mm.group(2).strip()
        chunk = chunk.strip().strip("*").strip()
        trans.append({"label": lbl, "text": chunk})
    # kavanah
    kav = " ".join(x.strip() for x in secs.get("kavanah", []) if x.strip())
    # commentary
    comm = []
    for line in secs.get("commentary", []):
        m = re.match(r"^-\s+(.*)$", line)
        if m:
            t = m.group(1).strip()
            if t.lower().startswith("(none"): continue
            t = t.lstrip("°").strip()
            t = re.sub(r"\s*\*\[.*?\]\*\s*$", "", t)  # drop the spike-sample tag for footnote body
            t = re.sub(r"\*(.+?)\*", r"\1", t)  # flatten markdown emphasis (sample commentary)
            comm.append(t)
    return {
        "meta": meta, "title_en": title_en, "title_he": title_he,
        "kavanah": kav, "hebrew": blocks("hebrew"), "translit": blocks("translit"),
        "translation": trans, "commentary": comm,
    }

files = sorted(glob.glob(os.path.join(CONTENT, "[0-9]*.md")))
units = [parse_file(f) for f in files]
json.dump(units, open("units.json","w"), ensure_ascii=False, indent=1)
print("parsed", len(units), "units")
