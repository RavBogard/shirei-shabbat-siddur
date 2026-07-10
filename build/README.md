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

Editing rules of thumb (each earned the hard way — see also FORK-YOUR-OWN.md §7):
1. **Small surgical Edits over whole-file rewrites.** With git, review by `git diff`, not by re-reading files.
2. **Commit after every verified wave** (compile clean → commit). Corruption from the
   Windows↔Linux mount lag now shows up instantly in `git status`/`git diff` instead of a
   byte-level scan ritual.
3. **One agent at a time in `typst/content/`** — the concurrency ban stands; git makes
   violations detectable, not safe.
4. **`bash build/check.sh` before declaring any edit wave done.**
   On Daniel's Windows machine the vendored typst is Linux-only — Code runs the gate
   through WSL: `wsl -e bash -c 'cd /mnt/c/Users/dsbog/shireishabbat && bash build/check.sh'`.
   Session-start habit for the committing surface: `git fsck --no-dangling` (seconds;
   the July-7 index corruption would have been caught before a repair commit was needed).
5. Page spot-checks: `/tmp/typst-bin/typst compile --font-path build/fonts --format png --ppi 100 typst/shirei-shabbat-FULL.typ "/tmp/out-{p}.png"` then view the relevant pages only.

### Volumes, CI matrix, and release tags (AR-5, 2026-07-09)

The set of books this repo builds is declared **once** in `build/volumes.json` — one
object per volume (`slug`, build-relative `entry`, output `pdf`, `title`/`title_he`,
`blurb`, `tag_prefix`). Everything fans out over it:

- **`build/check.sh`** compiles every volume in the list, printing per-volume page
  count + wall-clock. Adding a book = one JSON entry; no script edit.
- **`.github/workflows/build-siddur.yml`** reads `volumes.json` in a `volumes` job and
  runs `build` / `pages` / `release` as a matrix over it. Pages publishes a multi-book
  landing page (one card per volume); artifacts are named `<slug>-<sha>`.
- **Release tags are book-scoped: `<tag_prefix>-v<version>`** (e.g. `shabbat-v1.1`).
  The tag's prefix (everything before `-v`) selects the volume via its `tag_prefix`
  field; the release PDF is named `<Title>-<tag>.pdf`. (This supersedes the old
  bare `v*` tag scheme — a plain `v1.2` no longer triggers a release.)
- **`publish-kit/build-siddur.yml` must stay identical to the live workflow.** The
  scaling audit flagged it as a drifting duplicate; it is now a verbatim copy. If you
  change the live workflow, `cp .github/workflows/build-siddur.yml publish-kit/` in the
  same commit. (`publish-kit/`'s other files are the curated public snapshot, synced
  separately — Code-only — and are NOT auto-tracked.)

> Note: the GitHub Action (matrix, Pages, Releases) can only be exercised on a real
> push — `check.sh` verifies the compile locally, but the CI wiring is confirmed by
> the first push that runs it.

### Distribution forms — one command (2026-07-10)

Every volume ships in **two forms**, produced by one command:

```bash
bash build/build-pdfs.sh   # → dist/<pdf> (screen 7×10) + dist/<pdf>-print-letter.pdf (US Letter + crop marks)
```

- **screen** — the true-trim PDF from Typst, for reading / a print shop.
- **letter** — that PDF centered on US Letter with corner crop marks and a duplex
  caption, for double-sided home printing (`build/impose_letter.py`; trim is read
  from each page's mediabox, so it is volume-agnostic; centered ⇒ front/back align
  for cutting).

The Letter filename is **derived** — `<pdf>` → `<pdf-without-.pdf>-print-letter.pdf`
— so `volumes.json` stays a minimal one-line-per-book registry. `build-pdfs.sh` is
what CI runs (build → artifact, pages → landing-page buttons, release → both
attached); `check.sh` remains the fast integrity gate. Imposition needs `pypdf` +
`reportlab` (auto-installed); the Typst compile itself stays vendored/zero-network.
Design spec: `docs/superpowers/specs/2026-07-10-multi-form-pdf-build-design.md`.

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
