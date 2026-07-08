// Wayfinding option studies — same prayer (Me'ein Sheva opening), 4 nav treatments.
#let INK=rgb("#1b1b24"); #let TWI=rgb("#2c3566"); #let TWID=rgb("#222a54")
#let GOLD=rgb("#bd8a2e"); #let PARCH=rgb("#fbf7ef"); #let MUT=rgb("#6d6a63")
#let LT=rgb("#ece9e1")
#set page(width: 7in, height: 10in, margin: (x: 0.9in, top: 0.7in, bottom: 0.7in), fill: PARCH)
#set text(font: "Libertinus Serif", size: 11pt, fill: INK)
#set par(leading: 0.62em)

#let SECT = ("Kabbalat Shabbat","Sh'ma & Her Blessings","Amidah","Concluding")
#let CUR = 2  // Amidah
#let AM = ("Silent Amidah","Vayechulu","Me'ein Sheva","Magen Avot")
#let ACUR = 2 // Me'ein Sheva

#let hb(s, size: 13pt) = text(font: "David Libre", lang:"he", dir: rtl, fill: TWID, size: size)[#s]
#let meta(s) = text(size: 7.5pt, tracking: 1.5pt, fill: rgb("#b8b2a5"))[#upper(s)]

#let he1 = "בָּרוּךְ אַתָּה יְהוָה אֱלֹהֵינוּ וֵאלֹהֵי אֲבוֹתֵינוּ וְאִמּוֹתֵינוּ, אֱלֹהֵי אַבְרָהָם אֱלֹהֵי יִצְחָק וֵאלֹהֵי יַעֲקֹב, אֱלֹהֵי שָׂרָה אֱלֹהֵי רִבְקָה אֱלֹהֵי לֵאָה אֱלֹהֵי רָחֵל אֱלֹהֵי בִּלְהָה וֵאלֹהֵי זִלְפָּה, הָאֵל הַגָּדוֹל הַגִּבּוֹר וְהַנּוֹרָא, אֵל עֶלְיוֹן קוֹנֵה שָׁמַיִם וָאָרֶץ."
#let tr1 = "Baruch atah Adonai Elohéinu ve'lohei avotéinu v'imotéinu — Elohei Avraham, Elohei Yitzchak, ve'lohei Ya'akov; Elohei Sarah, Elohei Rivkah, Elohei Leah, Elohei Rachel, Elohei Bilhah, ve'lohei Zilpah — ha'El hagadol hagibor v'hanora, El elyon konei shamáyim va'áretz."
#let en1 = "We bless the Source of Life, God of our ancestors — God of Abraham, Isaac, and Jacob; God of Sarah, Rebecca, Leah, Rachel, Bilhah, and Zilpah — the great, the mighty, the awesome; God most high, maker of heaven and earth."

#let title() = grid(columns: (1fr, auto), align:(left+bottom, right+bottom), column-gutter: 12pt,
  text(size: 19pt, weight:"bold", fill: TWID)[Me'ein Sheva], hb(text(weight:"bold")[מֵעֵין שֶׁבַע], size: 20pt))
#let body() = {
  grid(columns:(1fr,1.05fr), column-gutter: 20pt, align:(left+top,right+top),
    text(size:9pt, style:"italic", fill: rgb("#4a4a52"))[#tr1], hb(he1))
  v(6pt); text(size:10pt, style:"italic", fill: rgb("#2e2c26"))[#en1]
}

// section tabs row
#let sectrow() = grid(columns: (auto,)*4, column-gutter: 5pt,
  ..SECT.enumerate().map(((i,s)) => box(fill: if i==CUR {TWI} else {LT},
    inset:(x:8pt,y:4pt), radius: 2pt,
    text(size:7.5pt, fill: if i==CUR {white} else {MUT}, weight: if i==CUR {"bold"} else {"regular"}, s))))
// expanded current-section items
#let subrow() = {
  text(size: 7.5pt, fill: MUT)[In Amidah:  ]
  AM.enumerate().map(((i,s)) => text(size:7.5pt, fill: if i==ACUR {GOLD} else {rgb("#9a968d")},
    weight: if i==ACUR {"bold"} else {"regular"}, s)).join(text(fill: rgb("#c9c4b8"))[  ·  ])
}

// ---------- OPTION 1 : expanding hierarchy at TOP ----------
#{
  meta("Option 1 — expanding guide at top (sections + current section expands)")
  v(10pt); sectrow(); v(6pt); subrow()
  v(10pt); line(length:100%, stroke: 0.6pt+GOLD); v(14pt)
  title(); v(12pt); body()
}
#pagebreak()

// ---------- OPTION 2 : expanding hierarchy at BOTTOM ----------
#{
  meta("Option 2 — clean top, expanding guide at foot")
  v(12pt); title(); v(12pt); body()
  place(bottom, dy: 0pt, {
    line(length:100%, stroke: 0.5pt+rgb("#d8d2c4")); v(6pt)
    sectrow(); v(5pt); subrow()
  })
}
#pagebreak()

// ---------- OPTION 3 : progress spine at TOP ----------
#{
  meta("Option 3 — progress spine (visual arc) at top")
  v(12pt)
  // spine: 4 segments
  grid(columns:(1fr,)*4, column-gutter: 3pt, ..range(4).map(i => box(
    fill: if i==CUR {GOLD} else {LT}, height: 5pt, radius: 1pt, width: 100%)[]))
  v(4pt)
  grid(columns:(1fr,)*4, column-gutter: 3pt, ..SECT.enumerate().map(((i,s)) => align(center,
    text(size:7pt, fill: if i==CUR {TWID} else {MUT}, weight: if i==CUR {"bold"} else {"regular"}, s))))
  v(3pt); align(center, text(size:7.5pt, fill: GOLD, style:"italic")[Me'ein Sheva — 3rd of 4 in the Amidah])
  v(14pt); line(length:100%, stroke:0.6pt+GOLD); v(12pt)
  title(); v(12pt); body()
}
#pagebreak()

// ---------- OPTION 4 : legible outer edge (horizontal, collapses) ----------
#{
  meta("Option 4 — outer edge, horizontal & collapsing (no rotation)")
  // outer tabs stacked, current expands
  place(right+horizon, dx: 0.55in, {
    stack(dir: ttb, spacing: 6pt, ..SECT.enumerate().map(((i,s)) => {
      let short = ("Kab. Shabbat","Sh'ma","Amidah","Concluding").at(i)
      if i==CUR {
        box(fill: TWI, inset:(x:7pt,y:5pt), radius:2pt, stack(spacing:2pt,
          text(size:8pt, fill:white, weight:"bold")[Amidah],
          text(size:6.5pt, fill: GOLD)[Me'ein Sheva]))
      } else {
        box(fill: LT, inset:(x:6pt,y:3pt), radius:2pt, text(size:6.5pt, fill: MUT)[#short])
      }
    }))
  })
  v(12pt); title(); v(12pt); body()
}
