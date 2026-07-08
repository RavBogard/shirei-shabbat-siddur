// ============================================================================
// Shirei Shabbat · Songs of Shabbat — PRODUCTION book template
// 7x10 trim, full color. Margin system v2 merged from design-lab/book-v2.typ
// on 2026-07-05 (Daniel blessed the .typ content files as canonical and
// approved the merge — 03_MARGIN_SYSTEM_PLAN.md Phase 2 complete).
// design-lab/book-v2.typ remains as a dated archive copy of this file.
//
// Revisions merged 2026-07-05 (Daniel's decisions):
//   · COLLAPSED-STEP 0.42in → 0.5in.
//   · GLYPH PIVOT: chor() rise/sit/bow/sung/leader + first-occurrence
//     counters DELETED. Replaced by ritual(label): one uniform quiet gold
//     mark (open circle over a stem — a person, standing) in the gutter at
//     the exact line, with a 4–8 word micro-label ALWAYS shown beneath it
//     in ~5.5pt italic gray. The label is the content.
//   · submark(name): advances the rail's current unit mid-prayer WITHOUT
//     rendering a unit header (Mi Chamocha inside Emet v'Emunah, V'ahavta &
//     Tzitzit inside The Sh'ma).
//   · sectionopener keeps the optional cue: param (default none) — existing
//     production calls compile unchanged.
//
// New in v2 (locked decisions, 2026-07-05 — liturgy-map/DECISIONS-LOG.md):
//   · Accordion rail: 0.98in flush to the trimmed edge inside the 1.25in outer
//     margin; indigo (TWID) section tab with parchment small-caps; expanded
//     unit list with the current unit marked in gold; italic "what's happening
//     now" caption below the accordion.
//   · Fore-edge bleed tab: the tab rect overruns the trimmed edge by BLEEDW.
//     NOTE ON BLEED: the page is set at 7x10 TRIM size, so the overrun is
//     clipped at the PDF media box — ink reaches exactly the trim edge, which
//     is correct for review renders. Final bleed handling may move to a
//     7.25x10.25 media box (page 0.125in larger each side + trim marks) once
//     the vendor confirms (Phase 0.1). Toggle with BLEED below.
//   · Automatic unit tracking: startprayer() resolves the current unit from
//     the UNITS registry (see unit-lookup) and updates curunit + caption —
//     always BEFORE its own pagebreak (state-before-pagebreak rule,
//     design-lab/README.md). The rail itself reads page-anchored <ss-unit>
//     marks (see the note above the states) so it never lags a page.
//   · Ritual-mark API: ritual(label) in the ~0.27in gutter between text
//     block and rail; the micro-label always renders (no first-occurrence
//     logic — the label IS the cue).
//   · chatimah(tr, he): the convergence line in dark gold, both columns.
//     No per-page corner cue (the lab's turncue is dropped — question e).
//   · sectionopener(..., cue: [...]): optional one-line gold-line-norm
//     sentence under the blurb.
// Everything else (hb, hbt, eyebrow, rubric, stanza, eng, note, engn,
// seasonal, seasonmark, footnotes, footer/numbering) is behavior-identical
// to the pre-merge book.typ.
// ============================================================================

// ---------------- palette (two colors: indigo + gold on parchment) ----------
#let INK=rgb("#1b1b24"); #let TWI=rgb("#2c3566"); #let TWID=rgb("#222a54")
#let GOLD=rgb("#bd8a2e"); #let GOLDD=rgb("#8a6416")   // GOLDD: dark gold, chatimah
#let PARCH=rgb("#fbf7ef"); #let MUT=rgb("#6d6a63"); #let FAINT=rgb("#b3ab9c")

// ---------------- geometry (locked 2026-07-05) ------------------------------
#let MARGIN-OUT=1.25in       // outer margin (question a: back to 1.25in)
#let RAILW=0.98in            // rail block, flush to the trimmed edge
#let GUT=MARGIN-OUT - RAILW  // ≈0.27in glyph gutter between text block and rail
#let RAILPAD=0.16in          // breathing room between rail text and trimmed edge
#let COLLAPSED-STEP=0.5in    // fixed slot height of a collapsed section line.
                             // NAMED CONSTANT — 0.42in→0.5in per Daniel, 2026-07-05.
#let BLEED=true              // fore-edge bleed tab on/off (vendor fallback: false
                             // + small inset tweak, see Phase 0.1)
#let BLEEDW=0.125in          // bleed allowance beyond the trimmed edge
#let RAIL-DY=0.82in          // rail drop from the top trimmed edge

// ---------------- UNITS registry ---------------------------------------------
// Mirrors the sectionopener() item lists in shirei-shabbat-FULL.typ.
// startprayer() resolves the current unit against these names (see
// unit-lookup below); the rail's expanded list renders from here too.
#let UNITS=(
  (name:"Kabbalat Shabbat", units:(
    "Yedid Nefesh","Lighting the Candles","Shalom Aleichem","Psalm 95",
    "Psalm 96","Psalm 97","Psalm 98","Psalm 99","Psalm 29","Ana B'koach",
    "L'cha Dodi","Psalm 92","Psalm 93")),
  (name:"Sh'ma & Its Blessings", units:(
    "Bar'chu","Ma'ariv Aravim","Ahavat Olam","The Sh'ma","V'ahavta & Tzitzit",
    "Emet v'Emunah","Mi Chamocha","Hashkivenu","V'shamru","Chatzi Kaddish")),
  (name:"Amidah", units:(
    "The Silent Amidah","Avot v'Imahot","G'vurot","K'dushat HaShem",
    "K'dushat HaYom","Avodah","Modim","Shalom Rav","Elohai N'tzor",
    "Vayechulu","Me'ein Sheva")),
  (name:"Concluding", units:(
    "Mi Shebeirach — Healing","Aleinu","Mourner's Kaddish","Priestly Blessing",
    "Adon Olam")),
  // v8 A12: back-matter section so the rail stops falsely showing "Concluding"
  // across the seasonal/Kiddush pages. Not one of the four evening movements,
  // so the section OPENERS list only SECTIONS.slice(0,4); the rail (a fuller
  // map) shows all five.
  (name:"Seasonal & Kiddush", units:(
    "Rise and Come","For the Miracles","In the Days of Mordechai",
    "Remember Us for Life","Counting the Omer","Festival Kiddush","Shehecheyanu","Kiddush")),
)
// legacy flat section list (book.typ compatibility)
#let SECTIONS=UNITS.map(s=>s.name)

// English display titles in the content files that don't share a prefix with
// their registry unit name. Keys are lowercased stems (the part of `en`
// before "·", trimmed); values are canonical unit names from UNITS.
#let ALIASES=(
  "lighting the shabbat candles": "Lighting the Candles",
  "we open our lips":             "The Silent Amidah",
  "our fathers and mothers":      "Avot v'Imahot",
  "divine power":                 "G'vurot",
  "the holiness of the name":     "K'dushat HaShem",
  "the holiness of the day":      "K'dushat HaYom",
  "draw near":                    "Avodah",
  "we give thanks":               "Modim",
  "abundant peace":               "Shalom Rav",
  "my god, guard my tongue":      "Elohai N'tzor",
  "birkat kohanim":               "Priestly Blessing",
)

// ---------------- CAPTIONS -----------------------------------------------------
// One "what's happening now" line per unit, shown below the accordion.
// FINAL COPY — wired 2026-07-05 from liturgy-map/CAPTIONS.md ("CAPTIONS
// dictionary (for book-v2.typ)" section; 41 approved lines, ALTs resolved).
// Edit CAPTIONS.md first, then re-wire here — and nowhere else. The last two
// keys ("Seasonal Insertions", "Kiddush") cover the back-matter families and
// stay unused until the rail learns back matter.
#let CAPTIONS=(
  "Yedid Nefesh": "We open with a love song — the soul aching toward its Beloved before a word of liturgy is spoken.",
  "Lighting the Candles": "Two flames, and Shabbat begins. We cover our eyes to bless the light before we let ourselves see it.",
  "Shalom Aleichem": "We welcome the unseen guests home with us — greeting the angels who, tradition says, walk each of us in.",
  "Psalm 95": "The first of the welcoming psalms — an invitation to sing that turns, mid-breath, into a warning not to harden.",
  "Psalm 96": "Six psalms — one for each day of the week just ended — before we rise to greet Shabbat herself.",
  "Psalm 97": "Still climbing through the six weekday psalms — the earth trembling, the far shores glad, as sovereignty is sung into being.",
  "Psalm 98": "All creation joins the choir — rivers clapping, mountains singing — as we sing our way toward the seventh day.",
  "Psalm 99": "The last of the weekday psalms of ascent — three times it names the Holy One before we reach the storm.",
  "Psalm 29": "The thunderstorm psalm that crowns the week — the world's roar resolving, in its final word, into peace.",
  "Ana B'koach": "A whispered plea between the psalms and the bride — seven short lines, an ancient reaching to be set free.",
  "L'cha Dodi": "We rise and turn to the door: the week is behind us, and Shabbat the bride is arriving now.",
  "Psalm 92": "Shabbat has arrived — now the first psalm sung inside it, the only one the Torah names for this day.",
  "Psalm 93": "The psalm of Friday itself — we close the week by singing the very crown creation sang when it was new.",
  "Bar'chu": "The formal call to prayer — the moment a room of individuals becomes a community. We rise together.",
  "Ma'ariv Aravim": "Night is falling as we pray — the first blessing thanks the One who turns the sky, evening after evening.",
  "Ahavat Olam": "Before we command ourselves to love, we pause on the love already given — Torah handed to us as tenderness.",
  "The Sh'ma": "The line we say lying down and rising up, and hope to say last of all — Israel's whole faith in six words.",
  "V'ahavta & Tzitzit": "And now the answer: love with all your heart — bound to the hand, worn on the fringe, spoken to the children.",
  "Emet v'Emunah": "Having declared the One, we remember the sea — the third blessing turns from creed to the memory of freedom.",
  "Mi Chamocha": "The song at the shore, sung again tonight — the moment slavery broke open and a people first sang free.",
  "Hashkivenu": "We ask to be laid down safely into the dark — sleep as a nightly act of trust, under a canopy of peace.",
  "V'shamru": "Two verses from Sinai, sung: Shabbat as the sign of an unbreakable promise, kept in every generation.",
  "Chatzi Kaddish": "A hinge in the service — this short Kaddish closes the Sh'ma and its blessings and turns us toward the Amidah.",
  "The Silent Amidah": "Three steps forward, as if entering a small room — and for a few minutes a hall full of people goes quiet together.",
  "Avot v'Imahot": "We enter by naming our people — every mother and father, the remembered and the long-unnamed, standing behind us.",
  "G'vurot": "The blessing of the power that revives — of falling and being held, of the buried seed and the returning green.",
  "K'dushat HaShem": "Alone and silent, the holiness prayer stays in its oldest, plainest form — three sentences holding one word to the light.",
  "K'dushat HaYom": "The one blessing that changes with the day — tonight it becomes our meditation on rest itself.",
  "Avodah": "We ask that our prayer be received the way an offering once was — the Presence longed home to dwell among us.",
  "Modim": "The blessing that stops to count the ordinary — breath, morning, the body's small mercies — the miracles we forget are miracles.",
  "Shalom Rav": "The evening's own plea for peace — shorter than its daytime sister, asking a covering of quiet over Israel and all who sleep tonight.",
  "Elohai N'tzor": "It begins by asking to guard the tongue, then opens a silence — room to pour in whatever we could not say aloud.",
  "Vayechulu": "After the long hush of the silent prayer, sound comes back into the room — the very words Genesis uses for the first evening finished.",
  "Me'ein Sheva": "Friday night's own communal blessing, sung aloud — a kindness born to let latecomers finish and walk home safe.",
  "Mi Shebeirach — Healing": "We speak the names aloud, or hold them in the heart — the community turning to care for its own.",
  "Aleinu": "The bow that seals every service — we bend together, rising toward the day when God's name is One.",
  "Mourner's Kaddish": "Mourners rise; the community answers, and no one grieves alone — a prayer for the dead with no word for death.",
  "Priestly Blessing": "The oldest words still spoken among us — three lines widening like two hands slowly opening over the room.",
  "Adon Olam": "We close as we will one night close everything — a song of trust, letting go, and being held.",
  "Seasonal Insertions": "The words we fold in only when the calendar asks — festival, new moon, the days the Book of Life lies open.",
  "Kiddush": "We lift the cup and say it aloud: Shabbat is holy — the world made, and a people set free, in one blessing.",
)

// ---------------- state ------------------------------------------------------
// Same keys as the pre-merge book.typ ("cursec", "started") so nothing else
// has to change. curunit: index into the current section's unit list; -1 = no
// unit marked.
//
// HOW THE RAIL FINDS THE CURRENT UNIT — two mechanisms, on purpose:
//   · states (below) are updated by sectionopener/startprayer BEFORE any
//     pagebreak they emit (state-before-pagebreak rule) — they serve the
//     footer and anything that reads state in flow;
//   · the rail itself does NOT read curunit state at page start (that lags
//     one page whenever a unit header lands at a page top via natural block
//     migration or a content-file pagebreak). Instead, startprayer and
//     sectionopener drop an invisible <ss-unit> metadata mark AFTER their
//     pagebreak, and the rail queries for the last mark on-or-before the
//     current page — so the marked unit is always one that is actually
//     visible on (or before) this page, never one page stale.
#let cursec=state("cursec",0)
#let curunit=state("curunit",-1)
#let caption=state("caption","")
#let started=state("started",false)
// invisible page-anchored mark the rail queries for; value is a dict
// (sec: int|none, unit: int, cap: str)
#let unit-mark(v)=[#metadata(v) <ss-unit>]

// ---------------- small helpers (identical to pre-merge book.typ) -------------
#let hb(s, size: 14.5pt)=text(font:"David Libre", lang:"he", dir:rtl, fill:TWID, size:size)[#s]
#let hbt(s, size: 14.5pt)=text(font:"Ezra SIL", lang:"he", dir:rtl, fill:TWID, size:size)[#s]  // cantillated Hebrew (14.5pt: optical match to David Libre body Hebrew — Daniel, 2026-07-06)
#let eyebrow(s)=text(size:7.5pt, tracking:2pt, fill:GOLDD, weight:"bold")[#upper(s)]
#let eyebrowsm(s)=text(size:7pt, tracking:1.5pt, fill:GOLDD, weight:"bold")[#upper(s)]

// ---------------- unit lookup -------------------------------------------------
// Resolve a startprayer() English title to (sec, unit, name) in UNITS.
// Strategy: take the stem (text before "·"), lowercase, normalize curly
// apostrophes; run it through ALIASES; then case-insensitive prefix match
// in either direction against unit names. `unit:` overrides the stem.
#let unit-lookup(en, unit: none)={
  let stem = lower(if unit != none { unit } else { en.split("·").at(0) })
    .trim().replace("\u{2019}", "'")
  if stem in ALIASES { stem = lower(ALIASES.at(stem)) }
  let hit = none
  for (i, s) in UNITS.enumerate() {
    for (j, u) in s.units.enumerate() {
      let k = lower(u).replace("\u{2019}", "'")
      if k == stem or k.starts-with(stem) or stem.starts-with(k) {
        hit = (sec: i, unit: j, name: u)
        break
      }
    }
    if hit != none { break }
  }
  hit
}

// ---------------- accordion rail (replaces railbox) ---------------------------
// Collapsed sections in fixed COLLAPSED-STEP slots (keeps the fore-edge
// staircase honest); current section as the indigo bleed tab + expanded unit
// list; caption below. Rendered from the page background, flush to the
// trimmed edge.
#let rail = context {
  // last <ss-unit> mark on or before this page (see note above the states)
  let pg=here().page()
  let ms=query(<ss-unit>).filter(m => m.location().page() <= pg)
  let sec=0
  for m in ms { if m.value.sec != none { sec=m.value.sec } }
  // R1 (2026-07-07): first-unit-wins. Prefer the FIRST unit-bearing mark that
  // starts ON this page, so a unit sharing a page with a later one still gets a
  // rail-current page (fixes The Sh'ma f22, Emet v'Emunah f24). Else carry the
  // last unit-bearing mark from earlier in the same section. Guarded by sec so
  // the chosen unit always belongs to the section the tab is showing.
  let unit=(-1); let cap=""
  let here-units=ms.filter(m => m.location().page()==pg and m.value.unit != -1 and m.value.sec==sec)
  let prior-units=ms.filter(m => m.value.unit != -1 and m.value.sec==sec)
  if here-units.len() > 0 {
    unit=here-units.first().value.unit; cap=here-units.first().value.cap
  } else if prior-units.len() > 0 {
    unit=prior-units.last().value.unit; cap=prior-units.last().value.cap
  }
  let outer-right=calc.even(here().page())
  let bw = if BLEED { BLEEDW } else { 0pt }
  let entry(i)={
    let s=UNITS.at(i)
    if i==sec {
      // --- bleed tab: the rect overruns the trimmed edge by bw (clipped at
      //     the 7x10 media box for now — see BLEED note in the header) ---
      block(width:RAILW, spacing:0pt,
        move(dx: if outer-right {0pt} else {-bw},
          rect(fill:TWID, width:RAILW + bw, inset:(y:4.5pt,
              left: if outer-right {7pt} else {RAILPAD + bw},
              right: if outer-right {RAILPAD + bw} else {7pt}),
            align(if outer-right {left} else {right},
              text(size:7.2pt, weight:"bold", fill:PARCH, tracking:0.6pt)[#upper(s.name)]))))
      v(6pt)
      // --- expanded unit list, current unit marked with the gold bar ---
      block(width:RAILW, inset:(
          left: if outer-right {7pt} else {RAILPAD},
          right: if outer-right {RAILPAD} else {7pt}),
        align(if outer-right {left} else {right},
          stack(spacing:4.6pt,
            ..s.units.enumerate().map(((j,u))=>{
              if j==unit {
                box(grid(columns:2, column-gutter:4pt, align:horizon,
                  if outer-right { rect(fill:GOLD, width:2.2pt, height:0.95em) } else { text(size:7pt, weight:"bold", fill:TWID)[#u] },
                  if outer-right { text(size:7pt, weight:"bold", fill:TWID)[#u] } else { rect(fill:GOLD, width:2.2pt, height:0.95em) }))
              } else { text(size:6.8pt, fill:MUT)[#u] }
            }))))
      v(9pt)
    } else {
      // --- collapsed line, fixed slot height ---
      box(height:COLLAPSED-STEP, width:RAILW,
        align(if outer-right {left+top} else {right+top},
          block(inset:(
              left: if outer-right {7pt} else {RAILPAD},
              right: if outer-right {RAILPAD} else {7pt}),
            text(size:6.8pt, fill:MUT, tracking:0.6pt)[#upper(s.name)])))
    }
  }
  block(width:RAILW, {
    for i in range(UNITS.len()) { entry(i) }
    // --- "what's happening now" caption, below the accordion ---
    if cap!="" {
      v(4pt)
      block(width:RAILW, inset:(
          left: if outer-right {7pt} else {RAILPAD},
          right: if outer-right {RAILPAD} else {7pt}),
        align(if outer-right {left} else {right},
          stack(spacing:5pt,
            line(length:0.45in, stroke:0.6pt+GOLD),
            text(size:7pt, style:"italic", fill:MUT)[#cap])))
    }
  })
}

// ---------------- ritual marks -------------------------------------------------
// GLYPH PIVOT (2026-07-05): the chor() rise/sit/bow/sung/leader system and its
// first-occurrence counters are gone. One uniform, quiet mark now serves every
// ritual action, and the 4–8 word micro-label beneath it does the telling —
// labels are the content, so they ALWAYS render.
//
// #ritual(label): a small gold open circle over a short gold stem (a person,
// standing — drawn, not typed: no symbol-font fallback risk) placed in the
// gutter at the exact line, micro-label below in ~5.5pt italic gray. Labels
// wrap to 2–4 short lines. The label box is RITUAL-LABELW = GUT + 4pt: it sits
// 1pt off the text block and borrows ~4pt of the rail's 7pt inner padding, so
// the locked geometry (outer margin 1.25in, rail 0.98in) is untouched and the
// label still clears the rail's own text by ~2–3pt.
// v8 (A6, layout CRITICAL): the +4pt borrow cleared the rail's TEXT but not the
// indigo bleed-tab RECT (filled across RAILW+BLEEDW incl. padding), so mid-page
// tabs (Amidah, staircase pos. 3) clipped labels like "some bow…" → "some b▮".
// Clamp the label box into the gutter (GUT − 2pt) so it never underlaps the tab;
// labels wrap one line longer, which is fine.
#let RITUAL-LABELW=GUT - 2pt
#let ritual-glyph=stack(spacing:1.2pt,
  circle(radius:1.6pt, stroke:0.9pt+GOLDD),
  rect(width:1pt, height:3.6pt, fill:GOLDD, radius:0.5pt))
#let ritual(label)=context{
  let outer-right=calc.even(here().page())
  let c=stack(spacing:3pt,
    align(center, ritual-glyph),
    align(center, par(leading:0.34em, justify:false,
      text(size:5.5pt, style:"italic", fill:MUT, hyphenate:false)[#label])))
  place(if outer-right {right} else {left},
    dx: if outer-right {RITUAL-LABELW + 1pt} else {-(RITUAL-LABELW + 1pt)},
    dy:-1pt, box(width:RITUAL-LABELW, c))
}

// ---------------- sub-marks -----------------------------------------------------
// #submark(name): advance the rail's current unit mid-prayer WITHOUT rendering
// a unit header — for units that live inside another prayer's text (Mi
// Chamocha inside Emet v'Emunah; V'ahavta & Tzitzit inside The Sh'ma). Drops
// the same page-anchored <ss-unit> metadata mark startprayer does, so the
// rail's gold bar and the caption switch from this exact line onward; a page
// carrying both units marks the later one, per the locked rail semantics.
// `name` must resolve in UNITS (ALIASES apply); typos fail loudly at compile.
#let submark(name)={
  let hit=unit-lookup(name)
  assert(hit != none, message: "submark(): '" + name + "' not found in UNITS/ALIASES")
  let cap=CAPTIONS.at(hit.name, default:"")
  cursec.update(hit.sec); curunit.update(hit.unit); caption.update(cap)
  unit-mark((sec: hit.sec, unit: hit.unit, cap: cap))
}

// ---------------- convergence line -------------------------------------------
// The chatimah in dark gold, both columns — "everyone re-gathers at the gold
// line, then turns together." The norm is explained in the front matter and
// on section openers (cue: parameter); pages carry only the gold line itself.
// (The lab's per-page turncue is dropped — question e, resolved.)
#let chatimah(tr, he)=block(breakable:false, {
  v(2pt)
  grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
    [#set par(leading:0.8em); #text(size:10pt, weight:"semibold", fill:GOLDD)[#tr]],
    text(font:"David Libre", lang:"he", dir:rtl, fill:GOLDD, weight:"medium", size:14.5pt)[#he])
});

// ---------------- page wrapper ------------------------------------------------
#let book(body)={
  set page(width:7in,height:10in,fill:PARCH, binding:right,
    margin:(outside:MARGIN-OUT,inside:0.85in,top:0.8in,bottom:0.85in),
    background: context{
      counter(footnote).update(0)   // footnotes restart each page
      if started.get(){
        let outer-right=calc.even(here().page())
        // rail flush to the trimmed edge (dx:0) — the glyph gutter is the
        // space left between it and the text block
        place(top+(if outer-right {right} else {left}), dy:RAIL-DY, rail)
      }
    },
    footer: context{
      let phys=here().page()                       // physical page — governs outer-edge placement
      let shown=started.get()                       // front matter (before first section) stays unnumbered
      let n=counter(page).at(here()).first()        // logical page number (reset to 1 at Kabbalat Shabbat)
      set text(size:8pt, fill:MUT, font:"Libertinus Serif")
      grid(columns:(1fr,auto,1fr),
        align(left)[#if shown and calc.odd(phys){[#n]}],
        align(center)[#text(fill:FAINT, size:7.5pt, tracking:1pt)[SHIREI SHABBAT]],
        align(right)[#if shown and calc.even(phys){[#n]}])
    })
  set text(font:"Libertinus Serif", size:11pt, fill:INK, lang:"en")
  set par(leading:0.62em)
  set footnote(numbering: "1")
  show footnote: set text(fill:GOLDD, weight:"semibold")   // in-text marker: small gold superscript
  show footnote.entry: set text(size:8pt, fill:MUT, weight:"regular")
  // A7 (layout CRITICAL): footnote entries must not split across a page turn.
  // Per-page counter reset (background, above) made continuations unnumbered
  // orphans (f9→10). Forbid breaking a single note across pages.
  show footnote.entry: set block(breakable:false)
  set footnote.entry(separator: line(length:30%, stroke:0.6pt+GOLD))
  body
}

// ---------------- section opener ----------------------------------------------
// cue: optional one-line gold-line-norm sentence rendered under the blurb
// (final copy from R4 / HOWTO-COPY.md). Default none — existing production
// calls compile unchanged.
#let sectionopener(idx, en, he, blurb, items, cue: none, epithet: none, compact: false)={
  // states BEFORE the pagebreak (page-start readers: footer);
  // the rail's <ss-unit> mark AFTER it, so it anchors to the opener page and
  // never claims the previous section's last page.
  cursec.update(idx); curunit.update(-1); caption.update("")
  started.update(true)
  pagebreak(weak:true)
  unit-mark((sec: idx, unit: -1, cap: ""))
  if compact {
    // (2026-07-06/07) Compact variant — folded in from the two former inline
    // copies in shirei-shabbat-FULL.typ (R6 dedupe). Tightened vertical
    // metrics so the opener and its first unit share one page; the cue is
    // tucked under the blurb inside the grid (the section list at left is
    // the taller cell, so the cue adds no page height).
    v(0.08in)
    text(size:25pt,weight:"bold",fill:TWID)[#en]; linebreak(); v(2pt)
    text(font:"David Libre",lang:"he",dir:rtl,size:21pt,weight:"bold",fill:GOLD)[#he]
    if epithet != none { v(4pt); text(size:10pt, style:"italic", fill:GOLDD)[#epithet] }
    v(8pt); line(length:100%, stroke:1.2pt+GOLD); v(12pt)
    grid(columns:(auto,1fr), column-gutter:26pt,
      box(width:2.3in)[
        #for (i,s) in SECTIONS.slice(0,4).enumerate(){
          if i==idx{
            grid(columns:(3pt,1fr), column-gutter:9pt,
              rect(fill:GOLD,width:3pt, height: (items.len()+1)*1.02em),
              stack(spacing:3.4pt,
                text(size:10pt,weight:"bold",fill:TWID,tracking:0.5pt)[#upper(s)],
                ..items.map(it=> text(size:8pt,fill:MUT)[#it])))
          } else { text(size:10pt,fill:MUT,tracking:0.5pt)[#upper(s)] }
          v(5pt)
        }
      ],
      [#set par(leading:0.72em, justify:true); #text(size:11pt)[#blurb]
       #if cue != none {
         v(14pt)
         stack(spacing:5pt,
           line(length:0.5in, stroke:0.8pt+GOLDD),
           text(size:9.5pt, style:"italic", fill:MUT)[#cue])
       }])
  } else {
    v(0.25in)
    text(size:30pt,weight:"bold",fill:TWID)[#en]; linebreak(); v(3pt)
    text(font:"David Libre",lang:"he",dir:rtl,size:26pt,weight:"bold",fill:GOLD)[#he]
    if epithet != none { v(5pt); text(size:11pt, style:"italic", fill:GOLDD)[#epithet] }
    v(12pt); line(length:100%, stroke:1.2pt+GOLD); v(20pt)
    grid(columns:(auto,1fr), column-gutter:26pt,
      box(width:2.3in)[
        #for (i,s) in SECTIONS.slice(0,4).enumerate(){
          if i==idx{
            grid(columns:(3pt,1fr), column-gutter:9pt,
              rect(fill:GOLD,width:3pt, height: (items.len()+1)*1.15em),
              stack(spacing:4.5pt,
                text(size:10.5pt,weight:"bold",fill:TWID,tracking:0.5pt)[#upper(s)],
                ..items.map(it=> text(size:8.5pt,fill:MUT)[#it])))
          } else { text(size:10.5pt,fill:MUT,tracking:0.5pt)[#upper(s)] }
          v(12pt)
        }
      ],
      [#set par(leading:0.8em, justify:true); #text(size:12pt)[#blurb]])
    if cue != none {
      v(18pt)
      block(width:100%, inset:(left: 2.3in + 26pt),
        stack(spacing:6pt,
          line(length:0.5in, stroke:0.8pt+GOLDD),
          text(size:9.5pt, style:"italic", fill:MUT)[#cue]))
    }
  }
}

// ---------------- prayer header -------------------------------------------------
// v2: resolves the unit via unit-lookup and updates curunit + caption
// automatically. The state updates are emitted BEFORE the (optional)
// pagebreak, so a newpage prayer's own first page already shows the right
// unit and caption. `unit:` overrides the title-based match; if nothing
// matches (back matter: Seasonal Insertions, Kiddush), the unit marker and
// caption are cleared rather than left stale.
#let startprayer(en, he, sec: "Kabbalat Shabbat", newpage: false, unit: none)={
  let hit=unit-lookup(en, unit: unit)
  let cap=if hit != none { CAPTIONS.at(hit.name, default:"") } else { "" }
  // state updates BEFORE the pagebreak (state-before-pagebreak rule) ...
  if hit != none {
    cursec.update(hit.sec)
    curunit.update(hit.unit)
    caption.update(cap)
  } else {
    curunit.update(-1)
    caption.update("")
  }
  if newpage { pagebreak(weak:true) }
  // ... the rail's mark AFTER it, so it anchors to the unit's first page
  // (sec: none for unmatched titles — the rail keeps the last real section
  // expanded but clears the unit marker and caption)
  if hit != none {
    unit-mark((sec: hit.sec, unit: hit.unit, cap: cap))
  } else {
    unit-mark((sec: none, unit: -1, cap: ""))
  }
  v(9pt)
  block(breakable:false, sticky:true, {
    eyebrow(sec); v(5pt)
    grid(columns:(1fr,auto), align:(left+bottom,right+bottom), column-gutter:12pt,
      text(size:18pt,weight:"bold",fill:TWID)[#en], hb(text(weight:"bold")[#he], size:19pt))
    v(4pt); line(length:100%, stroke:0.7pt+GOLD); v(9pt)
  })
}

// ---------------- body helpers (identical to pre-merge book.typ) ----------------
#let rubric(s)=block(width:100%, align(center, text(size:8.5pt, style:"italic", fill:MUT)[#s]))
#let stanza(tr, he, label: none)={
  block(breakable:false, {
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hb(he))
  }); v(3pt)
}
#let eng(s)={ v(1pt); text(size:9.5pt, style:"italic", fill:rgb("#2e2c26"))[#s]; v(4pt) }
#let note(s)={ footnote[#s] }
// english line with its teaching-note marker anchored inline at the end of the text
#let engn(s, n)={ v(1pt); text(size:9.5pt, style:"italic", fill:rgb("#2e2c26"))[#s#footnote(n)]; v(4pt) }

// seasonal insertion (recessive, inline) for small frequent swaps (mashiv haruach / morid hatal)
// COMPACTED 2026-07-06 (Daniel): the boxed treatment ate too much vertical
// space in G'vurot. Now a tiny one-line note behind a gold hairline —
// small-caps gold cue · translit · Hebrew on one line, English inlined at
// 7.5pt after an em-dash (wraps if it must). Same signature as before.
#let seasonal(cue, tr, he, en)={
  block(breakable:false, width:100%, inset:(left:7pt, y:1.5pt), stroke:(left:0.7pt+GOLD), {
    set par(leading:0.45em, justify:false)
    text(size:7pt, tracking:1pt, fill:GOLDD, weight:"bold")[#upper(cue)]
    h(8pt)
    text(size:8pt, style:"italic", fill:MUT)[#tr]
    h(8pt)
    hb(he, size:11pt)
    if en != "" { h(8pt); text(size:7.5pt, style:"italic", fill:MUT)[— #en] }
  }); v(4pt)
}
// marker pointing to the back-of-book Seasonal Insertions section
#let seasonmark(s)=text(size:7.5pt, fill:GOLDD, weight:"bold")[✦#h(0.16em)#s]
