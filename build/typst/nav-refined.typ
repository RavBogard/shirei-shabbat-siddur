#let INK=rgb("#1b1b24"); #let TWI=rgb("#2c3566"); #let TWID=rgb("#222a54")
#let GOLD=rgb("#bd8a2e"); #let PARCH=rgb("#fbf7ef"); #let MUT=rgb("#7d7a72"); #let FAINT=rgb("#b3ab9c")
#set text(font: "Libertinus Serif", size: 11pt, fill: INK)
#set par(leading: 0.62em)
#set page(width: 7in, height: 10in, fill: PARCH, margin:(x:0.9in, y:0.75in))

#let SECT=("Kabbalat Shabbat","Sh'ma & Her Blessings","Amidah","Concluding"); #let CUR=2
#let AM=("Silent Amidah","Vayechulu","Me'ein Sheva","Magen Avot"); #let ACUR=2
#let hb(s, size: 13pt)=text(font:"David Libre", lang:"he", dir:rtl, fill:TWID, size:size)[#s]
#let meta(s)=text(size:7.5pt, tracking:1.5pt, fill:rgb("#bdb7aa"))[#upper(s)]
#let he1="בָּרוּךְ אַתָּה יְהוָה אֱלֹהֵינוּ וֵאלֹהֵי אֲבוֹתֵינוּ וְאִמּוֹתֵינוּ, אֱלֹהֵי אַבְרָהָם אֱלֹהֵי יִצְחָק וֵאלֹהֵי יַעֲקֹב, אֱלֹהֵי שָׂרָה אֱלֹהֵי רִבְקָה אֱלֹהֵי לֵאָה אֱלֹהֵי רָחֵל אֱלֹהֵי בִּלְהָה וֵאלֹהֵי זִלְפָּה, הָאֵל הַגָּדוֹל הַגִּבּוֹר וְהַנּוֹרָא, אֵל עֶלְיוֹן קוֹנֵה שָׁמַיִם וָאָרֶץ."
#let tr1="Baruch atah Adonai Elohéinu ve'lohei avotéinu v'imotéinu — Elohei Avraham, Elohei Yitzchak, ve'lohei Ya'akov; Elohei Sarah, Elohei Rivkah, Elohei Leah, Elohei Rachel, Elohei Bilhah, ve'lohei Zilpah — ha'El hagadol hagibor v'hanora, El elyon konei shamáyim va'áretz."
#let en1="We bless the Source of Life, God of our ancestors — God of Abraham, Isaac, and Jacob; God of Sarah, Rebecca, Leah, Rachel, Bilhah, and Zilpah — the great, the mighty, the awesome; God most high, maker of heaven and earth."
#let title()=grid(columns:(1fr,auto), align:(left+bottom,right+bottom), column-gutter:12pt,
  text(size:19pt, weight:"bold", fill:TWID)[Me'ein Sheva], hb(text(weight:"bold")[מֵעֵין שֶׁבַע], size:20pt))
#let body()={grid(columns:(1fr,1.05fr), column-gutter:20pt, align:(left+top,right+top),
  text(size:9pt, style:"italic", fill:rgb("#4a4a52"))[#tr1], hb(he1))
  v(6pt); text(size:10pt, style:"italic", fill:rgb("#2e2c26"))[#en1]}

// ===== VARIANT A : refined OUTER contents rail (collapses; current expands) =====
#set page(margin:(outside:1.35in, inside:0.75in, y:0.75in))
#{
  meta("Variant A — outer contents rail, refined"); v(10pt); title(); v(12pt); body()
  place(right+horizon, dx:0in, box(width:1.15in)[
    #line(start:(0pt,0pt), end:(0pt,3.1in), stroke:0.5pt+rgb("#e0d8c7"))
    #place(top+left, dx:10pt, dy:0pt, box(width:1.02in)[
      #for (i,s) in SECT.enumerate() {
        if i==CUR {
          block(spacing:3pt, {
            grid(columns:(2pt,1fr), column-gutter:5pt,
              rect(fill:GOLD, width:2pt, height:0.5em+ (AM.len()*10pt)),
              stack(spacing:3.5pt,
                text(size:7.5pt, weight:"bold", fill:TWID, tracking:0.4pt)[#upper(s)],
                ..AM.enumerate().map(((j,a))=> text(size:6.6pt, fill: if j==ACUR {GOLD} else {MUT},
                    weight: if j==ACUR {"bold"} else {"regular"})[#a])))
          })
        } else { text(size:7pt, fill:FAINT, tracking:0.4pt)[#upper(s)] }
        v(9pt)
      }
    ])
  ])
}
#pagebreak()

// ===== VARIANT B : refined TOP typographic breadcrumb =====
#set page(margin:(x:0.9in, y:0.75in))
#{
  meta("Variant B — top breadcrumb, typographic (no pills)"); v(12pt)
  // line 1: the four sections
  SECT.enumerate().map(((i,s))=> text(size:8.5pt, tracking:0.3pt,
    fill: if i==CUR {GOLD} else {FAINT}, weight: if i==CUR {"bold"} else {"regular"}, s)).join(
    text(fill:rgb("#d8d0c0"))[   \/   ])
  v(6pt)
  // line 2: current section contents
  text(size:7.5pt, fill:MUT, style:"italic")[within Amidah:  ]
  AM.enumerate().map(((j,a))=> text(size:7.5pt, fill: if j==ACUR {GOLD} else {FAINT},
    weight: if j==ACUR {"bold"} else {"regular"}, a)).join(text(fill:rgb("#d8d0c0"))[  ·  ])
  v(9pt); line(length:100%, stroke:0.6pt+GOLD); v(14pt)
  title(); v(12pt); body()
}
#pagebreak()

// ===== VARIANT C : hybrid — outer sections rail + prayer breadcrumb by the title =====
#set page(margin:(outside:1.35in, inside:0.75in, y:0.75in))
#{
  meta("Variant C — hybrid: outer sections + prayer breadcrumb at title"); v(12pt)
  // prayer breadcrumb near title
  text(size:8pt, fill:MUT, tracking:0.3pt)[Amidah] ; text(size:8pt, fill:FAINT)[  ›  ] ; text(size:8pt, fill:GOLD, weight:"bold")[Me'ein Sheva] ; text(size:7.5pt, fill:FAINT)[  (3rd of 4)]
  v(7pt); title(); v(12pt); body()
  // outer rail: sections only, current highlighted, arc top->bottom
  place(right+horizon, dx:0in, box(width:1.15in)[
    #line(start:(0pt,0pt), end:(0pt,2.6in), stroke:0.5pt+rgb("#e0d8c7"))
    #place(top+left, dx:10pt, dy:0pt, box(width:1.02in)[
      #for (i,s) in SECT.enumerate() {
        if i==CUR {
          grid(columns:(2pt,1fr), column-gutter:5pt, rect(fill:GOLD,width:2pt,height:1.4em),
            text(size:7.5pt, weight:"bold", fill:TWID, tracking:0.4pt)[#upper(s)])
        } else { text(size:7pt, fill:FAINT, tracking:0.4pt)[#upper(s)] }
        v(11pt)
      }
    ])
  ])
}
