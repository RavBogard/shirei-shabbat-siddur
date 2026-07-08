# CLAUDE.md — start here

This repository is **Shirei Shabbat**, a complete, sung Friday-night (Kabbalat
Shabbat + Ma'ariv) siddur by Rabbi Daniel Bogard of Central Reform Congregation,
St. Louis — a real congregation's working prayerbook, published so other communities
can fork it and make their own. It is a single Typst project: fully pointed Hebrew,
transliteration beside every line, fresh English translations, teaching footnotes,
and a wayfinding margin system (an accordion "rail," fore-edge staircase tabs, gold
convergence lines, and embodied "ritual marks"). Everything needed to build the PDF
is vendored in the repo — no network required. If a human just told you *"I want to
create my own version of a siddur based on this repository"*, jump to
**The customization interview** below: interview first, edit second.

## Repo map — what is canonical

| Path | What it is |
|---|---|
| `build/typst/shirei-shabbat-FULL.typ` | **The book.** The service order: front matter, four section openers, `#include`s of every content file, back matter. Compile this. |
| `build/typst/book.typ` | **The template.** Palette, geometry, the `UNITS` registry + `ALIASES`, the `CAPTIONS` dict, the rail, and every helper (`startprayer`, `stanza`, `eng`/`engn`, `chatimah`, `ritual`, `seasonal`, `submark`…). |
| `build/typst/content/*.typ` | **The canonical prayer sources**, one file per stretch of the service (see the annotated map in `FORK-YOUR-OWN.md`). These files + `book.typ` + `shirei-shabbat-FULL.typ` are the entire live surface. |
| `build/typst/content/frontmatter.typ` | Title page, welcome page, "How to use this siddur" spread. **First thing to personalize.** |
| `build/typst/content/mi-shebeirach-placeholder.typ` | Public healing-prayer unit. The Friedman/Setel setting used at CRC is copyrighted and **not in this repo** — see `FORK-YOUR-OWN.md`. |
| `liturgy-map/` | The **why-record**. `DECISIONS-LOG.md` logs every liturgical ruling ("Claude records; Claude does not decide" — keep that discipline in the fork). `CAPTIONS.md` is the **source of truth for rail captions**: edit it first, then re-wire the `CAPTIONS` dict in `book.typ` — never edit the dict alone. Also `RITUAL-MARKS.md`, `CONVERGENCE-MAP.md`, `CHOREOGRAPHY-MAP.md`, `HOWTO-COPY.md`, `STYLE-DECISIONS.md`. |
| `01_STYLE_GUIDE.md` | The **voice bible** — translation voice, transliteration scheme, Hebrew conventions. Every new line of English must be indistinguishable from the existing voice (or from the fork-owner's revised voice, once they define one). |
| `build/fonts/`, `build/tools/` | Vendored OFL fonts and the Typst 0.13.1 binary tarball. Do not edit. |
| Everything else under `build/` | **Retired.** `build/latex/`, `emit*.py`, `units.json`, `main_*_*.typ`, `content_*.typ`, `siddur.typ`, `showcase*/nav*` files, `content/*.md` at the repo root — an earlier md→typ pipeline and design experiments, kept for the record. Reference only; never edit or build from them. |

## How to build

Zero-network, vendored toolchain (Linux/macOS shell; on Windows use WSL or the Action):

```bash
bash build/setup.sh    # once per machine/sandbox: unpacks vendored Typst 0.13.1 to /tmp/typst-bin
bash build/check.sh    # the gate: NUL-byte scan + git status + clean full-book compile with page count
/tmp/typst-bin/typst compile --font-path build/fonts build/typst/shirei-shabbat-FULL.typ out.pdf
```

- Run `bash build/check.sh` **after every edit wave, before declaring anything done.**
- Page spot-checks: `/tmp/typst-bin/typst compile --font-path build/fonts --format png --ppi 100 build/typst/shirei-shabbat-FULL.typ "/tmp/out-{p}.png"` then view only the relevant pages.
- **GitHub Action:** every push that touches `build/**` compiles the book automatically
  (`.github/workflows/build-siddur.yml`) and uploads the PDF as an artifact — so a fork
  can be edited entirely on github.com and still produce a book.
- Read `build/README.md` before editing content: it records hard-won gotchas
  (surgical `Edit`s over whole-file rewrites; commit after every verified wave; one
  agent at a time in `typst/content/`; the NUL-byte file-corruption failure mode that
  `check.sh` scans for).

## The customization interview

Before editing **anything**, interview the person forking this book. These questions
are the difference between a find-and-replace and a siddur that is actually theirs.
Ask them conversationally, in batches of 3–4, and record every answer as a ruling in
your fork's `liturgy-map/DECISIONS-LOG.md`.

1. **Identity.** Community name, city, rabbi/editor name(s) — and does the book keep
   the name *Shirei Shabbat* or take its own title (English + Hebrew)? (Drives the
   title page in `frontmatter.typ` and the footer wordmark in `book.typ`.)
2. **Movement / denomination.** Reform, Conservative, Reconstructionist, Renewal,
   nondenominational, other? What does that imply for your Hebrew base text? (This
   book's Hebrew follows a Conservative baseline — Lev Shalem-style: full traditional
   text, egalitarian, Sephardi pronunciation.)
3. **God-language in English.** This book's translations avoid "Lord" and "King,"
   degender the divine, and render the Name variously ("HaShem," "the Eternal," "the
   One," intimate "You"). What is *your* practice — Adonai? HaShem? God? Gendered or
   not? "Sovereign" or nothing at all?
4. **Ancestors.** The Amidah here names the matriarchs **and Bilhah and Zilpah**.
   Keep all six mothers, just the four, or the traditional patriarchs-only text?
5. **M'chayeih hakol vs. m'chayeih meitim.** This book prints *both, side by side*
   in G'vurot. Keep the both-text, or choose one?
6. **The service order — walk it.** Read the four section lists (in the `UNITS`
   registry in `book.typ`) aloud with them, unit by unit: which units to keep, cut,
   or add? Common decision points: all six welcoming psalms or fewer? All nine verses
   of L'cha Dodi? Ana B'koach? V'shamru? Me'ein Sheva? Kiddush inside the service or
   at the back?
7. **Mi Shebeirach — must be resolved.** The repo ships a placeholder because the
   Friedman/Setel setting is copyrighted. Will they license it, use another setting,
   write their own, or keep the classical-formula placeholder?
8. **Music tradition.** What is sung vs. recited in their room? Whose melodies
   (Carlebach, Friedman, chassidic, choral, their own)? Any call-and-response
   conventions? Does the "everyone re-gathers at the gold line" convergence norm
   match how they actually daven, or should it be re-tuned?
9. **Transliteration.** Keep the house scheme (Sephardi/Israeli, `ch`/`tz`,
   apostrophes for sheva, acute accents for stress — see `01_STYLE_GUIDE.md`) or
   change it? Transliterate everything, or only what's sung?
10. **Seasonal needs.** Which back-matter insertions matter to them (Ten Days of
    Awe, festivals, Omer, Chanukah/Purim Al HaNisim)? Anything local to add — a
    yahrzeit page, an announcements page?
11. **Audience.** Interfaith families? First-timers? Kids? Average Hebrew literacy?
    (Drives footnote density, the welcome page, and how much the how-to spread
    explains.)
12. **Print reality.** Keep 7×10 full-color? Or budget black-and-white? Page-count
    ceiling? Binding? Any need for a large-print edition?
13. **Ritual marks.** Keep the "some of us…" embodied-practice marks in the margin?
    Any local customs to add or drop?
14. **Untouchables.** Which texts does their community know by heart and must not
    change — words, melodies, or page habits to preserve exactly?

## First-draft recipe (minimum viable personalization)

After the interview, produce a compiling first draft in one pass:

1. **Title page** — edit `build/typst/content/frontmatter.typ`: title, community
   name, city, editor. If renamed, also change the `SHIREI SHABBAT` footer wordmark
   in `book.typ`'s page footer.
2. **3–5 interview-driven text choices** — the highest-visibility rulings only:
   e.g. the divine-name rendering in two or three flagship units, the
   m'chayeih choice, the ancestors line, one keep/cut decision, and the Mi
   Shebeirach resolution. Surgical edits; leave the rest for the roadmap.
3. **Rebuild** — `bash build/check.sh` until green; note the page count.
4. **Deliver** the PDF (or point at the Action artifact) **plus the roadmap below**,
   and log every ruling in `liturgy-map/DECISIONS-LOG.md`.

## Roadmap template (propose this, adapted to their answers)

- **Phase 1 — Identity.** Title page, book name, footer wordmark, welcome page
  rewritten in their community's voice; license/credits page updated (keep the
  attribution line per `LICENSE.md`).
- **Phase 2 — Liturgical choices.** Execute the service-order rulings: cut/add/reorder
  units (keep `UNITS`, the opener item lists, and the includes in sync — see
  `FORK-YOUR-OWN.md`); ancestors, m'chayeih, Mi Shebeirach, seasonal set.
- **Phase 3 — Voice & translation pass.** Define their translation voice (revise
  `01_STYLE_GUIDE.md` first, then apply), sweep every English line for consistency;
  verify all Hebrew against Sefaria as you go.
- **Phase 4 — Music conventions.** Mark what's sung vs. recited, re-tune the gold
  convergence lines to their melodies (`liturgy-map/CONVERGENCE-MAP.md`), adjust
  rubrics and ritual marks to their choreography.
- **Phase 5 — Own the teaching layer.** Rewrite footnotes and rail captions in their
  voice (CAPTIONS.md first, then re-wire the dict), tune the palette and format if
  desired, proof the whole book page by page, print a physical proof.

## Guardrails

- **Hebrew is sacred text: verify, never improvise.** Check any Hebrew you touch
  against Sefaria (or a standard siddur). Keep nikud (vowel points) intact — never
  "fix" pointing by eye; edit Hebrew only as surgical string replacements.
- **Use the house helpers** — `startprayer` / `stanza` / `eng` / `engn` / `chatimah` /
  `rubric` / `ritual` / `seasonal` / `seasonmark` / `submark` — rather than raw layout.
  Signatures and a worked example are in `FORK-YOUR-OWN.md`.
- **`startprayer` titles must resolve** in the `UNITS` registry (via `ALIASES` if the
  display title differs). If you rename or add a unit, update `UNITS` *and* the
  matching section-opener item list in `shirei-shabbat-FULL.typ` (sections 2 and 3
  use inline opener variants there, not `sectionopener()` — edit their `items` lists
  directly).
- **CAPTIONS.md first**, then the `CAPTIONS` dict in `book.typ` — and nowhere else.
- **Contrast:** functional text (chatimah lines, cue rules) uses the *dark* gold
  `GOLDD` for readability; don't lighten it or swap in `GOLD` for running text.
- **Process hygiene** (from `build/README.md` — each rule was earned): small surgical
  edits, `bash build/check.sh` after every wave, commit after every verified wave,
  one agent at a time inside `build/typst/content/`. The NUL scan in check.sh exists
  because a Windows↔Linux mount once truncated files with NUL bytes — take a
  non-clean scan seriously.
- **Don't commit** `build/typst/content/mi-shebeirach-local.typ` (gitignored;
  it's a licensed text) and don't edit `build/fonts/` or `build/tools/`.

For the detailed file map, helper reference, palette notes, and troubleshooting:
**`FORK-YOUR-OWN.md`**.
