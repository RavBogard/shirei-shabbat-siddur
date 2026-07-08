#import "../book.typ": *

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
  text(size:11pt, style:"italic", fill:rgb("#4a4a52"))[Sh’ma Yisra’él, Adonai Elohéinu, Adonai echád.]
  v(3pt)
  text(size:11pt, style:"italic", fill:rgb("#2e2c26"))[Listen, Israel: HaShem is our God, HaShem is One.]
  v(8pt)
  text(font:"Ezra SIL", lang:"he", dir:rtl, fill:MUT, size:13pt)[בָּרוּךְ שֵׁם כְּבוֹד מַלְכוּתוֹ לְעוֹלָם וָעֶד.]
  v(2pt)
  text(size:8pt, style:"italic", fill:MUT)[Barúch shem k’vod malchutó l’olám va’éd. · Blessed is the radiant Name whose glory is forever. (said softly)]
}))
#v(10pt)
#submark("V’ahavta & Tzitzit")
#ts("V’ahavtá et Adonai Elohécha, b’chol l’vavchá uvchol nafsh’chá uvchol m’odécha. V’hayú had’varím ha’éle asher anochí m’tzav’chá hayom al l’vavécha. V’shinantám l’vanécha v’dibartá bam, b’shivt’chá b’veitécha uvlecht’chá vadérech, uvshochb’chá uvkumécha.",
  "וְאָ֣הַבְתָּ֔ אֵ֖ת יְיָ אֱלֹהֶ֑יךָ בְּכׇל־לְבָבְךָ֥ וּבְכׇל־נַפְשְׁךָ֖ וּבְכׇל־מְאֹדֶֽךָ׃ וְהָי֞וּ הַדְּבָרִ֣ים הָאֵ֗לֶּה אֲשֶׁ֨ר אָנֹכִ֧י מְצַוְּךָ֛ הַיּ֖וֹם עַל־לְבָבֶֽךָ׃ וְשִׁנַּנְתָּ֣ם לְבָנֶ֔יךָ וְדִבַּרְתָּ֖ בָּ֑ם בְּשִׁבְתְּךָ֤ בְּבֵיתֶ֙ךָ֙ וּבְלֶכְתְּךָ֣ בַדֶּ֔רֶךְ וּֽבְשׇׁכְבְּךָ֖ וּבְקוּמֶֽךָ׃", label:"V’ahavta")
#ts("Uk’shartám l’ot al yadécha, v’hayú l’totafót bein einécha. Uch’tavtám al m’zuzót beitécha uvish’arécha.",
  "וּקְשַׁרְתָּ֥ם לְא֖וֹת עַל־יָדֶ֑ךָ וְהָי֥וּ לְטֹטָפֹ֖ת בֵּ֥ין עֵינֶֽיךָ׃ וּכְתַבְתָּ֛ם עַל־מְזֻז֥וֹת בֵּיתֶ֖ךָ וּבִשְׁעָרֶֽיךָ׃")
#ts("Vayómer Adonai el Moshé lemór:", "וַיֹּ֥אמֶר יְיָ אֶל־מֹשֶׁ֥ה לֵּאמֹֽר׃")
#ts("Dabér el b’nei Yisra’él v’amartá alehém, v’asú lahém tzitzít al kanfei vig’deihém l’dorotám, v’natnú al tzitzít hakanáf p’til t’chélet.",
  "דַּבֵּ֞ר אֶל־בְּנֵ֤י יִשְׂרָאֵל֙ וְאָמַרְתָּ֣ אֲלֵהֶ֔ם וְעָשׂ֨וּ לָהֶ֥ם צִיצִ֛ת עַל־כַּנְפֵ֥י בִגְדֵיהֶ֖ם לְדֹרֹתָ֑ם וְנָ֥תְנ֛וּ עַל־צִיצִ֥ת הַכָּנָ֖ף פְּתִ֥יל תְּכֵֽלֶת׃", label:"The third paragraph")
#ts("V’hayá lachém l’tzitzít, ur’itém otó uzchartém et kol mitzvót Adonai, va’asitém otám, v’lo tatúru acharei l’vavchém v’acharei eineichém asher atém zoním achareihém.",
  "וְהָיָ֣ה לָכֶם֮ לְצִיצִת֒ וּרְאִיתֶ֣ם אֹת֗וֹ וּזְכַרְתֶּם֙ אֶת־כׇּל־מִצְוֺ֣ת יְיָ וַעֲשִׂיתֶ֖ם אֹתָ֑ם וְלֹֽא־תָת֜וּרוּ אַחֲרֵ֤י לְבַבְכֶם֙ וְאַחֲרֵ֣י עֵֽינֵיכֶ֔ם אֲשֶׁר־אַתֶּ֥ם זֹנִ֖ים אַחֲרֵיהֶֽם׃")
#ts("L’ma’an tizk’rú va’asitém et kol mitzvotái, vih’yitém k’doshím leloheichém. Aní Adonai Eloheichém, asher hotzéti etchém me’éretz Mitzráyim lih’yót lachém lelohím, aní Adonai Eloheichém.",
  "לְמַ֣עַן תִּזְכְּר֔וּ וַעֲשִׂיתֶ֖ם אֶת־כׇּל־מִצְוֺתָ֑י וִהְיִיתֶ֥ם קְדֹשִׁ֖ים לֵאלֹֽהֵיכֶֽם׃ אֲנִ֞י יְיָ אֱלֹֽהֵיכֶ֗ם אֲשֶׁ֨ר הוֹצֵ֤אתִי אֶתְכֶם֙ מֵאֶ֣רֶץ מִצְרַ֔יִם לִהְי֥וֹת לָכֶ֖ם לֵאלֹהִ֑ים אֲנִ֖י יְיָ אֱלֹהֵיכֶֽם׃")
#eng("And you shall love HaShem your God with all your heart, with all your soul, and with all your might. Let these words that I command you today rest upon your heart. Teach them again and again to your children; speak them when you sit in your home and when you walk on the way, when you lie down and when you rise.")
#eng("Bind them as a sign upon your hand, let them be a symbol before your eyes, and write them on the doorposts of your house and on your gates.")
#eng("HaShem said to Moses: tell the people of Israel to make themselves fringes on the corners of their garments, in every generation, and to set on each corner a thread of blue. Look at it and remember all the mitzvot of HaShem, and do them — and do not go chasing after the cravings of your own heart and eyes.")
#engn("So that you will remember and do all My mitzvot, and be holy to your God. I am HaShem your God, who brought you out of the land of Egypt to be your God. I am HaShem your God.",
  [The scribes enlarged the ע of #emph[Sh’ma] and the ד of #emph[echad] so that together they spell עֵד — "witness": to say these words is to testify. And the passage is set to close on the Exodus, so the Sh’ma always ends in the memory of freedom (Berakhot 12b).])
