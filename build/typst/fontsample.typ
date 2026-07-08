// Hebrew font comparison sheet — judge nikud clarity at reading size.
#set page(width: 8.5in, height: 11in, margin: 1in)
#set text(font: "Libertinus Serif", size: 11pt)

#align(center)[#text(size: 16pt, weight: "bold")[Shir Shabbat — Hebrew Font Comparison]]
#v(2pt)
#align(center)[#text(size: 9.5pt, fill: luma(90))[Same text in each candidate face. Judge nikud placement, the divine name יְהוָה, and clarity at 12–13pt. 2026-07-03]]
#v(14pt)

#let sample = "וְשָׁמְרוּ בְנֵי־יִשְׂרָאֵל אֶת־הַשַּׁבָּת · יְהוָה אֶחָד וּשְׁמוֹ אֶחָד · בּוֹאִי כַלָּה · מִזְמוֹר לְדָוִד"
#let fonts = (
  ("David Libre", "David Libre — Google (open license), the draft's divine-name style"),
  ("Frank Ruehl CLM", "Frank Ruehl CLM — Culmus; the classic Israeli book face"),
  ("Ezra SIL", "Ezra SIL — SIL; BHS scholarly standard, very explicit nikud"),
  ("Keter YG", "Keter YG — Culmus; Koren-adjacent, elegant"),
  ("David CLM", "David CLM — Culmus David cut"),
)

#for (fam, label) in fonts [
  #text(size: 9pt, weight: "bold", fill: rgb("#6b2d5c"))[#label]
  #v(2pt)
  #block(inset: (x: 4pt))[
    #text(font: fam, lang: "he", dir: rtl, size: 11pt)[#sample] \
    #v(3pt)
    #text(font: fam, lang: "he", dir: rtl, size: 13pt)[#sample] \
    #v(3pt)
    #text(font: fam, lang: "he", dir: rtl, size: 16pt)[#sample]
  ]
  #v(16pt)
]
