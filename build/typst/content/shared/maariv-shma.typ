#import "../../book.typ": *

// trope stanza: Ezra SIL Hebrew (cantillation), translit left
#let ts(tr, he, label: none)={
  block(breakable:false,{
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hbt(he))
  }); v(3pt)
}

// ===================== THE SH’MA =====================
#startprayer("The Sh’ma", "קְרִיאַת שְׁמַע", sec: "Sh’ma & Its Blessings")
#ritual([some cover their eyes for this line])
#block(breakable:false, align(center, {
  v(2pt)
  text(font:"Ezra SIL", lang:"he", dir:rtl, fill:TWID, size:23pt)[שְׁמַ֖#text(size:32pt)[ע] יִשְׂרָאֵ֑ל יְיָ אֱלֹהֵ֖ינוּ יְיָ ׀ אֶחָֽ#text(size:32pt)[ד]׃]
  v(7pt)
  text(size:11pt, style:"italic", fill:rgb("#4a4a52"))[Sh’ma Yisra’el, Adonai Eloheinu, Adonai echad.]
  v(3pt)
  text(size:11pt, style:"italic", fill:rgb("#2e2c26"))[Listen, Israel: HaShem is our God, HaShem is One.]
  v(8pt)
  text(font:"Ezra SIL", lang:"he", dir:rtl, fill:MUT, size:13pt)[בָּרוּךְ שֵׁם כְּבוֹד מַלְכוּתוֹ לְעוֹלָם וָעֶד.]
  v(2pt)
  text(size:8pt, style:"italic", fill:MUT)[Baruch shem k’vod malchuto l’olam va’ed. · Blessed is the radiant Name whose glory is forever. (said softly)]
}))
#v(10pt)
#submark("V’ahavta & Tzitzit")
#ts("V’ahavta et Adonai Elohecha, b’chol l’vavcha uvchol nafsh’cha uvchol m’odecha. V’hayu had’varim ha’ele asher anochi m’tzav’cha hayom al l’vavecha. V’shinantam l’vanecha v’dibarta bam, b’shivt’cha b’veitecha uvlecht’cha vaderech, uvshochb’cha uvkumecha.",
  "וְאָ֣הַבְתָּ֔ אֵ֖ת יְיָ אֱלֹהֶ֑יךָ בְּכׇל־לְבָבְךָ֥ וּבְכׇל־נַפְשְׁךָ֖ וּבְכׇל־מְאֹדֶֽךָ׃ וְהָי֞וּ הַדְּבָרִ֣ים הָאֵ֗לֶּה אֲשֶׁ֨ר אָנֹכִ֧י מְצַוְּךָ֛ הַיּ֖וֹם עַל־לְבָבֶֽךָ׃ וְשִׁנַּנְתָּ֣ם לְבָנֶ֔יךָ וְדִבַּרְתָּ֖ בָּ֑ם בְּשִׁבְתְּךָ֤ בְּבֵיתֶ֙ךָ֙ וּבְלֶכְתְּךָ֣ בַדֶּ֔רֶךְ וּֽבְשׇׁכְבְּךָ֖ וּבְקוּמֶֽךָ׃", label:"V’ahavta")
#ts("Uk’shartam l’ot al yadecha, v’hayu l’totafot bein einecha. Uch’tavtam al m’zuzot beitecha uvish’arecha.",
  "וּקְשַׁרְתָּ֥ם לְא֖וֹת עַל־יָדֶ֑ךָ וְהָי֥וּ לְטֹטָפֹ֖ת בֵּ֥ין עֵינֶֽיךָ׃ וּכְתַבְתָּ֛ם עַל־מְזֻז֥וֹת בֵּיתֶ֖ךָ וּבִשְׁעָרֶֽיךָ׃")
#rubric([We read the first paragraph aloud together; the tradition continues below, and we gather again at the gold line.])
#ts("V’haya im shamoa tishm’u el mitzvotai asher anochi m’tzave etchem hayom, l’ahava et Adonai Eloheichem ul’ovdo b’chol l’vavchem uvchol nafsh’chem. V’natati m’tar artz’chem b’ito, yore umalkosh, v’asafta d’ganecha v’tirosh’cha v’yitzharecha. V’natati esev b’sad’cha liv’hemtecha, v’achalta v’sava’ta.",
  "וְהָיָ֗ה אִם־שָׁמֹ֤עַ תִּשְׁמְעוּ֙ אֶל־מִצְוֺתַ֔י אֲשֶׁ֧ר אָנֹכִ֛י מְצַוֶּ֥ה אֶתְכֶ֖ם הַיּ֑וֹם לְאַהֲבָ֞ה אֶת־יְיָ אֱלֹֽהֵיכֶם֙ וּלְעׇבְד֔וֹ בְּכׇל־לְבַבְכֶ֖ם וּבְכׇל־נַפְשְׁכֶֽם׃ וְנָתַתִּ֧י מְטַֽר־אַרְצְכֶ֛ם בְּעִתּ֖וֹ יוֹרֶ֣ה וּמַלְק֑וֹשׁ וְאָסַפְתָּ֣ דְגָנֶ֔ךָ וְתִירֹֽשְׁךָ֖ וְיִצְהָרֶֽךָ׃ וְנָתַתִּ֛י עֵ֥שֶׂב בְּשָׂדְךָ֖ לִבְהֶמְתֶּ֑ךָ וְאָכַלְתָּ֖ וְשָׂבָֽעְתָּ׃", label:"The second paragraph")
#ts("Hisham’ru lachem pen yifte l’vavchem, v’sartem va’avadtem elohim acherim v’hishtachavitem lahem. V’chara af Adonai bachem, v’atzar et hashamayim v’lo yihyeh matar, v’ha’adama lo titen et y’vula, va’avadtem m’hera me’al ha’aretz hatova asher Adonai noten lachem.",
  "הִשָּֽׁמְר֣וּ לָכֶ֔ם פֶּ֥ן יִפְתֶּ֖ה לְבַבְכֶ֑ם וְסַרְתֶּ֗ם וַעֲבַדְתֶּם֙ אֱלֹהִ֣ים אֲחֵרִ֔ים וְהִשְׁתַּחֲוִיתֶ֖ם לָהֶֽם׃ וְחָרָ֨ה אַף־יְיָ בָּכֶ֗ם וְעָצַ֤ר אֶת־הַשָּׁמַ֙יִם֙ וְלֹֽא־יִהְיֶ֣ה מָטָ֔ר וְהָ֣אֲדָמָ֔ה לֹ֥א תִתֵּ֖ן אֶת־יְבוּלָ֑הּ וַאֲבַדְתֶּ֣ם מְהֵרָ֗ה מֵעַל֙ הָאָ֣רֶץ הַטֹּבָ֔ה אֲשֶׁ֥ר יְיָ נֹתֵ֥ן לָכֶֽם׃")
#ts("V’samtem et d’varai ele al l’vavchem v’al nafsh’chem, uk’shartem otam l’ot al yedchem, v’hayu l’totafot bein eineichem. V’limadtem otam et b’neichem l’daber bam, b’shivt’cha b’veitecha uvlecht’cha vaderech, uvshochb’cha uvkumecha. Uch’tavtam al m’zuzot beitecha uvish’arecha. L’ma’an yirbu y’meichem vimei v’neichem al ha’adama asher nishba Adonai la’avoteichem latet lahem, kimei hashamayim al ha’aretz.",
  "וְשַׂמְתֶּם֙ אֶת־דְּבָרַ֣י אֵ֔לֶּה עַל־לְבַבְכֶ֖ם וְעַֽל־נַפְשְׁכֶ֑ם וּקְשַׁרְתֶּ֨ם אֹתָ֤ם לְאוֹת֙ עַל־יֶדְכֶ֔ם וְהָי֥וּ לְטוֹטָפֹ֖ת בֵּ֥ין עֵינֵיכֶֽם׃ וְלִמַּדְתֶּ֥ם אֹתָ֛ם אֶת־בְּנֵיכֶ֖ם לְדַבֵּ֣ר בָּ֑ם בְּשִׁבְתְּךָ֤ בְּבֵיתֶ֙ךָ֙ וּבְלֶכְתְּךָ֣ בַדֶּ֔רֶךְ וּֽבְשׇׁכְבְּךָ֖ וּבְקוּמֶֽךָ׃ וּכְתַבְתָּ֛ם עַל־מְזוּז֥וֹת בֵּיתֶ֖ךָ וּבִשְׁעָרֶֽיךָ׃ לְמַ֨עַן יִרְבּ֤וּ יְמֵיכֶם֙ וִימֵ֣י בְנֵיכֶ֔ם עַ֚ל הָֽאֲדָמָ֔ה אֲשֶׁ֨ר נִשְׁבַּ֧ע יְיָ לַאֲבֹתֵיכֶ֖ם לָתֵ֣ת לָהֶ֑ם כִּימֵ֥י הַשָּׁמַ֖יִם עַל־הָאָֽרֶץ׃")
#ts("Vayomer Adonai el Moshe lemor:", "וַיֹּ֥אמֶר יְיָ אֶל־מֹשֶׁ֥ה לֵּאמֹֽר׃")
#ts("Daber el b’nei Yisra’el v’amarta alehem, v’asu lahem tzitzit al kanfei vig’deihem l’dorotam, v’natnu al tzitzit hakanaf p’til t’chelet.",
  "דַּבֵּ֞ר אֶל־בְּנֵ֤י יִשְׂרָאֵל֙ וְאָמַרְתָּ֣ אֲלֵהֶ֔ם וְעָשׂ֨וּ לָהֶ֥ם צִיצִ֛ת עַל־כַּנְפֵ֥י בִגְדֵיהֶ֖ם לְדֹרֹתָ֑ם וְנָ֥תְנ֛וּ עַל־צִיצִ֥ת הַכָּנָ֖ף פְּתִ֥יל תְּכֵֽלֶת׃", label:"The third paragraph")
#ts("V’haya lachem l’tzitzit, ur’item oto uzchartem et kol mitzvot Adonai, va’asitem otam, v’lo taturu acharei l’vavchem v’acharei eineichem asher atem zonim achareihem.",
  "וְהָיָ֣ה לָכֶם֮ לְצִיצִת֒ וּרְאִיתֶ֣ם אֹת֗וֹ וּזְכַרְתֶּם֙ אֶת־כׇּל־מִצְוֺ֣ת יְיָ וַעֲשִׂיתֶ֖ם אֹתָ֑ם וְלֹֽא־תָת֜וּרוּ אַחֲרֵ֤י לְבַבְכֶם֙ וְאַחֲרֵ֣י עֵֽינֵיכֶ֔ם אֲשֶׁר־אַתֶּ֥ם זֹנִ֖ים אַחֲרֵיהֶֽם׃")
#ts([#text(fill:GOLDD)[L’ma’an tizk’ru va’asitem et kol mitzvotai, vih’yitem k’doshim leloheichem. Ani Adonai Eloheichem, asher hotzeti etchem me’eretz Mitzrayim lih’yot lachem lelohim, ani Adonai Eloheichem.]],
  [#text(fill:GOLDD)[לְמַ֣עַן תִּזְכְּר֔וּ וַעֲשִׂיתֶ֖ם אֶת־כׇּל־מִצְוֺתָ֑י וִהְיִיתֶ֥ם קְדֹשִׁ֖ים לֵאלֹֽהֵיכֶֽם׃ אֲנִ֞י יְיָ אֱלֹֽהֵיכֶ֗ם אֲשֶׁ֨ר הוֹצֵ֤אתִי אֶתְכֶם֙ מֵאֶ֣רֶץ מִצְרַ֔יִם לִהְי֥וֹת לָכֶ֖ם לֵאלֹהִ֑ים אֲנִ֖י יְיָ אֱלֹהֵיכֶֽם׃]])
#eng("And you shall love HaShem your God with all your heart, with all your soul, and with all your might. Let these words that I command you today rest upon your heart. Teach them again and again to your children; speak them when you sit in your home and when you walk on the way, when you lie down and when you rise.")
#eng("Bind them as a sign upon your hand, let them be a symbol before your eyes, and write them on the doorposts of your house and on your gates.")
#eng("If you truly listen — and keep on listening — to the mitzvot I give you this day, loving HaShem your God and serving with all your heart and all your soul, then the rains will fall on your land in their season, the early rain and the late; you will gather your grain and your wine and your oil, and there will be grass in your fields for your animals — you will eat, and be satisfied.")
#eng("But take care, for a heart is easily led astray: when we turn away, chasing other powers and bowing down to them, the bond frays — the skies seem to close, the rain holds back, the ground withholds its yield, and we find ourselves adrift, soon lost from the good land. So set these words upon your heart and soul; bind them as a sign on your hand and let them rest between your eyes; teach them to your children, speaking them at home and on the way, when you lie down and when you rise; and write them on the doorposts of your house and on your gates — that your days, and your children’s days, may be many on the land, as many as the days of the heavens over the earth.")
#eng("HaShem said to Moses: tell the people of Israel to make themselves fringes on the corners of their garments, in every generation, and to set on each corner a thread of blue. Look at it and remember all the mitzvot of HaShem, and do them — and do not go chasing after the cravings of your own heart and eyes.")
#engn("So that you will remember and do all My mitzvot, and be holy to your God. I am HaShem your God, who brought you out of the land of Egypt to be your God. I am HaShem your God.",
  [The scribes enlarged the ע of #emph[Sh’ma] and the ד of #emph[echad] so that together they spell עֵד — "witness": to say these words is to testify. And the passage is set to close on the Exodus, so the Sh’ma always ends in the memory of freedom (Berakhot 12b).])
