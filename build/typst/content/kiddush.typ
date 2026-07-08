#import "../book.typ": *
#let ts(tr, he, label: none)={
  block(breakable:false,{
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hbt(he))
  }); v(3pt)
}
// (2026-07-07 re-pagination) Kiddush is chanted with the cup in hand (music
// critique M-4): it must sit on a single open spread, never across a physical
// page turn. pagebreak(to:"even") guarantees a verso start whatever reflows
// upstream (folio parity == PDF parity here); the leaf before it may be blank.
#pagebreak(to: "even")
#startprayer("Kiddush · Sanctifying Shabbat", "קִדּוּשׁ", sec: "Seasonal & Kiddush", newpage: true)
#rubric([We raise the cup of wine and bless.])

// ===================== VAYECHULU · Genesis 2:1-3 =====================
#rubric([Genesis 2:1–3 — the Torah’s account of the first Shabbat.])
#ts("Vay’chulú hashamáyim v’ha’áretz v’chol tz’va’ám.",
  "וַיְכֻלּ֛וּ הַשָּׁמַ֥יִם וְהָאָ֖רֶץ וְכׇל־צְבָאָֽם׃", label: "Vayechulu")
#ts("Vay’chál Elohím bayóm hash’vi’í m’lachtó ashér asáh, vayishbót bayóm hash’vi’í mikól m’lachtó ashér asáh.",
  "וַיְכַ֤ל אֱלֹהִים֙ בַּיּ֣וֹם הַשְּׁבִיעִ֔י מְלַאכְתּ֖וֹ אֲשֶׁ֣ר עָשָׂ֑ה וַיִּשְׁבֹּת֙ בַּיּ֣וֹם הַשְּׁבִיעִ֔י מִכׇּל־מְלַאכְתּ֖וֹ אֲשֶׁ֥ר עָשָֽׂה׃")
#ts("Vay’várech Elohím et yom hash’vi’í vay’kadésh otó, ki vo shavát mikól m’lachtó ashér bará Elohím la’asót.",
  "וַיְבָ֤רֶךְ אֱלֹהִים֙ אֶת־י֣וֹם הַשְּׁבִיעִ֔י וַיְקַדֵּ֖שׁ אֹת֑וֹ כִּ֣י ב֤וֹ שָׁבַת֙ מִכׇּל־מְלַאכְתּ֔וֹ אֲשֶׁר־בָּרָ֥א אֱלֹהִ֖ים לַעֲשֽׂוֹת׃")
#eng("The heavens and the earth were finished, and all their vast array. On the seventh day God completed the work that had been made, and rested on the seventh day from all the work. And God blessed the seventh day and made it holy, because on it God rested from all the work of creation.")

// ===================== BOREI P’RI HAGAFEN =====================
#stanza("Barúch atá Adonai, Elohéinu mélech ha’olám, boréi p’rí hagáfen.",
  "בָּרוּךְ אַתָּה יְיָ אֱלֹהֵינוּ מֶלֶךְ הָעוֹלָם בּוֹרֵא פְּרִי הַגָּפֶן.", label: "Blessing over the wine")
#eng("Blessed are You, HaShem our God, Source of all being, Creator of the fruit of the vine.")

// ===================== THE SANCTIFICATION OF THE DAY =====================
#stanza("Barúch atá Adonai, Elohéinu mélech ha’olám, ashér kid’shánu b’mitzvotáv v’ratzá vánu, v’Shabbat kodshó b’ahavá uvratzón hinchilánu, zikarón l’ma’aséi v’reishít.",
  "בָּרוּךְ אַתָּה יְיָ אֱלֹהֵינוּ מֶלֶךְ הָעוֹלָם, אֲשֶׁר קִדְּשָׁנוּ בְּמִצְוֹתָיו וְרָצָה בָנוּ, וְשַׁבַּת קָדְשׁוֹ בְּאַהֲבָה וּבְרָצוֹן הִנְחִילָנוּ, זִכָּרוֹן לְמַעֲשֵׂה בְרֵאשִׁית.", label: "Sanctifying the day")
#stanza("Ki hu yom t’chilá l’mikra’éi kódesh, zécher litzi’át mitzráyim.",
  "כִּי הוּא יוֹם תְּחִלָּה לְמִקְרָאֵי קֹדֶשׁ, זֵכֶר לִיצִיאַת מִצְרָיִם.")
#chatimah("Ki vánu vachárta v’otánu kidáshta mikól ha’amím, v’Shabbat kodsh’chá b’ahavá uvratzón hinchaltánu. Barúch atá Adonai, m’kadésh haShabbat.",
  "כִּי בָנוּ בָחַרְתָּ וְאוֹתָנוּ קִדַּשְׁתָּ מִכָּל הָעַמִּים וְשַׁבַּת קָדְשְׁךָ בְּאַהֲבָה וּבְרָצוֹן הִנְחַלְתָּנוּ. בָּרוּךְ אַתָּה יְיָ, מְקַדֵּשׁ הַשַּׁבָּת.")
#engn("Blessed are You, HaShem our God, Source of all being: You have made us holy with Your mitzvot and taken delight in us. In love and favor You have given us Your holy Shabbat as an inheritance — a remembrance of the work of creation. It is the first of our sacred days, a reminder of our going-out from Egypt. You chose us from among all peoples and made us holy, and in love and favor You have given us Your holy Shabbat. Blessed are You, who makes Shabbat holy.",
  [Kiddush means "sanctification": we do not merely welcome Shabbat — we declare it holy, aloud, over a full cup; the Sages taught to remember Shabbat over wine (Pesachim 106a). Its blessing binds the two reasons the Torah gives for Shabbat — a remembrance of creation, and a reminder of the Exodus: the world made, and a people set free. And "chose us"? Many of us have flinched at it; we hear it not as rank but as task — every people is chosen for something, and this is ours: to keep this day.])
