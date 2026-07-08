#import "../book.typ": *
// Colophon (panel v1.1, Wave 6, Daniel's requirement): the book's final page.
// Book furniture, not liturgy — no startprayer, no rail unit. Plain page in the
// Seasonal & Kiddush rail region. The creation-credit paragraph is the line that
// must survive forks (LICENSE.md is CC BY-NC-SA) — keep its wording intact.
#pagebreak()
#{
  v(0.3in)
  eyebrow("Colophon"); v(10pt)
  line(length:100%, stroke:1pt+GOLD); v(16pt)
  set par(leading:0.78em, justify:true)
  text(size:10.5pt)[
    #emph[Shirei Shabbat — Songs of Shabbat] was created by Rabbi Daniel Bogard of Central
    Reform Congregation, St. Louis: liturgy curated and arranged, translations,
    transliterations, teaching notes, and design. Communities are welcome to adapt this
    book for their own use under CC BY-NC-SA 4.0 — adaptations must retain this credit.
  ]
  v(12pt)
  text(size:10.5pt)[
    Hebrew texts follow the Masoretic text and standard siddurim, verified against
    Sefaria. Translations and transliterations are original to this siddur.
  ]
  v(12pt)
  text(size:10.5pt)[
    At CRC, the prayer for healing is sung to the Mi Shebeirach of Debbie Friedman and
    Drorah Setel (written 1987; © 1988), used by license; the public edition of this book
    prints the classical formula in its place.
  ]
  v(12pt)
  text(size:10.5pt)[
    Set in David Libre and Ezra SIL (Hebrew) and Libertinus Serif (English), each under
    the SIL Open Font License.
  ]
  v(12pt)
  text(size:10.5pt)[
    Typeset in Typst. This book's source lives at
    #emph[github.com/RavBogard/shirei-shabbat-siddur] — corrections welcome.
  ]
  v(1fr)
}
