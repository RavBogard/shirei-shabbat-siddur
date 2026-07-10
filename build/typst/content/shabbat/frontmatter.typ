#import "../../book.typ": *
// ===================== TITLE PAGE =====================
#{
  set align(center)
  v(1fr)
  text(font:"David Libre", lang:"he", dir:rtl, size:44pt, weight:"bold", fill:GOLD)[שִׁירֵי שַׁבָּת]
  v(12pt)
  text(size:34pt, weight:"bold", fill:TWID)[Shirei Shabbat]
  v(3pt)
  text(size:15pt, style:"italic", fill:MUT)[Songs of Shabbat]
  v(22pt); line(length:28%, stroke:1pt+GOLD); v(20pt)
  text(size:12.5pt, fill:INK)[A Friday-Night Siddur]
  v(6pt)
  text(size:12.5pt, fill:INK)[by Rabbi Daniel Bogard]
  v(4pt)
  text(size:10.5pt, fill:MUT)[Central Reform Congregation · Saint Louis]
  v(1fr)
  hb(text(weight:"bold")[מִזְמוֹר שִׁיר לְיוֹם הַשַּׁבָּת], size:14pt)
  v(4pt)
  text(size:10pt, style:"italic", fill:MUT)[A song for the day of Shabbat.]
  v(0.4in)
}
#pagebreak()

// ===================== WELCOME / HOW TO USE =====================
#{
  v(0.2in)
  eyebrow("Welcome"); v(6pt)
  text(size:25pt, weight:"bold", fill:TWID)[This book is for you]
  v(10pt); line(length:100%, stroke:1pt+GOLD); v(16pt)
  set par(leading:0.82em, justify:true)
  text(size:11pt)[
    However you have come to this room — whatever you believe or doubt, whatever your background,
    whoever you love, however you name yourself, whether you have prayed a thousand Friday nights or none — you belong here, and
    this book is yours. It is meant to be sung from, wondered at, and learned from, all at once.
  ]
  v(10pt)
  block(width:100%, inset:11pt, radius:3pt, fill:rgb("#f3eddf"), stroke:0.6pt+GOLDD)[
    #set par(leading:0.72em, justify:true)
    #text(size:10.5pt, weight:"bold", fill:TWID)[If tonight is your first time — or your first time in years]
    #v(5pt)
    #text(size:9.5pt)[There is nothing to get wrong. When the community stands or sits, the rabbi will say so — you cannot miss a cue that is spoken aloud. Sing what you can; hum what you can’t; let the rest be music. In the English letters, #emph[ch] is the soft sound at the back of the throat (as in #emph[Bach]), and an apostrophe (#emph[b’racha]) is just a quick half-breath of a vowel. If you are not Jewish: we are glad you are here. Everything in this book is open to you — join in all of it, some of it, or simply be with us. That is participation too. And the words themselves? Some of us believe every one; some of us sing them as poetry, or memory, or hope. The book holds all of us.]
    #v(5pt)
    #text(size:9.5pt, style:"italic", fill:MUT)[And one thing to know at the door: like all Hebrew books, this one opens from the right — what feels like the back is the front.]
  ]
  v(12pt)
  eyebrow("How the page works"); v(7pt)
  set par(leading:0.72em)
  text(size:10.5pt)[
    On each page, the *Hebrew* and a *transliteration* — the sounds in
    English letters — run side by side, so anyone can join the singing aloud. The *translation* sits
    just below, in italics; it is faithful but unafraid to be a little free where that lets it sing.
  ]
  v(8pt)
  text(size:10.5pt)[
    A small note at the foot of many prayers offers a piece of their story — a way to
    learn a little Torah simply by turning the pages.
  ]
  v(9pt)
  eyebrow("About the words"); v(7pt)
  text(size:10.5pt)[
    Where the Hebrew names God, the transliteration keeps the sound our people have sung for
    centuries — #emph[Adonai] — and the translation steps back in reverence: #emph[HaShem], "the Name,"
    or simply #emph[the One]. Where the Hebrew reaches for the images of an ancient royal court —
    king, lord, master — our English reaches for what we believe those words were always pointing
    at: Presence, Source, the One who was and is and will be. Where a prayer’s whole song is God’s
    sovereignty — as in Aleinu, or the crown the High Holy Days keep — the English lets the older image
    stand. The Hebrew is untouched; the English is a door, not a wall — walk through whichever way you can.
  ]
  v(8pt)
  text(size:10.5pt)[
    The rail on the outer edge is a map: it shows the four parts of the evening — Kabbalat Shabbat,
    the Sh’ma and Its Blessings, the Amidah, and the Concluding prayers — with the seasonal insertions
    and Kiddush kept at the back, and it quietly marks where you are within them.
  ]
}
#pagebreak()

// ===================== HOW TO USE THIS SIDDUR (spread) =====================
// Verbatim from liturgy-map/HOWTO-COPY.md §1 — fuller §1(b) ritual-mark paragraph
// (the tightened alternative in the notes is NOT used), per DECISIONS-LOG.md
// "HOWTO-COPY Approved" (gate-2 final read, 2026-07-05). No legend block, no
// inside-cover note (cut by ruling).
#{
  v(0.2in)
  eyebrow("How to use this siddur"); v(6pt)
  text(size:25pt, weight:"bold", fill:TWID)[Finding your way through the evening]
  v(10pt); line(length:100%, stroke:1pt+GOLD); v(16pt)
  set par(leading:0.78em, justify:true)

  eyebrow("The rail on the outer edge"); v(7pt)
  text(size:10.5pt)[
    Look to the outer edge of any page and you’ll find a rail — a small map of the whole evening. It
    lists the four parts of our service, top to bottom, in the order we move through them: *Kabbalat
    Shabbat*, welcoming Shabbat in; the *Sh’ma and Its Blessings*; the *Amidah*; and the *Concluding*
    prayers. Wherever we are right now, that section opens up and shows its own prayers underneath,
    one after another, with the one we’re singing marked by a slim gold line. The other three
    sections wait quietly above and below, so you can always see not just where you are but where
    you’ve been and where we’re headed.
  ]
  v(10pt)

  eyebrow("The staircase on the fore-edge"); v(7pt)
  text(size:10.5pt)[
    Come in late? Close the book and glance at its edge. The dark tab marking tonight’s section sits
    a little lower for each part we’ve passed — a small staircase you can read without opening a
    thing. Find our stair, open to it, and you’re home.
  ]
  v(10pt)

  eyebrow("The gold mark in the margin"); v(7pt)
  text(size:10.5pt)[
    Here and there in the margin you’ll see a single small gold mark. It points to an inherited way
    of praying with the body — a bow, a covering of the eyes, a few steps taken inward — offered,
    never required. The words beside it tell you what some of us do, and quietly why. Nothing here
    asks anything of you: do what your body allows, and let the rest simply be there, the way an old
    melody is there whether or not you know the tune.
  ]
  v(10pt)

  eyebrow("The gold line"); v(7pt)
  text(size:10.5pt)[
    Now and then the words scatter — some of us read ahead, some linger, some are still finding the
    page. That’s fine. From the Sh’ma and Its Blessings onward, most prayers close with a line set
    apart in gold: gold in the margins points, but gold in the words gathers. Wherever you’ve
    wandered, we arrive there together, and move on together. And that slim italic line tucked beneath
    the rail simply names what’s happening in the moment, in case you’d like the words for it.
  ]
}
#pagebreak()
// (2026-07-07, Session 3 re-pagination) Deliberate blank verso. Wave 4 grew the
// front matter to five pages, which flipped recto/verso parity for the whole
// book: sung units that sat on one open spread in v7 (L'cha Dodi, Sh'ma +
// V'ahavta, Aleinu...) landed across physical page turns. This blank sixth
// page restores the v7 spread parity book-wide (folio = PDF page - 6).
// (2026-07-09, v1.1 · D3) Re-evaluated and KEPT: D3-B targeted dropping this
// blank for -2pp, but the how-to-use block still needs two pages (the gold-line
// paragraph overflows folio 5), so dropping the blank would leave 5 front-matter
// pages (odd) and flip every spread. Per the ruling, abandon the -2 to keep the
// blank and parity. The redundant "One more small thing" para WAS cut (its one
// new clause folded into "The gold line").
#pagebreak()
