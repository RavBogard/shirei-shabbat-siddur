// Shir Shabbat Siddur — design beta (Me'ein Sheva, with imahot + Bilhah & Zilpah).
#let INK   = rgb("#1b1b24")
#let TWI   = rgb("#2c3566")
#let TWID  = rgb("#222a54")
#let GOLD  = rgb("#bd8a2e")
#let PARCH = rgb("#fbf7ef")
#let MUT   = rgb("#6d6a63")

#let MOVES = ("Kabbalat Shabbat", "Sh'ma & Her Blessings", "Amidah", "Concluding")
#let rail(current) = stack(dir: ltr, spacing: 7pt,
  ..MOVES.map(s => {
    let cur = s == current
    box(fill: if cur { TWI } else { rgb("#ece9e1") }, inset: (x: 8pt, y: 3.5pt), radius: 2pt,
        text(size: 7pt, tracking: 0.4pt, fill: if cur { white } else { MUT },
             weight: if cur { "bold" } else { "regular" }, s))
  }))

#set page(width: 7in, height: 10in, margin: (outside: 0.95in, inside: 0.75in, top: 0.8in, bottom: 0.85in),
  fill: PARCH,
  background: context {
    let p = here().page(); let outer-right = calc.odd(p)
    place((if outer-right { right } else { left }) + horizon,
      dx: if outer-right { -0.10in } else { 0.10in },
      rotate(if outer-right { -90deg } else { 90deg }, reflow: true, rail("Amidah")))
  })
#set text(font: "Libertinus Serif", size: 11pt, fill: INK, lang: "en")
#set par(leading: 0.62em)

#let hb(s, size: 13.5pt) = text(font: "David Libre", lang: "he", dir: rtl, fill: TWID, size: size)[#s]
#let tr(s) = text(size: 9pt, style: "italic", fill: rgb("#4a4a52"))[#s]
#let en(s) = text(size: 10pt, style: "italic", fill: rgb("#2e2c26"))[#s]
#let eyebrow(s) = text(size: 7.5pt, tracking: 2pt, fill: GOLD, weight: "bold")[#upper(s)]

#let stanza(label, translit, hebrew, english) = {
  block(breakable: false, {
    eyebrow(label); v(4pt)
    grid(columns: (1fr, 1.05fr), column-gutter: 20pt, align: (left + top, right + top),
      tr(translit), hb(hebrew))
    v(6pt)
    en(english)
  })
  v(13pt)
}

// ---------- PAGE 1 : MOVEMENT OPENER (Amidah) ----------
#{
  v(0.2in)
  eyebrow("Movement Three"); v(6pt)
  text(size: 30pt, weight: "bold", fill: TWID)[The Standing Prayer]
  linebreak(); v(3pt)
  text(font: "David Libre", lang: "he", dir: rtl, size: 26pt, weight: "bold", fill: GOLD)[עֲמִידָה]
  v(10pt); line(length: 100%, stroke: 1.2pt + GOLD); v(16pt)
  grid(columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto), align: horizon + center, column-gutter: 4pt,
    box(inset: (x: 8pt, y: 5pt), text(size: 8pt, fill: MUT)[Kabbalat Shabbat]),
    line(length: 100%, stroke: 0.6pt + MUT),
    box(inset: (x: 8pt, y: 5pt), text(size: 8pt, fill: MUT)[Sh'ma & Her Blessings]),
    line(length: 100%, stroke: 0.6pt + MUT),
    box(fill: TWI, inset: (x: 8pt, y: 5pt), radius: 3pt, text(size: 8pt, fill: white, weight: "bold")[Amidah]),
    line(length: 100%, stroke: 0.6pt + MUT),
    box(inset: (x: 8pt, y: 5pt), text(size: 8pt, fill: MUT)[Concluding]))
  v(20pt)
  set par(leading: 0.8em, justify: true)
  text(size: 12.5pt)[
    The *Amidah* — the "standing prayer" — is the still center of the service. We pray it silently,
    each at our own pace, seven blessings for Shabbat. Then the community rises together for a prayer
    unique to Friday night: *Me'ein Sheva*, "an echo of the seven," which gathers the whole Amidah
    into a single blessing sung aloud.
  ]
  v(16pt)
  eyebrow("In this movement"); v(6pt)
  set par(leading: 0.9em)
  text(size: 10.5pt, fill: rgb("#3a3a42"))[
    The silent Amidah (seven blessings + personal prayer) · Vayechulu · *Me'ein Sheva / Magen Avot*
  ]
}
#pagebreak()

// ---------- PAGE 2 : ME'EIN SHEVA ----------
#{
  v(0.12in)
  eyebrow("Amidah · Friday Evening"); v(7pt)
  grid(columns: (1fr, auto), align: (left + bottom, right + bottom), column-gutter: 12pt,
    text(size: 19pt, weight: "bold", fill: TWID)[Me'ein Sheva],
    hb(text(weight: "bold")[מֵעֵין שֶׁבַע], size: 20pt))
  v(5pt); line(length: 100%, stroke: 0.8pt + GOLD); v(15pt)

  stanza("The Opening",
    "Baruch atah Adonai Elohéinu ve'lohei avotéinu v'imotéinu — Elohei Avraham, Elohei Yitzchak, ve'lohei Ya'akov; Elohei Sarah, Elohei Rivkah, Elohei Leah, Elohei Rachel, Elohei Bilhah, ve'lohei Zilpah — ha'El hagadol hagibor v'hanora, El elyon konei shamáyim va'áretz.",
    "בָּרוּךְ אַתָּה יְהוָה אֱלֹהֵינוּ וֵאלֹהֵי אֲבוֹתֵינוּ וְאִמּוֹתֵינוּ, אֱלֹהֵי אַבְרָהָם אֱלֹהֵי יִצְחָק וֵאלֹהֵי יַעֲקֹב, אֱלֹהֵי שָׂרָה אֱלֹהֵי רִבְקָה אֱלֹהֵי לֵאָה אֱלֹהֵי רָחֵל אֱלֹהֵי בִּלְהָה וֵאלֹהֵי זִלְפָּה, הָאֵל הַגָּדוֹל הַגִּבּוֹר וְהַנּוֹרָא, אֵל עֶלְיוֹן קוֹנֵה שָׁמַיִם וָאָרֶץ.",
    "We bless the Source of Life, God of our ancestors — God of Abraham, Isaac, and Jacob; God of Sarah, Rebecca, Leah, Rachel, Bilhah, and Zilpah — the great, the mighty, the awesome; God most high, maker of heaven and earth.")

  stanza("Magen Avot — the sevenfold blessing",
    "Magen avot bidvaro, m'chayei metim b'ma'amaro, ha'El hakadosh she'ein kamóhu, hameníach l'amo b'yom Shabbat kodsho, ki vam ratzah l'haníach lahem. L'fanav na'avod b'yir'ah vafáchad, v'nodeh lishmo b'chol yom tamid me'ein hab'rachot. El hahoda'ot, Adon hashalom, m'kadesh haShabbat um'varech shvi'i, umeníach bik'dusha l'am m'dushnei óneg, zécher l'ma'asei v'reshit.",
    "מָגֵן אָבוֹת בִּדְבָרוֹ, מְחַיֵּה מֵתִים בְּמַאֲמָרוֹ, הָאֵל הַקָּדוֹשׁ שֶׁאֵין כָּמוֹהוּ, הַמֵּנִיחַ לְעַמּוֹ בְּיוֹם שַׁבַּת קָדְשׁוֹ, כִּי בָם רָצָה לְהָנִיחַ לָהֶם. לְפָנָיו נַעֲבוֹד בְּיִרְאָה וָפַחַד, וְנוֹדֶה לִשְׁמוֹ בְּכָל יוֹם תָּמִיד מֵעֵין הַבְּרָכוֹת. אֵל הַהוֹדָאוֹת, אֲדוֹן הַשָּׁלוֹם, מְקַדֵּשׁ הַשַּׁבָּת וּמְבָרֵךְ שְׁבִיעִי, וּמֵנִיחַ בִּקְדֻשָּׁה לְעַם מְדֻשְּׁנֵי עֹנֶג, זֵכֶר לְמַעֲשֵׂה בְרֵאשִׁית.",
    "Shield of our ancestors by a word, giving life by a spoken promise; the Holy One beyond compare, who settles the people into rest on the holy day of Shabbat — for in them God delighted, to give them rest. Before this Presence we serve, in awe and wonder, giving thanks to the Name, always — the wellspring of blessing, God of all gratitude, the Source of peace, who hallows Shabbat and blesses the seventh day, giving rest in holiness to a people brimming with delight: a remembrance of creation.")

  stanza("Embrace Our Rest",
    "Elohéinu ve'lohei avotéinu v'imotéinu r'tzeh vimnuchaténu, kad'shénu b'mitzvotécha v'ten chelkénu b'toratécha, sab'énu mituvécha v'sam'chénu bishuatécha, v'taher libénu l'ovd'cha be'emet, v'hanchilénu Adonai Elohéinu b'ahavah uv'ratzon Shabbat kodshécha, v'yanúchu vah Yisrael m'kad'shei sh'mécha. Baruch atah Adonai m'kadesh haShabbat.",
    "אֱלֹהֵינוּ וֵאלֹהֵי אֲבוֹתֵינוּ וְאִמּוֹתֵינוּ רְצֵה בִמְנוּחָתֵנוּ, קַדְּשֵׁנוּ בְּמִצְוֹתֶיךָ וְתֵן חֶלְקֵנוּ בְּתוֹרָתֶךָ, שַׂבְּעֵנוּ מִטּוּבֶךָ וְשַׂמְּחֵנוּ בִּישׁוּעָתֶךָ, וְטַהֵר לִבֵּנוּ לְעָבְדְּךָ בֶּאֱמֶת, וְהַנְחִילֵנוּ יְהוָה אֱלֹהֵינוּ בְּאַהֲבָה וּבְרָצוֹן שַׁבַּת קָדְשֶׁךָ, וְיָנוּחוּ בָהּ יִשְׂרָאֵל מְקַדְּשֵׁי שְׁמֶךָ. בָּרוּךְ אַתָּה יְהוָה מְקַדֵּשׁ הַשַּׁבָּת.",
    "Our God and God of our ancestors — embrace our rest. Make us holy through sacred acts and give us a share in your Torah; fill us with your goodness and gladden us with your liberation; make our hearts pure to serve you in truth. In love and favor, HaShem our God, let us inherit your holy Shabbat — and let all Israel, who make your Name holy, find rest in her. Blessed are you, HaShem, who makes Shabbat holy.")

  v(2pt); line(length: 34%, stroke: 0.6pt + GOLD); v(6pt)
  text(size: 8.5pt, fill: MUT)[
    *°* *Me'ein Sheva* — "an echo of the seven" — folds the whole Shabbat Amidah into one blessing
    the community sings together. It began as a kindness: in medieval synagogues out in the fields, it
    gave latecomers time to finish and walk home safely. CRC has never had it — here it is, at last.
  ]
  v(4pt)
  text(size: 7.5pt, fill: rgb("#9a968d"))[
    Transliteration: an accent (e.g. *Elohéinu*) marks stress falling *before* the last syllable;
    unmarked words carry the stress on their final syllable.
  ]
}
