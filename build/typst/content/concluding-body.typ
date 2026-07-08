#import "../book.typ": *
#let ts(tr, he, label: none)={
  block(breakable:false,{
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hbt(he))
  }); v(3pt)
}

// ===================== MI SHEBEIRACH · HEALING =====================
// Unit lives in its own file so the build can swap the private (licensed)
// setting for the public placeholder — see FORK-YOUR-OWN.md §6.
#include "mi-shebeirach.typ"

// ===================== ALEINU =====================
#startprayer("Aleinu · It Is Ours to Praise", "עָלֵינוּ", sec: "Concluding", newpage: true)
#ritual([some bend and bow at these words])
#stanza("Aléinu l’shabéach la’adón hakól, latét g’dulá l’yotzér b’reshít, shelo asánu k’goyéi ha’aratzót, v’lo samánu k’mishp’chót ha’adamá; shelo sam chelkéinu kahém, v’goraléinu k’chol hamonám. Va’anáchnu kor’ím umishtachavím umodím, lifnéi mélech malchéi ham’lachím, haKadósh barúch hu.",
  "עָלֵינוּ לְשַׁבֵּחַ לַאֲדוֹן הַכֹּל לָתֵת גְּדֻלָּה לְיוֹצֵר בְּרֵאשִׁית שֶׁלֹּא עָשָׂנוּ כְּגוֹיֵי הָאֲרָצוֹת וְלֹא שָׂמָנוּ כְּמִשְׁפְּחוֹת הָאֲדָמָה שֶׁלֹּא שָׂם חֶלְקֵנוּ כָּהֶם וְגוֹרָלֵנוּ כְּכָל הֲמוֹנָם. וַאֲנַחְנוּ כּוֹרְעִים וּמִשְׁתַּחֲוִים וּמוֹדִים לִפְנֵי מֶלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.")
#stanza("Shehú noté shamáyim v’yoséd áretz, umosháv y’karó bashamáyim mimá’al, ushchinát uzó b’govhéi m’romím. Hu Elohéinu ein od, emét malkéinu éfes zulató, kakatúv b’torató: v’yadatá hayóm vahashevotá el l’vavécha, ki Adonai hu ha’Elohím bashamáyim mimá’al v’al ha’áretz mitáchat, ein od.",
  "שֶׁהוּא נוֹטֶה שָׁמַיִם וְיוֹסֵד אָרֶץ, וּמוֹשַׁב יְקָרוֹ בַּשָּׁמַיִם מִמַּעַל, וּשְׁכִינַת עֻזּוֹ בְּגָבְהֵי מְרוֹמִים. הוּא אֱלֹהֵינוּ אֵין עוֹד, אֱמֶת מַלְכֵּנוּ אֶפֶס זוּלָתוֹ, כַּכָּתוּב בְּתוֹרָתוֹ: וְיָדַעְתָּ הַיּוֹם וַהֲשֵׁבֹתָ אֶל לְבָבֶךָ, כִּי יְיָ הוּא הָאֱלֹהִים בַּשָּׁמַיִם מִמַּעַל וְעַל הָאָרֶץ מִתָּחַת, אֵין עוֹד.", label: "As it is written in the Torah")
#chatimah("V’ne’emár: v’hayá Adonai l’mélech al kol ha’áretz, bayóm hahú yihyéh Adonai echád ushmó echád.",
  "וְנֶאֱמַר: וְהָיָה יְיָ לְמֶלֶךְ עַל כָּל הָאָרֶץ, בַּיּוֹם הַהוּא יִהְיֶה יְיָ אֶחָד וּשְׁמוֹ אֶחָד.")
#eng("It is ours to praise the One of all, to give greatness to the One who forms creation — who did not make us like the nations of the lands, nor set us like the families of the earth; who did not make our portion like theirs, nor our lot like their multitude. And so we bend, and bow, and give thanks before the Sovereign beyond all sovereigns, the Holy One of blessing.")
#eng("The One who stretches out the heavens and founds the earth, whose glory dwells in the heavens above and whose strength abides in the highest heights — this is our God; there is no other. In truth our Sovereign, there is none else, as it is written in the Torah: Know this day and take it to heart, that the Eternal is God in the heavens above and on the earth below; there is no other.")
#engn("And it is said: The Eternal shall be Sovereign over all the earth; on that day the Eternal shall be One, and God’s name One.",
  [Aleinu began as a coronation prayer for the High Holy Days and, by the Middle Ages, became the seal of every service. We keep its ancient first paragraph in full — long a target of Christian censors — hearing its distinction of Israel not as superiority but as particular calling — every people in this room has one. The prayer’s traditional second paragraph, not printed here, gave Judaism one of its defining phrases: #emph[l’takken olam], "to mend the world."])

// ===================== MOURNER’S KADDISH =====================
#startprayer("Mourner’s Kaddish", "קַדִּישׁ יָתוֹם", sec: "Concluding", newpage: true)
#rubric([Mourners rise; all who wish may stand with them.])
#stanza("Yitgadál v’yitkadásh sh’méh rabá. (Amén.) B’almá di v’rá chir’utéh, v’yamlích malchutéh b’chayéichon uvyoméichon uvchayéi d’chol beit Yisra’él, ba’agalá uvizmán karív, v’imrú: Amén.",
  "יִתְגַּדַּל וְיִתְקַדַּשׁ שְׁמֵהּ רַבָּא. (אָמֵן.) בְּעָלְמָא דִּי־בְרָא כִרְעוּתֵהּ וְיַמְלִיךְ מַלְכוּתֵהּ בְּחַיֵּיכוֹן וּבְיוֹמֵיכוֹן וּבְחַיֵּי דְכָל־בֵּית יִשְׂרָאֵל בַּעֲגָלָא וּבִזְמַן קָרִיב וְאִמְרוּ אָמֵן.")
#stanza("Y’hé sh’méh rabá m’varách l’alám ulalméi almayá.",
  "יְהֵא שְׁמֵהּ רַבָּא מְבָרַךְ לְעָלַם וּלְעָלְמֵי עָלְמַיָּא.", label: "All")
#seasonmark[Ten Days: "l’eila ul’eila" — see p. 58]
#stanza("Yitbarách v’yishtabách v’yitpa’ár v’yitromám v’yitnasé v’yit’hadár v’yit’alé v’yit’halál sh’méh d’kudshá b’rich hu, l’éla min kol birchatá v’shiratá, tushb’chatá v’nechemátá da’amirán b’almá, v’imrú: Amén.",
  "יִתְבָּרַךְ וְיִשְׁתַּבַּח וְיִתְפָּאַר וְיִתְרוֹמַם וְיִתְנַשֵּׂא וְיִתְהַדָּר וְיִתְעַלֶּה וְיִתְהַלָּל שְׁמֵהּ דְקוּדְשָׁא בְּרִיךְ הוּא, לְעֵלָּא מִן־כָּל בִּרְכָתָא וְשִׁירָתָא תֻּשְׁבְּחָתָא וְנֶחָמָתָא דַּאֲמִירָן בְּעָלְמָא, וְאִמְרוּ אָמֵן.")
#stanza("Y’hé sh’lamá rabá min sh’mayá, v’chayím aléinu v’al kol Yisra’él, v’imrú: Amén.",
  "יְהֵא שְׁלָמָא רַבָּא מִן שְׁמַיָּא, וְחַיִּים עָלֵינוּ וְעַל כָּל יִשְׂרָאֵל, וְאִמְרוּ אָמֵן.")
#ritual([some step back, bowing, taking leave])
#chatimah("Oséh shalóm bimromáv, hu ya’aséh shalóm aléinu, v’al kol Yisra’él, v’al kol yosh’véi tevél, v’imrú: Amén.",
  "עוֹשֶׂה שָׁלוֹם בִּמְרוֹמָיו, הוּא יַעֲשֶׂה שָׁלוֹם עָלֵינוּ, וְעַל כָּל יִשְׂרָאֵל, וְעַל כָּל יוֹשְׁבֵי תֵבֵל, וְאִמְרוּ אָמֵן.")
#eng("May the great name be made great and holy in the world that was created by divine will. May its majesty be known in your lifetime and in your days and in the life of all the house of Israel, swiftly and soon — and say: Amen.")
#eng("May the great name be blessed forever and to all eternity. Blessed and praised, glorified and exalted, raised and honored, uplifted and celebrated be the name of the Holy One — far beyond any blessing or song, any praise or consolation that can be spoken in the world — and say: Amen.")
#engn("May great peace from heaven, and life, be upon us and upon all Israel — and say: Amen. May the One who makes peace in the high places make peace for us, for all Israel, and for all who dwell on earth — and say: Amen.",
  [The Kaddish never mentions death; it is a soaring praise of life and a yearning for a world made whole, spoken in the everyday Aramaic once shared across Jewish communities. We add #emph[v’al kol yosh’vei tevel] — "and upon all who dwell on earth" — widening the circle of peace to embrace the whole human family.])

// ===================== PRIESTLY BLESSING =====================
#startprayer("Birkat Kohanim · The Blessing", "בִּרְכַּת כֹּהֲנִים", sec: "Concluding", newpage: true)
#rubric([The clergy may offer this ancient blessing over the community.])
#ts("Y’varech’chá Adonai v’yishm’récha.",
  "יְבָרֶכְךָ֥ יְיָ וְיִשְׁמְרֶֽךָ׃")
#ts("Ya’ér Adonai panáv eilécha vichunéka.",
  "יָאֵ֨ר יְיָ פָּנָ֛יו אֵלֶ֖יךָ וִֽיחֻנֶּֽךָּ׃")
#ts([#text(fill:GOLDD)[Yisá Adonai panáv eilécha v’yasém l’chá shalóm.]],
  [#text(fill:GOLDD)[יִשָּׂ֨א יְיָ פָּנָיו֙ אֵלֶ֔יךָ וְיָשֵׂ֥ם לְךָ֖ שָׁלֽוֹם׃]])
#engn("May the Eternal bless you and keep you. May the Eternal’s face shine upon you and be gracious to you. May the Eternal’s face turn toward you and grant you peace.",
  [This is the oldest blessing still in daily use: its words were found inscribed on tiny silver scrolls from the seventh century BCE — the earliest fragment of any biblical text ever discovered. Its three lines widen from three words to five to seven, like two hands slowly opening (Numbers 6:24–26).])

// ===================== ADON OLAM =====================
#startprayer("Adon Olam · Eternal One", "אֲדוֹן עוֹלָם", sec: "Concluding", newpage: true)
#stanza("Adón olám ashér malách, b’térem kol y’tzir nivrá. L’et na’asá v’cheftzó kol, azái mélech sh’mó nikrá.",
  "אֲדוֹן עוֹלָם אֲשֶׁר מָלַךְ, בְּטֶרֶם כָּל יְצִיר נִבְרָא. לְעֵת נַעֲשָׂה בְחֶפְצוֹ כֹּל, אֲזַי מֶלֶךְ שְׁמוֹ נִקְרָא.")
#stanza("V’acharéi kichlót hakól, l’vadó yimlóch norá. V’hu hayá v’hu hové, v’hu yihyéh b’tif’ará.",
  "וְאַחֲרֵי כִּכְלוֹת הַכֹּל, לְבַדּוֹ יִמְלֹךְ נוֹרָא. וְהוּא הָיָה וְהוּא הֹוֶה, וְהוּא יִהְיֶה בְּתִפְאָרָה.")
#stanza("V’hu echád v’ein shení, l’hamshíl lo l’hachbíra. B’li reshít b’li tachlít, v’lo ha’óz v’hamisrá.",
  "וְהוּא אֶחָד וְאֵין שֵׁנִי, לְהַמְשִׁיל לוֹ לְהַחְבִּירָה. בְּלִי רֵאשִׁית בְּלִי תַכְלִית, וְלוֹ הָעֹז וְהַמִּשְׂרָה.")
#stanza("V’hu Elí v’chai go’alí, v’tzur chevlí b’et tzará. V’hu nisí umanós li, m’nát kosí b’yom ekrá.",
  "וְהוּא אֵלִי וְחַי גּוֹאֲלִי, וְצוּר חֶבְלִי בְּעֵת צָרָה. וְהוּא נִסִּי וּמָנוֹס לִי, מְנָת כּוֹסִי בְּיוֹם אֶקְרָא.")
#chatimah("B’yadó afkíd ruchí, b’et ishán v’a’íra. V’im ruchí g’viyatí, Adonai li v’lo irá.",
  "בְּיָדוֹ אַפְקִיד רוּחִי, בְּעֵת אִישַׁן וְאָעִירָה. וְעִם רוּחִי גְּוִיָּתִי, יְיָ לִי וְלֹא אִירָא.")
#eng("Eternal One, who reigned before any form was created; when all was made by Your will, then were You called Sovereign. And after all has ceased to be, You alone will reign in awe. You were, You are, You will be in glory.")
#eng("You are One; there is no second to compare or set beside You. Without beginning, without end — Yours are the strength and the majesty. You are my God, my living Redeemer, my Rock in time of trouble; my banner, my refuge, the portion of my cup on the day I call.")
#engn("Into Your hand I entrust my spirit, when I sleep and when I wake; and with my spirit, my body too — the Eternal is with me, I will not fear.",
  [A hymn of pure trust, sung to countless melodies. Often credited to Solomon ibn Gabirol of eleventh-century Spain, its author is finally unknown. Its closing lines — "into Your hand I entrust my spirit… I will not fear" — are the words said at bedtime and at the very end of life; ending the service with them lets each Shabbat close as a gentle rehearsal of letting go and being held.])
