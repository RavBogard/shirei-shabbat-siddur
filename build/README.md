# Build pipeline — Shirei Shabbat Siddur

## CURRENT WORKFLOW (2026-07-05 — read this section, the pipeline below it is retired)

The `.typ` files in `typst/` and `typst/content/` are **canonical** (Daniel, 2026-07-05); the
md→typ pipeline described further down is retired from the critical path. The project is now a
**git repo** (initialized 2026-07-05 at the v6 snapshot) and the toolchain is **vendored** —
no network needed in a fresh sandbox:

```bash
bash build/setup.sh    # unpacks the vendored typst 0.13.1 to /tmp/typst-bin; fonts live in build/fonts
bash build/check.sh    # NUL scan + git status + clean full-book compile with page count
/tmp/typst-bin/typst compile --font-path build/fonts build/typst/shirei-shabbat-FULL.typ out.pdf
```

Editing rules of thumb (each earned the hard way — see StartHere.md gotchas):
1. **Small surgical Edits over whole-file rewrites.** With git, review by `git diff`, not by re-reading files.
2. **Commit after every verified wave** (compile clean → commit). Corruption from the
   Windows↔Linux mount lag now shows up instantly in `git status`/`git diff` instead of a
   byte-level scan ritual.
3. **One agent at a time in `typst/content/`** — the concurrency ban stands; git makes
   violations detectable, not safe.
4. **`bash build/check.sh` before declaring any edit wave done.**
5. Page spot-checks: `/tmp/typst-bin/typst compile --font-path build/fonts --format png --ppi 100 typst/shirei-shabbat-FULL.typ "/tmp/out-{p}.png"` then view the relevant pages only.

---

## RETIRED pipeline (kept for the record)

Single source → two typesetting engines. Content lives in `../content/*.md` (one prayer per file).
A Python generator turns that into Typst and XeLaTeX source; each engine renders proof PDFs into
`../proofs/`.

## One command

```bash
bash build/build_all.sh
```

Produces, in `proofs/`, dated PDFs for both engines (Typst + XeLaTeX), both trims (6×9, 7×10),
two Hebrew fonts (David Libre, Frank Ruehl CLM), the font-comparison sheet, and Letter
home-print impositions.

## Pieces

- `emit.py` — parses `content/*.md` → `units.json` (shared intermediate).
- `emit_typ.py` — `units.json` → `typst/content_*.typ` + `typst/main_*.typ`.
- `emit_tex.py` — `units.json` → `latex/content.tex` + `latex/main_*.tex`.
- `typst/siddur.typ` — Typst template (page, sidebar, footnotes, two-column unit).
- `latex/siddur.tex` — XeLaTeX preamble (geometry, RTL via TeX-XeT `\beginR`/`\endR`, sidebar via eso-pic, footnotes).
- `typst/fontsample.typ` — Hebrew font comparison sheet.
- `impose_letter.py` — centers each trim page on US Letter with crop marks for home printing.

## Toolchain / environment notes

- **Typst** 0.15 (installed to `~/.local/bin`). Compile with `--font-path ~/.fonts`.
- **XeLaTeX** from the system TeX Live. Hebrew RTL uses TeX-XeT primitives because the
  `bidi`/`polyglossia` packages are not installable here (TeX Live 2021 vs. 2026 repo). Set
  `OSFONTDIR=~/.fonts` so it finds the fonts.
- **Fonts** in `~/.fonts`: David Libre, Frank Ruehl CLM, Ezra SIL, Keter YG, David CLM, Shofar
  (Hebrew); Libertinus Serif (English). SBL Hebrew was not obtainable (host unreachable).

Recommendation from the spike (`proofs/2026-07-03-spike-notes.md`): **Typst** as the primary
engine; XeLaTeX kept as a fallback since both come free from the same content source.
