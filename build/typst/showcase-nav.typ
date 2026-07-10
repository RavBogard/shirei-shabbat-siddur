// Layered wayfinding — Variant A built out: Amidah opener + Me'ein Sheva interior (mirrored rail).
#let INK=rgb("#1b1b24"); #let TWI=rgb("#2c3566"); #let TWID=rgb("#222a54")
#let GOLD=rgb("#bd8a2e"); #let PARCH=rgb("#fbf7ef"); #let MUT=rgb("#7d7a72"); #let FAINT=rgb("#b3ab9c")

#let SECT=("Kabbalat Shabbat","Sh'ma & Her Blessings","Amidah","Concluding"); #let CUR=2
#let AM=("Silent Amidah","Vayechulu","Me'ein Sheva","Magen Avot"); #let ACUR=2
#let hb(s, size: 13.5pt)=text(font:"David Libre", lang:"he", dir:rtl, fill:TWID, size:size)[#s]
#let eyebrow(s)=text(size:7.5pt, tracking:2pt, fill:GOLD, weight:"bold")[#upper(s)]

// interior outer rail: collapses others, expands current; top-aligned, mirrored
#let railcontent = {
  for (i,s) in SECT.enumerate() {
    if i==CUR {
      grid(columns:(2.5pt,1fr), column-gutter:6pt,
        rect(fill:GOLD, width:2.5pt, height:4.7em),
        stack(spacing:4pt,
          text(size:7.5pt, weight:"bold", fill:TWID, tracking:0.5pt)[#upper(s)],
          ..AM.enumerate().map(((j,a))=> text(size:6.7pt, fill: if j==ACUR {GOLD} else {MUT},
              weight: if j==ACUR {"bold"} else {"regular"})[#a])))
    } else { text(size:7pt, fill:FAINT, tracking:0.5pt)[#upper(s)] }
    v(10pt)
  }
}

#set page(width:7in, height:10in, fill:PARCH,
  margin:(outside:1.3in, inside:0.8in, top:0.8in, bottom:0.85in),
  background: context {
    let p = here().page()
    if p > 1 {
      let outer-right = calc.odd(p)
      place(top + (if outer-right {right} else {left}),
        dx: if outer-right {-0.16in} else {0.16in}, dy:0.8in,
        box(width:1.0in, railcontent))
    }
  })
#set text(font:"Libertinus Serif", size:11pt, fill:INK)
#set par(leading:0.62em)

#let stanza(label, translit, hebrew, english)={
  block(breakable:false, {
    eyebrow(label); v(4pt)
    grid(columns:(1fr,1.05fr), column-gutter:20pt, align:(left+top,right+top),
      text(size:9pt, style:"italic", fill:rgb("#4a4a52"))[#translit], hb(hebrew))
    v(6pt); text(size:10pt, style:"italic", fill:rgb("#2e2c26"))[#english]
  }); v(13pt)
}

// ---------- PAGE 1 : AMIDAH SECTION OPENER (full expand-in-place guide) ----------
#{
  v(0.2in)
  eyebrow("Movement Three"); v(6pt)
  text(size:30pt, weight:"bold", fill:TWID)[The Standing Prayer]
  linebreak(); v(3pt)
  text(font:"David Libre", lang:"he", dir:rtl, size:26pt, weight:"bold", fill:GOLD)[עֲמִידָה]
  v(12pt); line(length:100%, stroke:1.2pt+GOLD); v(20pt)
  // full expand-in-place guide
  grid(columns:(auto, 1fr), column-gutter:26pt,
    box(width:2.5in)[
      #for (i,s) in SECT.enumerate() {
        if i==CUR {
          grid(columns:(3pt,1fr), column-gutter:9pt,
            rect(fill:GOLD, width:3pt, height:5.3em),
            stack(spacing:5pt,
              text(size:11pt, weight:"bold", fill:TWID, tracking:0.5pt)[#upper(s)],
              ..AM.enumerate().map(((j,a))=> text(size:9pt, fill: if j==ACUR {GOLD} else {MUT},
                  weight: if j==ACUR {"bold"} else {"regular"})[#a])))
        } else { text(size:11pt, fill:FAINT, tracking:0.5pt)[#upper(s)] }
        v(13pt)
      }
    ],
    [
      #set par(leading:0.8em, justify:true)
      #text(size:12pt)[
        The *Amidah* — the "standing prayer" — is the still center of the service. We pray it
        silently, each at our own pace: seven blessings for Shabbat. Then the community rises together
        for a prayer unique to Friday night — *Me'ein Sheva*, "an echo of the seven," which gathers
        the whole Amidah into a single blessing sung aloud.
      ]
    ])
}
#pagebreak()

// ---------- PAGE 2+ : ME'EIN SHEVA (interior, with mirrored rail) ----------
#{
  v(0.12in)
  eyebrow("Amidah · Friday Evening"); v(7pt)
  grid(columns:(1fr,auto), align:(left+bottom,right+bottom), column-gutter:12pt,
    text(size:19pt, weight:"bold", fill:TWID)[Me'ein Sheva], hb(text(weight:"bold")[מֵעֵין שֶׁבַע], size:20pt))
  v(5pt); line(length:100%, stroke:0.8pt+GOLD); v(15pt)

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

  v(2pt); line(length:34%, stroke:0.6pt+GOLD); v(6pt)
  text(size:8.5pt, fill:MUT)[
    *°* *Me'ein Sheva* — "an echo of the seven" — folds the whole Shabbat Amidah into one blessing
    the community sings together. It began as a kindness: in medieval synagogues out in the fields,
    it gave latecomers time to finish and walk home safely. CRC has never had it — here it is, at last.
  ]
}
