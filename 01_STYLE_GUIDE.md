# Style Guide — Shirei Shabbat Siddur

> **How to read this file:** the voice, translation, and transliteration rules below are
> canonical and the reason this file ships. Two sections are historical and no longer
> describe the pipeline: the "Content file format" (a retired markdown/front-matter flow)
> and "Typesetting notes (Phase 0…)". Author units as `.typ` files that begin with
> `#import "../book.typ": *` — see `FORK-YOUR-OWN.md`, not those sections. (The book's
> earlier working name was "Shir Shabbat"; it is now **Shirei Shabbat**.)

Derived from Daniel's June 2026 draft. Every new section must be indistinguishable in voice
from the existing ones. When in doubt, reread the draft sections, then imitate.

## Page architecture (whole page)

- **Wayfinding rail, outside edge of every page — ACCORDION with fore-edge bleed tab (approved 2026-07-05, `design-lab/margin-lab.typ` / `proofs/2026-07-05-MARGIN-LAB.pdf`; margin-system questions a–g resolved 2026-07-05):** the rail lists all four movements; collapsed sections sit one quiet small-caps line each in fixed-height slots (0.5in). The CURRENT section renders as a solid **indigo (TWID #222a54)** tab with parchment small-caps text, running off the trimmed outer edge, followed by its expanded unit list — the current unit marked with a 2.2pt gold bar + bold indigo text, other units muted. Because the collapsed slots above are fixed-height, the tab's position steps down as the service advances: the closed book shows a progress staircase on the fore-edge, so latecomers can find tonight's section from the outside of the closed book. A one-line italic "what's happening now" caption hangs **below** the accordion behind a short gold rule, and changes per unit. Mirrors on verso/recto — always the *outer* edge. Design assumes 0.125in bleed at the fore edge; confirming the print vendor can accept it is an early implementation task — fallback is tab stops 1–2mm inside the trim (one-line change).
- **Ritual marks (pivot from choreography glyphs, 2026-07-05)**, in the gutter between text block and rail: small gold glyphs + 4–8 word micro-labels marking **inherited embodied practices nobody announces** — steps into the Amidah, bows within it, eyes covered at Sh'ma, tzitzit held, L'cha Dodi turn, etc. Voice: "some of us..." invitations, zero prescription. Labels are **always shown** (the glyph + label *is* the content, not code); no separate legend — the inside-cover legend was CUT (Daniel, 2026-07-05). Repertory: `liturgy-map/RITUAL-MARKS.md` (**APPROVED 2026-07-05** — 11 marks placed: M1–M4, M5/M6 merged, M7–M11, M12; M13 struck). Bowing mechanics live once, as a commentary footnote on the Amidah opening page. Outer margin **stays at 1.25in** (returned from the 1.4in trial): rail 0.98in at the trimmed edge + a ~0.27in glyph gutter beside the text block.
- **Convergence line:** the final verse (or named unit override, per `liturgy-map/CONVERGENCE-MAP.md`) of each non-blessing unit is set in dark gold (#8a6416) in both transliteration and Hebrew columns. For blessings, the chatimah (closing blessing line) is gold — norm: "everyone re-gathers at the gold line, then turns together." **Amidah exception:** only Shalom Rav (Birkat Shalom) is gold; the interior six chatimot stay regular type. How this works is explained in the front matter ("How to use this siddur") and repeated as one line on each section opener. Pages themselves carry only the gold line — no per-page corner cue.
- **Two-color rule:** the entire margin/wayfinding system — rail, tab, glyphs, convergence line — uses only the book's existing palette, indigo (TWID) and gold, against parchment. No third color.
- **Fixed-zone principle:** every content type has one consistent home on every spread — rail at the outer edge, glyphs in the gutter beside it, commentary/notes below or beside the text block, chatimah in-line in gold. A reader should be able to predict where to look for a given kind of information without relearning it page to page.
- **Commentary footnotes, bottom of page:** teachings, historical notes, provocations — in smaller type below a rule, keyed by a light marker (° or letter) from the main text. Distinct from the kavanah (which frames the prayer before it's sung); commentary deepens after. Layout must be stable whether a page has zero notes or four. Footnotes are the settled treatment — the Tufte-style sidenote alternative was mocked up in `design-lab/margin-lab.typ` and rejected after A/B comparison (2026-07-05).

## Page architecture (per liturgical unit)

1. **Title line:** English name (bold) + Hebrew name (bold), e.g. `**L'cha Dodi**  **לְכָה דוֹדִי**`
2. **Kavanah** (italic): 1–3 sentences. Historical/poetic framing, not instruction. Examples from the draft:
   - "*A wedding poem by the mystics of Safed. They would dress in white and walk out to the fields to greet Shabbat like a bride, as the sun set over the mountains.*"
   - "*Singing is resistance work. Joy is resilience. Coming together is resilience. (Psalm 96)*"
   - Tone: intimate, embodied, historically grounded, occasionally political. Never academic. Psalm/source citation in parentheses at the end when relevant.
3. **Two-column table:** transliteration (left), pointed Hebrew (right). Both centered.
4. **Translation** (italic, below): for long texts, broken into labeled verse blocks (`**V1:**`, `**V2:**` or refrain/verse names like `**Bo'i v'shalom:**`).

## Translation voice — the heart of the book

- **Divine name in English is flexible** (SETTLED, superseding the old HaShem-only rule): HaShem, the One, the Holy One, the Eternal, Source of all being, and the like. Never "the Lord," never "King." Epithets are always **capitalized** ("Source of the universe"), and repeats within one prayer agree. Never "Adonai" in the English (that belongs to transliteration only).
- Liberation language: *y'shuah* → "liberation" (not "salvation"). "Shout to the rock of our liberation."
- Non-hierarchical, embodied, present-tense energy: "we'll dance and delight in you," "Hurry, dear one — the time is here."
- Em-dashes for breath and rhythm. Sentence fragments welcome. Lowercase intimacy over liturgical formality.
- Kavod may stay untranslated when translation would flatten it ("all of it cries: kavod").
- Gender: divine language degendered wherever possible; ancestors include imahot.
- Second person for God is intimate but **reverently capitalized — You / Your / Yourself** (SETTLED 2026-07-03), not the majestic "Thou."
- **Shabbat**, never "Sabbath," in the book's own voice; "Sabbath" only inside a quoted published rendering.

## Hebrew conventions

- Fully pointed (with nikud) throughout; the divine name is set as **יְיָ** (SETTLED, superseding the draft's יְהוָה).
- Source: Sefaria via MCP; record the ref (e.g., `Psalms 96`) in the content file frontmatter.
- Maqaf, sof pasuq, and cantillation: no ta'amim; keep maqaf as Sefaria gives it.
- Any deliberate deviation from the traditional text (e.g., imahot in the Amidah) is flagged in the content file with a `variant:` note.

## Transliteration conventions (match the draft)

- `ch` for ח and כ rafah · `tz` for צ · `'` (apostrophe) for sheva na (`b'racha`, `n'kab'la`) and to separate vowels (`ha'aretz`, `bo'achem`)
- Sephardi/Israeli pronunciation: `Shabbat` not `Shabbos`, final `-t` not `-s`.
- Divine name transliterated **Adonai** (translation says HaShem — this split is deliberate).
- Capitalize sentence-initial words and proper nouns only.

### v8 style sheet (adopted 2026-07-06, copyeditor pass — canonical)

- **Accents: mark the stressed syllable of every polysyllabic transliterated word** (final or not). Never accented: *Adonai*, *Shabbat/haShabbat*, and proper names of books/holidays in English contexts. (The front-matter sentence was rewritten to match: "an accent mark shows you the stressed syllable; most Hebrew words land on the last one.")
- **Canonical spellings:** `Yisra'él` · `Barúch` (incl. *haKadósh barúch hu* and the Bar'chu response) · `atá` · `ashér` · `echád` · `olám` · `gadól` · `elohím` · `Shabbat / haShabbat` (capitalized, double-b, never accented) · `boréi p'rí hagáfen` · `va'éd`.
- **Final ה after tsere/segol → -éh with the h:** `Oséh shalóm`, `aséh`, `m'chayéh`, `ma'aséh`, `r'tzéh`, `yihyéh`, `Ha'oséh`, `oséh féle`. Aramaic mapik forms keep -éh (`sh'méh`, `malchutéh`).
- **Definite article closed up** (`hashalom`, `hasharét`, `hakól`); apostrophe only to separate vowels (`ha'olám`, `ha'áretz`). No hyphens. **Vav-conjunction closed** (`ushmá`, `ulzamér`, `uvó'u`).
- **One apostrophe glyph in print — curly `'`**: string-argument apostrophes/quotes are normalized so rail, titles, translit, and prose all match the smart-quoted content blocks.
- **Hebrew terms in English prose: italic** (`#emph[…]` / `_…_`), never `*…*` (which renders bold). Gloss pattern: *term*, "gloss."
- **Citations: bare parenthetical** — "(Berakhot 17a)", "(Numbers 6:24–26)", en-dash ranges; prose may say "the Talmud teaches… (Berakhot 21b)" but never "(Talmud, Berakhot 12b)".
- **Naming (R2):** the Amidah section opener is titled **T'filah** (תְּפִלָּה); the rail tab, unit list, and eyebrows keep **Amidah**; the opener blurb glosses the two-name scheme.

## Content file format

One file per liturgical unit in `content/`, ordered by number:

```markdown
---
unit: lecha-dodi
order: 110
sefaria_ref: "Lecha Dodi"
status: draft | daniel-review | approved | typeset
variant: "5 of 9 verses, per CRC practice"
---
# L'cha Dodi · לְכָה דוֹדִי
## kavanah
...
## hebrew
...
## translit
...
## translation
...
## commentary
- (optional; each bullet becomes a footnote — teachings, history, thoughts. Cite sources.)
```

## Typesetting notes (Phase 0 will refine)

- Hebrew font candidates: SBL Hebrew, Ezra SIL, David Libre, Frank Ruehl CLM — pick for nikud clarity at 11–13pt.
- English: a humanist serif that doesn't fight the Hebrew.
- No page break inside a prayer unit; turns land at unit boundaries.
- Generous margins; the book is held one-handed while standing and singing.
