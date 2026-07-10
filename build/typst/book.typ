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

// ---------------- opt-in draft build-stamp (off by default) ------------------
// The published edition and check.sh (no flags) print nothing extra. Enable with:
//   --input draft=true --input "btime=2026-07-09 13:40" --input "bsha=abc1234"
// Compose the mid-dot in Typst; keep exotic glyphs out of the shell (see the
// brief's stamp mechanism). btime/bsha are plain ASCII passed from the caller.
#let DRAFT = sys.inputs.at("draft", default:"false")
#let BTIME = sys.inputs.at("btime", default:none)
#let BSHA  = sys.inputs.at("bsha",  default:none)

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

// ---------------- edition data (AR-1, ARCH W2 2026-07-09) --------------------
// The volume-specific data — UNITS registry, ALIASES, CAPTIONS, wordmark, title,
// opener-count — used to live here as module globals. It now lives in a per-
// volume manifest (build/typst/editions/<volume>.typ) passed to book() via
// `#show: book.with(edition: EDITION)`. book() stores it in the `ss-edition`
// state (see below); unit-lookup, the rail, submark, startprayer, sectionopener,
// and the footer read it through that state. book.typ stores no volume of its
// own. See editions/shabbat-maariv.typ for the evening book's manifest.

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
// AR-1 (ARCH W2): the active edition manifest, set once by book() at body start
// and read by unit-lookup / rail / submark / startprayer / sectionopener / footer
// via context. Constant for the whole document, so reading it is layout-stable.
#let ss-edition=state("ss-edition", none)
// Page-counter reset, extracted so the entry file owns "pagination starts here"
// (AR-1). Called once, at the first numbered page (Kabbalat Shabbat).
#let start-pagination()=counter(page).update(1)
// invisible page-anchored mark the rail queries for; value is a dict
// (sec: int|none, unit: int, cap: str)
#let unit-mark(v)=[#metadata(v) <ss-unit>]
// P1 (v1.1): folio of a unit's first page, by (sec, unit). Reads the same
// page-anchored <ss-unit> marks the rail uses (startprayer + submark drop one
// per unit). Returns the logical page number — which equals the printed folio,
// since the page counter resets at Kabbalat Shabbat. The opener precedes its
// units, so this is a forward reference; Typst resolves it in its fixed-point
// layout passes. MUST be called inside #context. Returns none if no mark yet.
#let unit-folio(sec, unit)={
  let ms=query(<ss-unit>).filter(m => m.value.sec==sec and m.value.unit==unit)
  if ms.len()>0 { counter(page).at(ms.first().location()).first() } else { none }
}

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
#let unit-lookup(ed, en, unit: none)={
  let stem = lower(if unit != none { unit } else { en.split("·").at(0) })
    .trim().replace("\u{2019}", "'")
  if stem in ed.aliases { stem = lower(ed.aliases.at(stem)) }
  let hit = none
  for (i, s) in ed.units.enumerate() {
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
  let ed=ss-edition.get()
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
    let s=ed.units.at(i)
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
    for i in range(ed.units.len()) { entry(i) }
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
#let submark(name, id: none)=context{
  let ed=ss-edition.get()
  let hit=unit-lookup(ed, name)
  assert(hit != none, message: "submark(): '" + name + "' not found in UNITS/ALIASES")
  let cap=ed.captions.at(hit.name, default:"")
  cursec.update(hit.sec); curunit.update(hit.unit); caption.update(cap)
  // AR-3: optional stable unit id, recorded only when supplied (byte-identical when absent)
  let m=(sec: hit.sec, unit: hit.unit, cap: cap)
  if id != none { m.insert("id", id) }
  unit-mark(m)
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
#let book(body, edition: none)={
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
      let ed=ss-edition.get()                        // wordmark from the edition manifest (AR-1)
      set text(size:8pt, fill:MUT, font:"Libertinus Serif")
      grid(columns:(1fr,auto,1fr),
        align(left)[#if shown and calc.odd(phys){[#n]}],
        align(center)[#if phys != 1 {
          text(fill:FAINT, size:7.5pt, tracking:1pt)[#ed.wordmark]
          if DRAFT == "true" {
            linebreak()
            text(fill:FAINT, size:7pt)[built #BTIME · git #BSHA]
          }
        }],
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
  // AR-1: publish the edition manifest before any body content, so every page's
  // rail/footer/helpers read it. It precedes all body nodes (hence every page),
  // exactly like `started` — the frontmatter page needs neither, and shows
  // neither, so page 1 is unaffected.
  ss-edition.update(edition)
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
        #context{ let ed=ss-edition.get(); for (i,s) in ed.sections.slice(0,ed.opener-count).enumerate(){
          if i==idx{
            grid(columns:(3pt,1fr), column-gutter:9pt,
              rect(fill:GOLD,width:3pt, height: (items.len()+1)*1.02em),
              stack(spacing:3.4pt,
                text(size:10pt,weight:"bold",fill:TWID,tracking:0.5pt)[#upper(s)],
                ..items.enumerate().map(((j,it))=> text(size:8pt,fill:MUT)[#it#h(1fr)#context{ let f=unit-folio(idx,j); if f!=none [#text(fill:GOLDD)[#f]] }])))
          } else { text(size:10pt,fill:MUT,tracking:0.5pt)[#upper(s)] }
          v(5pt)
        } }
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
        #context{ let ed=ss-edition.get(); for (i,s) in ed.sections.slice(0,ed.opener-count).enumerate(){
          if i==idx{
            grid(columns:(3pt,1fr), column-gutter:9pt,
              rect(fill:GOLD,width:3pt, height: (items.len()+1)*1.15em),
              stack(spacing:4.5pt,
                text(size:10.5pt,weight:"bold",fill:TWID,tracking:0.5pt)[#upper(s)],
                ..items.enumerate().map(((j,it))=> text(size:8.5pt,fill:MUT)[#it#h(1fr)#context{ let f=unit-folio(idx,j); if f!=none [#text(fill:GOLDD)[#f]] }])))
          } else { text(size:10.5pt,fill:MUT,tracking:0.5pt)[#upper(s)] }
          v(12pt)
        } }
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
#let startprayer(en, he, sec: "Kabbalat Shabbat", newpage: false, unit: none, id: none)={
  // state updates BEFORE the pagebreak (state-before-pagebreak rule); computed
  // inside context so hit/cap can read the edition manifest. The block emits
  // only invisible state-update nodes — same position/behavior as the former
  // plain updates, so layout is unchanged.
  context {
    let ed=ss-edition.get()
    let hit=unit-lookup(ed, en, unit: unit)
    let cap=if hit != none { ed.captions.at(hit.name, default:"") } else { "" }
    if hit != none {
      cursec.update(hit.sec)
      curunit.update(hit.unit)
      caption.update(cap)
    } else {
      curunit.update(-1)
      caption.update("")
    }
  }
  if newpage { pagebreak(weak:true) }
  // ... the rail's mark AFTER it, so it anchors to the unit's first page
  // (sec: none for unmatched titles — the rail keeps the last real section
  // expanded but clears the unit marker and caption)
  context {
    let ed=ss-edition.get()
    let hit=unit-lookup(ed, en, unit: unit)
    let cap=if hit != none { ed.captions.at(hit.name, default:"") } else { "" }
    // AR-3: optional stable unit id, recorded in the mark only when supplied so
    // the dict is byte-for-byte unchanged when absent (the current evening book).
    if hit != none {
      let m=(sec: hit.sec, unit: hit.unit, cap: cap)
      if id != none { m.insert("id", id) }
      unit-mark(m)
    } else {
      let m=(sec: none, unit: -1, cap: "")
      if id != none { m.insert("id", id) }
      unit-mark(m)
    }
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
// D2 (marooned footnotes): same english line, but the teaching note prints
// IN FLOW directly beneath it instead of as a #footnote that pins to the page
// floor. Use only on short-unit pages where the lone floor note would sit under
// a void — here the leftover space falls below the note and reads as bottom
// margin. Mirrors the footnote entry look exactly (30%-width gold rule + 8pt
// MUT, see the show rules ~line 385): no marker number, since the note is
// adjacent to its line. Keep it as the unit's last element on the page.
#let engn-near(s, n)={
  v(1pt); text(size:9.5pt, style:"italic", fill:rgb("#2e2c26"))[#s]; v(8pt)
  block(breakable:false, width:100%, {
    line(length:30%, stroke:0.6pt+GOLD); v(3pt)
    set par(leading:0.5em, justify:false)
    text(size:8pt, fill:MUT)[#n]
  }); v(4pt)
}
// labeled variants for L'cha Dodi-style English (Wave 3 · T7): a compact inline
// small-caps tag before the line, NOT a separate eyebrow block, so it never adds
// line-height / reflows the spread.
#let engl(label, s)={ v(1pt); text(size:9.5pt, style:"italic", fill:rgb("#2e2c26"))[#text(size:7pt, tracking:0.5pt, fill:GOLDD)[#smallcaps(label)] #h(4pt) #s]; v(4pt) }
#let engnl(label, s, n)={ v(1pt); text(size:9.5pt, style:"italic", fill:rgb("#2e2c26"))[#text(size:7pt, tracking:0.5pt, fill:GOLDD)[#smallcaps(label)] #h(4pt) #s#footnote(n)]; v(4pt) }

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
