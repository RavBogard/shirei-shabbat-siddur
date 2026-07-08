# Shirei Shabbat · שִׁירֵי שַׁבָּת

**A real congregation's sung Friday-night siddur — open for you to make your own.**

This is the complete Kabbalat Shabbat + Ma'ariv prayerbook used at Central Reform
Congregation in St. Louis: fully pointed Hebrew, a singable transliteration beside
every line, fresh English translations, teaching footnotes, and a wayfinding margin
system that lets a latecomer find the service from the fore-edge of the closed book.
It is a single [Typst](https://typst.app) project with the entire toolchain vendored
in the repo — fork it, and it builds your book.

## Make your own siddur (with Claude)

Copy this to Claude (Claude Code, or claude.ai with GitHub access), and it will
interview you and build your first draft:

```
I want to create my own version of a siddur based on this repository:
https://github.com/RavBogard/shirei-shabbat-siddur

Read CLAUDE.md first. Ask me questions, then create the first draft of my
version and a proposed roadmap to fully customizing it.
```

## Quick start (humans)

**No toolchain at all:** fork this repo → edit files directly on github.com (start
with `build/typst/content/frontmatter.typ` — the title page) → every push runs the
build Action → download your PDF from the workflow run's artifacts.

**Locally (Linux/macOS/WSL):**

```bash
git clone https://github.com/RavBogard/shirei-shabbat-siddur
cd shirei-shabbat-siddur
bash build/setup.sh    # unpacks the vendored Typst binary — no downloads, no installs
bash build/check.sh    # integrity checks + full compile
/tmp/typst-bin/typst compile --font-path build/fonts build/typst/shirei-shabbat-FULL.typ my-siddur.pdf
```

## What you can customize

Everything, in practice: the title page and community identity; which prayers are in
and in what order (the service order is one file of `#include`s); the English
translations and their theology of God-language; the transliteration scheme; the
teaching footnotes and margin captions; the seasonal insertions; the palette and
trim size. The prayer texts live one-unit-per-block in `build/typst/content/`, the
design system lives in `build/typst/book.typ`, and the editorial record lives in
`liturgy-map/`. The full map, helper reference, and a worked example are in
**[FORK-YOUR-OWN.md](FORK-YOUR-OWN.md)**; agents start at **[CLAUDE.md](CLAUDE.md)**.

## A note on Mi Shebeirach

Like many communities, CRC sings the beloved Debbie Friedman / Drorah Setel
**Mi Shebeirach** (1988). That setting is under copyright and is **not included
here** — the repo ships a public-domain-safe placeholder for the healing prayer,
and the build swaps in a private local file where one exists. Your community should
license the Friedman/Setel setting from its rights holders or set its own words in
that unit. Details in [FORK-YOUR-OWN.md](FORK-YOUR-OWN.md) and [LICENSE.md](LICENSE.md).

## License & credits

Original translations, commentary, captions, and design:
**[CC BY-NC-SA 4.0](LICENSE.md)** — share and adapt for your community,
non-commercially, with credit, under the same terms. The Hebrew liturgy itself is
public domain; no license is claimed over it. Fonts (David Libre, Ezra SIL,
Libertinus Serif) are vendored under the SIL Open Font License.

*Shirei Shabbat* by **Rabbi Daniel Bogard, Central Reform Congregation, St. Louis** —
written, typeset, and revised in collaboration with Claude. If this book helps your
community sing, that's the point. שבת שלום.
