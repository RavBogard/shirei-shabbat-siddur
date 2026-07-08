# FORK-YOUR-OWN — the detailed reference

For humans and agents actually making a new community's siddur out of this one.
Read `CLAUDE.md` first for the interview, recipe, and guardrails; this file is the
mechanics.

## 1 · Annotated file map

The live surface is three things: the service order, the template, and the content
files. Everything else under `build/` is a retired earlier pipeline (see `CLAUDE.md`).

### The service order — `build/typst/shirei-shabbat-FULL.typ`

Front matter → four sections → back matter. Each section is an opener plus
`#include`s of content files, in service order. **Note:** section 1 (Kabbalat
Shabbat) and section 4 (Concluding) call `sectionopener(...)` from `book.typ`;
sections 2 (Sh'ma & Its Blessings) and 3 (T'filah/Amidah) use **inline compact
variants** of the same opener written directly in this file (tighter vertical
metrics so the first unit shares the opener's page). When you edit a section's
unit list you must update the opener's `items` list *here* — in the
`sectionopener()` call or in the inline variant's `let items = (...)` — as well as
the `UNITS` registry in `book.typ` (§3).

### The content files — `build/typst/content/`

| File | Units it holds |
|---|---|
| `frontmatter.typ` | Title page · welcome page ("This book is for you") · "How to use this siddur" spread |
| `kabbalat-inline.typ` | Yedid Nefesh · Lighting the Shabbat Candles · Shalom Aleichem |
| `psalms-A.typ` | Psalm 95 · Psalm 96 · Psalm 97 |
| `psalms-B.typ` | Psalm 98 · Psalm 99 · Psalm 29 |
| `ana-bkoach.typ` | Ana B'koach |
| `lcha-dodi.typ` | L'cha Dodi (all nine verses) |
| `psalms-92-93.typ` | Psalm 92 · Psalm 93 |
| `maariv-before.typ` | Bar'chu · Ma'ariv Aravim · Ahavat Olam |
| `maariv-shma.typ` | The Sh'ma (with `#submark("V'ahavta & Tzitzit")` mid-unit) |
| `maariv-after.typ` | Emet v'Emunah (with `#submark("Mi Chamocha")`) · Hashkivenu · V'shamru · Chatzi Kaddish |
| `amidah-silent.typ` | The silent Amidah, seven blessings: We Open Our Lips (Adonai S'fatai) · Avot v'Imahot · G'vurot · K'dushat HaShem · K'dushat HaYom · Avodah · Modim · Shalom Rav · Elohai N'tzor |
| `amidah-vayechulu.typ` | Vayechulu |
| `amidah-meein-sheva.typ` | Me'ein Sheva |
| `concluding-body.typ` | Mi Shebeirach (via the placeholder mechanism, §6) · Aleinu · Mourner's Kaddish · Birkat Kohanim (Priestly Blessing) · Adon Olam |
| `seasonal-insertions.typ` | Back matter: Ya'aleh V'yavo · Al HaNisim (Chanukah + Purim) · Ten Days insertions (Zochreinu etc.) · Counting the Omer · Festival Kiddush |
| `kiddush.typ` | Kiddush for Shabbat evening (back matter) |
| `mi-shebeirach-placeholder.typ` | The public healing-prayer unit (§6) |

Every content file begins with `#import "../book.typ": *` — a new file needs that
line too.

### The template — `build/typst/book.typ`

Read the header comments; they are the design log. The pieces you'll touch:

- **Palette constants:** `INK` (body text), `TWI`/`TWID` (indigo / dark indigo —
  headings, rail tab), `GOLD` (decorative gold — rules, eyebrows, marks), `GOLDD`
  (dark gold — chatimah/convergence text), `PARCH` (page parchment), `MUT`/`FAINT`
  (muted grays). See §4 before changing any of these.
- **Geometry constants:** `MARGIN-OUT` (1.25in outer margin), `RAILW` (0.98in rail),
  `GUT` (the ritual-mark gutter, derived), `COLLAPSED-STEP` (0.5in fixed slot per
  collapsed rail section — this is what makes the fore-edge staircase work), `BLEED`
  / `BLEEDW` (fore-edge bleed tab toggle), `RAIL-DY`. Locked as a system; change
  with care.
- **`UNITS` registry:** the four sections and their unit lists. This drives the
  rail's expanded list *and* `startprayer`'s automatic unit resolution. It must
  mirror the opener item lists in `shirei-shabbat-FULL.typ`.
- **`ALIASES`:** maps display-title stems that don't share a prefix with their
  registry unit name (e.g. `"we open our lips" → "The Silent Amidah"`).
- **`CAPTIONS` dict:** one italic "what's happening now" line per unit, shown under
  the rail. Source of truth is `liturgy-map/CAPTIONS.md` (§5).
- **The rail:** rendered from the page background; it finds the current unit via
  invisible page-anchored `<ss-unit>` metadata marks that `startprayer`, `submark`,
  and `sectionopener` drop *after* their pagebreak (never via lagging state). You
  should not need to touch the rail code itself.

## 2 · The helpers, with a worked example

Signatures (all defined in `book.typ`):

```
startprayer(en, he, sec: "Kabbalat Shabbat", newpage: false, unit: none)
    Unit header: gold eyebrow (sec), English + Hebrew title, gold rule.
    Resolves `en` against UNITS/ALIASES (or the `unit:` override) and updates
    the rail + caption automatically. Unmatched titles clear the unit marker.
stanza(tr, he, label: none)      two-column block: transliteration | pointed Hebrew
                                 (optional small-caps gold label above, e.g. "All")
eng(s)                           italic English translation paragraph
engn(s, n)                       same, with a teaching footnote n anchored at its end
note(s)                          a bare footnote
chatimah(tr, he)                 the convergence line — dark gold (GOLDD), both columns
rubric(s)                        centered italic stage direction
ritual(label)                    gold "standing person" mark in the gutter + 4–8 word
                                 micro-label ("some bow as the blessing opens")
seasonal(cue, tr, he, en)        compact one-line seasonal swap behind a gold hairline
                                 (e.g. mashiv haruach / morid hatal)
seasonmark(s)                    gold pointer to the back-of-book Seasonal Insertions
submark(name)                    advance the rail mid-prayer WITHOUT a header (for units
                                 living inside another prayer); asserts if name doesn't
                                 resolve in UNITS/ALIASES
sectionopener(idx, en, he, blurb, items, cue: none)   full-page section opener
hb(s) / hbt(s)                   Hebrew text in David Libre / Ezra SIL (cantillated)
eyebrow(s) / eyebrowsm(s)        small gold tracked caps
```

**Worked example** — a complete small unit in house style (this is real code; a new
unit for, say, Oseh Shalom as a closing song would look exactly like this):

```typst
// ===================== OSEH SHALOM =====================
#startprayer("Oseh Shalom · Maker of Peace", "עֹשֶׂה שָׁלוֹם", sec: "Concluding", newpage: true)
#rubric([We sing together.])
#ritual([some step back, bowing, taking leave])
#stanza("Osé shalóm bimromáv, hu ya'asé shalóm aléinu,",
  "עוֹשֶׂה שָׁלוֹם בִּמְרוֹמָיו, הוּא יַעֲשֶׂה שָׁלוֹם עָלֵינוּ,")
#chatimah("v'al kol Yisra'él, v'al kol yosh'véi tevél, v'imrú: Amén.",
  "וְעַל כָּל יִשְׂרָאֵל, וְעַל כָּל יוֹשְׁבֵי תֵבֵל, וְאִמְרוּ אָמֵן.")
#engn("May the One who makes peace in the high places make peace for us, for all Israel, and for all who dwell on earth — and say: Amen.",
  [Sung to close the Kaddish and, in many communities, the whole evening — the prayer's last movement is always outward, toward everyone.])
```

To make that unit *exist* you would also: add `"Oseh Shalom"` to the Concluding
section's list in `UNITS` (book.typ), add it to the Concluding opener's item list in
`shirei-shabbat-FULL.typ`, add a caption line to `liturgy-map/CAPTIONS.md` and wire
it into the `CAPTIONS` dict, and place the code in `concluding-body.typ` (or its own
file plus an `#include`). Then `bash build/check.sh`.

## 3 · Adding, removing, and reordering units — the sync rule

Four places must agree; `check.sh` + a page flip catches drift:

1. **The content itself** — the unit's code in a `content/*.typ` file, and the
   `#include` order in `shirei-shabbat-FULL.typ` if files move.
2. **`UNITS` in `book.typ`** — the rail's unit list per section, in service order.
3. **The opener item lists in `shirei-shabbat-FULL.typ`** — `sectionopener(...)`'s
   `items` argument for sections 1 and 4; the inline variants' `let items = (...)`
   for sections 2 and 3. These are display copies of the same list.
4. **`CAPTIONS`** — a line per unit (missing key = blank caption, not an error) —
   and `ALIASES` if the display title's stem doesn't prefix-match the unit name.

Removing a unit: delete its code, remove it from `UNITS` and the opener list (leave
its caption harmlessly orphaned or delete it). Reordering: reorder all of the above
identically. Renaming: remember `startprayer` matches on the title stem *before*
the `·` — if the new display name no longer prefix-matches, add an `ALIASES` entry
or pass `unit: "Registry Name"` to `startprayer`.

## 4 · Changing the palette safely

The palette lives at the top of `book.typ` — seven constants, used everywhere. The
book is deliberately two-color (indigo + gold on parchment). If you re-color:

- **Contrast is load-bearing.** `GOLDD` (`#8a6416`) exists because the decorative
  gold (`GOLD`, `#bd8a2e`) is too light to *read* at text sizes on parchment
  (`#fbf7ef`). Chatimah/convergence lines, and the cue rules, are functional text
  set in `GOLDD` — if you swap colors, keep the "dark variant for anything readers
  must read" split and check contrast (aim ≥ 4.5:1 against your page color for
  9–10pt text; `GOLDD` on `PARCH` clears it, `GOLD` does not).
- Keep the rail tab (`TWID`) dark enough that `PARCH`-colored small caps stay
  legible on it, and dark enough to read as the fore-edge staircase on a closed book.
- Change constants only — never inline a hex into content files. (A few content
  files carry two fixed grays for translation text, `#4a4a52` / `#2e2c26`; sweep
  those only if you re-color the whole text system.)

## 5 · Captions: CAPTIONS.md → book.typ

`liturgy-map/CAPTIONS.md` is the editorial source of truth — one approved line per
unit, with the voice rules and the dedupe-against-kavanah rule at the top. The
workflow is: **edit/approve the line in CAPTIONS.md first, then copy it into the
`CAPTIONS` dict in `book.typ` — and nowhere else.** The dict key must exactly match
the unit's name in `UNITS` (that's how `startprayer` finds it). Keep both files in
step so the next editor can trust either.

## 6 · The Mi Shebeirach placeholder

At CRC the healing prayer is sung to the Debbie Friedman / Drorah Setel setting
(1988) — copyrighted, so **not in this repo**. Mechanics:

- `concluding-body.typ` includes `mi-shebeirach.typ` at the healing-prayer slot.
- `mi-shebeirach.typ` is a **one-line selector, generated by the build**
  (`build/setup.sh` and `build/check.sh` both refresh it; it is gitignored):
  - if `build/typst/content/mi-shebeirach-local.typ` exists (private, gitignored),
    the selector includes it — that's how CRC builds with the licensed setting;
  - otherwise it includes `mi-shebeirach-placeholder.typ` — the committed,
    public-domain-safe classical formula. This is what CI builds.
- **For your fork:** either edit `mi-shebeirach-placeholder.typ` directly with your
  community's (rights-cleared) text, or drop your licensed setting into your own
  `mi-shebeirach-local.typ` and keep it out of your public history too.
- Consequence: a bare `typst compile` on a *fresh clone that has never run
  `setup.sh` or `check.sh`* fails with "file not found: mi-shebeirach.typ" — run
  `bash build/setup.sh` first (you need it for the binary anyway).

## 7 · Troubleshooting

- **"unknown font family" / Hebrew renders as boxes or falls back** — you forgot
  `--font-path build/fonts`. The book needs David Libre, Ezra SIL, and Libertinus
  Serif, all vendored there. (Paths in the compile examples are relative to the
  repo root; `check.sh` runs from inside `build/`, hence its `--font-path fonts`.)
- **"file not found: mi-shebeirach.typ"** — run `bash build/setup.sh` (see §6).
- **`check.sh` reports NUL BYTES in a file** — the file was truncated/corrupted at
  the byte level (historically: a Windows↔Linux mount lag during writes). Restore it
  from git (`git checkout -- <file>`), re-apply your edit surgically, re-run.
- **`submark(): '<name>' not found in UNITS/ALIASES`** — the assertion doing its
  job. Fix the name, or add the unit/alias (§3).
- **A unit header prints but the rail doesn't mark it** — its `startprayer` title
  stem didn't resolve; add an `ALIASES` entry or pass `unit:`.
- **Words print literally on the page (e.g. `line`, `v(6pt)`)** — you're in markup
  mode; every function call in content position needs its own `#` (`#v(6pt)`,
  `#line(...)`). A known past bug in the back-matter opener.
- **Footnote weirdness** — footnote numbering restarts per page by design (the
  counter reset lives in the page background), and entries are set unbreakable so a
  note never splits across a page turn. Very long notes therefore push content;
  shorten the note rather than fighting the layout.
- **Compile is clean but pages shifted** — expected after content edits; the rail,
  staircase, and captions all recompute. Spot-check openers and any page you edited
  with the PNG render (see `CLAUDE.md`).
- **Windows** — the shell scripts are bash; use WSL, any Linux/macOS shell, or just
  push and let the GitHub Action build. Beware creating a file literally named `NUL`
  via bad redirects on Windows; it's gitignored but confuses tools.
