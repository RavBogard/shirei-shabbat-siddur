# Translation · Transliteration · Design Decisions

Companion to DECISIONS-LOG.md (which holds liturgy/contents). Same rule: Claude records,
Daniel decides. These feed the design & translation phases and will fold into 01_STYLE_GUIDE.md.

---

## Translation

- **SETTLED — Divine name in English is flexible/contextual:** HaShem, Holy Oneness, the Eternal,
  etc., chosen as most fitting per prayer (not one rigid rendering). Never "Lord"/"King." (2026-07-03)
- **SETTLED — Hebrew b'rachah formula stays traditional** ('Baruch atah Adonai Eloheinu melech
  ha-olam') — familiar and singable; the softening happens in English only. (2026-07-03)
- **SETTLED — English b'rachot use Falk-style reframing** — recast the opening away from "Blessed
  are You… King," e.g., "Let us bless the Source of life…"; intimate, degendered, non-monarchic. (2026-07-03)
- **SETTLED — One translation per prayer** — a single "accurate-ish," warm, feminist/humanist
  rendering (not the literal-plus-poetic double treatment). (2026-07-03)
- **SETTLED — B'rachah English: vary the reframing per prayer** (literary, not one formula), always
  non-monarchic / degendered. (2026-07-03)
- **SETTLED — "M'chayeh metim" → metaphorical in English** ("renews life," "awakens what sleeps");
  Hebrew stays traditional. (2026-07-03)
- **SETTLED — Fidelity: freer where it sings** (interpretive license allowed when it reads/sings better). (2026-07-03)
- **SETTLED — God-address: reverent capitalized "You"; never gendered pronouns** (no He/His/Him). (2026-07-03)
- **SETTLED — Generate the whole draft fresh** in this voice (not based on the June drafts). (2026-07-03)
- **SETTLED — Kavanot: none in the draft** (they come from the rabbis live). (2026-07-03)
- **SETTLED — Teaching notes: drafted throughout, but substantive** — real Torah, CRC-values,
  well-researched (use research agents). (2026-07-03)

## Transliteration

- **SETTLED — Sephardi / Israeli pronunciation** ('Shabbat,' final -t, 'Adonai'). (2026-07-03)
- **SETTLED — Popular / singable spelling** ('ch,' 'tz,' apostrophe for sh'va) — no scholarly
  diacritics. Accessible to newcomers. (2026-07-03)
- **SETTLED — Mark the stressed syllable subtly** to aid singing/pronunciation (accessibility
  feature; helps newcomers land the beat). (2026-07-03)
- **SETTLED — Transliterate all communal/sung parts; not silent-only texts** (e.g., parts of the
  silent Amidah may skip transliteration). Keeps pages lighter than full-maximalist. (2026-07-03)

## Hebrew text form

- **SETTLED — Divine name printed as יְיָ (double-yud)** throughout (supersedes the June draft's
  יְהוָה). Transliterated "Adonai"; English varies (HaShem / Holy Oneness / the Eternal). (2026-07-03)
- **SETTLED — Sh'ma first line set large, with the traditional oversized ע and ד** (spelling עֵד,
  "witness") — a teaching moment on the page. (2026-07-03)
- **SETTLED — Refrains: print in full once, then cue** ("(refrain)") on later returns. (2026-07-03)
- **SETTLED — Shalom Aleichem: TWO versions** — the full traditional text, AND a second version set
  to the Avishai Cohen arrangement CRC often sings (line selection to be sourced/researched). (2026-07-03)
- Psalms: full text, but paragraphed into the conventional SINGING stanzas (Carlebach-style
  divisions as found in well-divided siddurim) — to be researched per psalm.

## Draft production spec (2026-07-03)

- **Title:** Shirei Shabbat · Songs of Shabbat. Retire the word "movement" — sections go by name.
- **Trim:** 7×10 for this draft. **Format:** the full-color designed Typst layout ("froofroo").
- **Teaching notes:** brief (1–2 sentences), researched, sourced, CRC-values.
- **Front matter:** title page (Hebrew+English title · author · congregation+place · a verse/tagline);
  a warm "welcome + how-to-use-this-book" page. **Dedication: omit for this draft.**
- **Back matter:** Kiddush as a flip-to reference. (No TOC / pronunciation-key page / colophon in v1.)
- **Deliverable:** complete designed PDF **plus** editable per-prayer text files.
- **Build order:** section by section — Kabbalat Shabbat first — then assemble the whole book.

## Page design & style

- **SETTLED — Page architecture: Hebrew + transliteration side by side, translation below.**
  Hebrew on the outer edge, transliteration parallel beside it, English beneath. (Phase-0 prototype
  / research recommendation.) (2026-07-03)
- **SETTLED — Wayfinding: layered "expand-in-place" system (Variant A).** (2026-07-03)
  Rejected the original rotated side rail (read "upside down" — per Karen). New system:
  · **Section-opener pages** carry the FULL guide — all four movements listed vertically (the arc,
    top→bottom), the current one expanded to show its prayers with the current prayer in gold.
  · **Interior prayer pages** carry a LIGHT version of the same as a horizontal (never rotated)
    outer-edge rail, top-aligned and mirrored (left on verso, right on recto): other movements
    collapse to faint names, the current movement expands to its prayers.
  This removes the top-vs-outer redundancy (full guide once per section; a whisper on interior pages)
  and shows all three levels Daniel wanted: this prayer · its place in the section · the other sections.
  Built end-to-end in `proofs/2026-07-03-DESIGN-meein-sheva-navA.pdf`.
- **SETTLED — Full color.** ⚠️ Budget flag: full color at 250 copies is the main cost driver and may
  exceed the $5k budget (esp. hardcover); get real print quotes early — may push toward softcover /
  fewer copies / larger budget. Opens imagery + colored-movement design. (2026-07-03)
- **SETTLED — Teaching layer: movement-opener pages ('what this is / where we are') + brief
  bottom-of-page structural/historical notes.** Medium depth; kavanot stay with the rabbis. (2026-07-03)


## Updates (2026-07-04, from print review)

- **Section name in English: "Sh'ma & Its Blessings"** (not "Her") — "her" reads as misogynistic in
  English; Hebrew stays שְׁמַע וּבִרְכוֹתֶיהָ.
- **Cantillation font: Ezra SIL.** Whenever Hebrew should carry *trope* (Torah readings — the Sh'ma,
  V'ahavta, tzitzit paragraph, and later Torah verses), set it in **Ezra SIL**, which renders
  cantillation cleanly. David Libre (no trope glyphs) remains the body Hebrew everywhere else.
- **Torah readings carry full cantillation** (ta'amim), set in Ezra SIL. The divine name is **יְיָ everywhere, including trope passages** (Daniel, 2026-07-04) — it does not carry the name's own ta'am, and that's fine. Also cantillated: **V'shamru (Exod 31), Mi Chamocha (Exod 15), Vayechulu (Gen 2).**
- **Sh'ma first line:** large, Ezra SIL, with the enlarged ע and ד (spelling עֵד, "witness").
- **Page numbering (final single doc):** front matter UNNUMBERED; arabic page 1 begins at Kabbalat Shabbat. (Section proofs restart at 1 for convenience.)

## Seasonal / calendar insertions (2026-07-04) — HYBRID
- **Frequent tiny swaps inline & recessive:** e.g. G'vurot's *mashiv haruach umorid hagashem* (winter)
  vs *morid hatal* (summer) — set in a small, tinted, muted box right where it belongs (helper `seasonal()`).
- **Longer / rarer inserts at the back:** Ya'aleh V'yavo (Rosh Chodesh & festivals), Al HaNisim
  (Hanukkah/Purim), the Ten Days of Repentance changes, festival Kiddush, Counting the Omer — collected
  in a back-of-book "Seasonal Insertions" section, with a small in-text marker (`seasonmark()`) at each spot.
- Goal: the everyday Friday-night page stays clean; the year is accommodated without distraction.

## Rulings 2026-07-05 (Daniel) — enacted
- **Mi Shebeirach:** Debbie Friedman setting; CRC holds a perpetual license (as in the current
  siddur). In this build: Hebrew refrain + a faithful house English (CRC's licensed exact English
  may be dropped in); attributed to Friedman in the note.
- **Concluding order (D6):** Mi Shebeirach → Aleinu → Mourner's Kaddish → Priestly Blessing → Adon Olam. ✔
- **Ya'aleh V'yavo (D2):** matriarchs added; messiah-ben-David clause omitted. ✔
- **Festival Kiddush (D3):** this is a Friday-night siddur — the festival Kiddush is the COMBINED
  Shabbat+Yom-Tov form (festival falling on Shabbat), sealing "m'kadesh haShabbat v'Yisrael v'hazmanim."
- **Chosenness (D7):** KEEP chosenness language everywhere, literal in English. (Settled — do not soften.)
- **G'vurot / m'chayeh (D8):** print BOTH as a slash — הַכֹּל/מֵתִים · "hakól/meitím" · "all/the dead" —
  in Hebrew AND transliteration AND English, with a footnote. Applied in G'vurot and Me'ein Sheva.
- **haMelech hamishpat (D4):** keep the mention. Monarchic language (D5): Hebrew traditional, English softens.
- **Priestly Blessing (D9):** exact Torah Hebrew; English gender-neutral. ✔
- **Closing (D10):** Adon Olam closes for now (may add 5–10 items later).
- **Ten Days (D11):** ✦ markers added in the Amidah (Avot/G'vurot/Modim/Shalom) and on both Kaddishes;
  back-matter Ten Days section now includes the Kaddish "l'eila l'eila" doubling.
  NOTE: the Kaddish change applies to the Ten Days (Rosh Hashanah–Yom Kippur) only, NOT all of Elul.
