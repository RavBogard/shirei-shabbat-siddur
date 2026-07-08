// Shir Shabbat Siddur — Typst spike template
// Page architecture: wayfinding sidebar (outer edge, mirrored verso/recto) + commentary footnotes.

#let SECTIONS = ("Candle Lighting", "Kabbalat Shabbat", "Sh'ma & Blessings", "Amidah", "Concluding")
#let ACCENT = rgb("#6b2d5c")

#let make-rail(current) = stack(dir: ltr, spacing: 8pt,
  ..SECTIONS.map(s => {
    let cur = s == current
    box(fill: if cur { ACCENT } else { luma(236) },
        inset: (x: 7pt, y: 3pt), radius: 2pt,
        text(size: 7pt, tracking: 0.4pt,
             fill: if cur { white } else { luma(120) },
             weight: if cur { "bold" } else { "regular" }, s))
  })
)

#let siddur(size: "6x9", hebrew-font: "David Libre", body) = {
  let dims = if size == "7x10" { (7in, 10in) } else { (6in, 9in) }
  set page(
    width: dims.at(0), height: dims.at(1),
    margin: (outside: 1.0in, inside: 0.72in, top: 0.7in, bottom: 0.8in),
    background: context {
      let p = here().page()
      let outer-right = calc.odd(p)
      place(
        (if outer-right { right } else { left }) + horizon,
        dx: if outer-right { -0.09in } else { 0.09in },
        rotate(if outer-right { -90deg } else { 90deg }, reflow: true, make-rail("Kabbalat Shabbat"))
      )
    },
    footer: context {
      let p = here().page()
      set text(size: 8pt, fill: luma(150), font: "Libertinus Serif")
      if calc.odd(p) { align(right)[Shir Shabbat  ·  #p] }
      else { align(left)[#p  ·  Shir Shabbat] }
    },
  )
  set text(font: "Libertinus Serif", size: 10.5pt, lang: "en")
  set par(justify: false, leading: 0.6em)
  set footnote(numbering: "a")
  show footnote.entry: set text(size: 8.5pt, fill: luma(60))
  set footnote.entry(separator: line(length: 38%, stroke: 0.5pt + luma(160)))
  body
}

#let hpairs(pairs, hf) = grid(
  columns: (1fr, 1fr), column-gutter: 14pt, row-gutter: 4pt,
  ..pairs.map(pr => (
    align(center + horizon, text(size: 8.5pt, style: "italic", fill: luma(55))[#pr.at("tr")]),
    align(center + horizon, text(font: hf, lang: "he", dir: rtl, size: 12pt)[#pr.at("he")]),
  )).flatten()
)

#let unit(order: 0, title-en: "", title-he: "", variant: none,
          kavanah: "", rows: (), translation: (), commentary: (),
          hebrew-font: "David Libre") = {
  block(breakable: true, width: 100%, {
    block(breakable: false, {
      grid(columns: (1fr, auto), column-gutter: 10pt, align: (left + bottom, right + bottom),
        text(size: 15pt, weight: "bold")[#title-en],
        {
          text(size: 17pt, weight: "bold", font: hebrew-font, lang: "he", dir: rtl)[#title-he]
          if commentary.len() > 0 { footnote[#commentary.at(0)] }
        }
      )
      v(3pt)
      line(length: 100%, stroke: 0.6pt + ACCENT.lighten(35%))
      v(5pt)
      if kavanah != "" {
        text(style: "italic", size: 9.5pt, fill: luma(70))[#kavanah]
        v(6pt)
      }
    })
    for b in rows {
      if b.at("label") != none {
        v(2pt)
        text(size: 8pt, weight: "bold", tracking: 0.6pt, fill: ACCENT)[#upper(b.at("label"))]
        v(1pt)
      }
      hpairs(b.at("pairs"), hebrew-font)
      v(4pt)
    }
    v(1pt)
    line(length: 32%, stroke: 0.4pt + luma(210))
    v(3pt)
    for t in translation {
      if t.at("label") != none {
        text(weight: "bold", style: "italic", size: 8.5pt)[#(t.at("label")): ]
      }
      text(style: "italic", size: 8.5pt, fill: luma(45))[#t.at("text")]
      parbreak()
    }
    if commentary.len() > 1 {
      for k in range(1, commentary.len()) { footnote[#commentary.at(k)] }
    }
  })
  v(12pt)
  align(center, text(fill: ACCENT.lighten(20%), size: 9pt)[✦])
  v(12pt)
}
