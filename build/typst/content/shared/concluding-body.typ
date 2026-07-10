#import "../../book.typ": *
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
#stanza("Aleinu l’shabeach la’adon hakol, latet g’dula l’yotzer b’reshit, shelo asanu k’goyei ha’aratzot, v’lo samanu k’mishp’chot ha’adama; shelo sam chelkeinu kahem, v’goraleinu k’chol hamonam. Va’anachnu kor’im umishtachavim umodim, lifnei melech malchei ham’lachim, haKadosh baruch hu.",
  "עָלֵינוּ לְשַׁבֵּחַ לַאֲדוֹן הַכֹּל לָתֵת גְּדֻלָּה לְיוֹצֵר בְּרֵאשִׁית שֶׁלֹּא עָשָׂנוּ כְּגוֹיֵי הָאֲרָצוֹת וְלֹא שָׂמָנוּ כְּמִשְׁפְּחוֹת הָאֲדָמָה שֶׁלֹּא שָׂם חֶלְקֵנוּ כָּהֶם וְגוֹרָלֵנוּ כְּכָל הֲמוֹנָם. וַאֲנַחְנוּ כּוֹרְעִים וּמִשְׁתַּחֲוִים וּמוֹדִים לִפְנֵי מֶלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.")
#stanza("Shehu note shamayim v’yosed aretz, umoshav y’karo bashamayim mima’al, ushchinat uzo b’govhei m’romim. Hu Eloheinu ein od, emet malkeinu efes zulato, kakatuv b’torato: v’yadata hayom vahashevota el l’vavecha, ki Adonai hu ha’Elohim bashamayim mima’al v’al ha’aretz mitachat, ein od.",
  "שֶׁהוּא נוֹטֶה שָׁמַיִם וְיוֹסֵד אָרֶץ, וּמוֹשַׁב יְקָרוֹ בַּשָּׁמַיִם מִמַּעַל, וּשְׁכִינַת עֻזּוֹ בְּגָבְהֵי מְרוֹמִים. הוּא אֱלֹהֵינוּ אֵין עוֹד, אֱמֶת מַלְכֵּנוּ אֶפֶס זוּלָתוֹ, כַּכָּתוּב בְּתוֹרָתוֹ: וְיָדַעְתָּ הַיּוֹם וַהֲשֵׁבֹתָ אֶל לְבָבֶךָ, כִּי יְיָ הוּא הָאֱלֹהִים בַּשָּׁמַיִם מִמַּעַל וְעַל הָאָרֶץ מִתָּחַת, אֵין עוֹד.", label: "As it is written in the Torah")
#stanza("Al ken n’kave l’cha Adonai Eloheinu, lir’ot m’hera b’tif’eret uzecha, l’ha’avir gilulim min ha’aretz, v’ha’elilim karot yikaretun, l’taken olam b’malchut Shadai. V’chol b’nei vasar yikr’u vishmecha, l’hafnot eilecha kol rish’ei aretz.",
  "עַל כֵּן נְקַוֶּה לְךָ יְיָ אֱלֹהֵינוּ לִרְאוֹת מְהֵרָה בְּתִפְאֶרֶת עֻזֶּךָ, לְהַעֲבִיר גִּלּוּלִים מִן הָאָרֶץ וְהָאֱלִילִים כָּרוֹת יִכָּרֵתוּן, לְתַקֵּן עוֹלָם בְּמַלְכוּת שַׁדַּי. וְכָל בְּנֵי בָשָׂר יִקְרְאוּ בִשְׁמֶךָ, לְהַפְנוֹת אֵלֶיךָ כָּל רִשְׁעֵי אָרֶץ.")
#stanza("Yakiru v’yed’u kol yosh’vei tevel, ki l’cha tichra kol berech, tishava kol lashon. L’fanecha Adonai Eloheinu yichr’u v’yipolu, v’lichvod shimcha y’kar yitenu, vikab’lu chulam et ol malchutecha, v’timloch aleihem m’hera l’olam va’ed. Ki hamalchut shel’cha hi, ul’olmei ad timloch b’chavod, kakatuv b’toratecha: Adonai yimloch l’olam va’ed.",
  "יַכִּירוּ וְיֵדְעוּ כָּל יוֹשְׁבֵי תֵבֵל כִּי לְךָ תִכְרַע כָּל בֶּרֶךְ, תִּשָּׁבַע כָּל לָשׁוֹן. לְפָנֶיךָ יְיָ אֱלֹהֵינוּ יִכְרְעוּ וְיִפֹּלוּ, וְלִכְבוֹד שִׁמְךָ יְקָר יִתֵּנוּ, וִיקַבְּלוּ כֻלָּם אֶת עֹל מַלְכוּתֶךָ, וְתִמְלֹךְ עֲלֵיהֶם מְהֵרָה לְעוֹלָם וָעֶד. כִּי הַמַּלְכוּת שֶׁלְּךָ הִיא וּלְעוֹלְמֵי עַד תִּמְלוֹךְ בְּכָבוֹד, כַּכָּתוּב בְּתוֹרָתֶךָ: יְיָ יִמְלֹךְ לְעֹלָם וָעֶד.")
#chatimah("V’ne’emar: v’haya Adonai l’melech al kol ha’aretz, bayom hahu yihyeh Adonai echad ushmo echad.",
  "וְנֶאֱמַר: וְהָיָה יְיָ לְמֶלֶךְ עַל כָּל הָאָרֶץ, בַּיּוֹם הַהוּא יִהְיֶה יְיָ אֶחָד וּשְׁמוֹ אֶחָד.")
#eng("It is ours to praise the One of all, to give greatness to the One who forms creation — who did not make us like the nations of the lands, nor set us like the families of the earth; who did not make our portion like theirs, nor our lot like their multitude. And so we bend, and bow, and give thanks before the Sovereign beyond all sovereigns, the Holy One of blessing.")
#eng("The One who stretches out the heavens and founds the earth, whose glory dwells in the heavens above and whose strength abides in the highest heights — this is our God; there is no other. In truth our Sovereign, there is none else, as it is written in the Torah: Know this day and take it to heart, that the Eternal is God in the heavens above and on the earth below; there is no other.")
#eng("And so we place our hope in You, the Eternal our God — soon to behold the splendor of Your strength: when the idols of the earth have passed away and falsehood is swept from the world, and the world itself is mended whole beneath Your reign. Then all who live will call upon Your name, and all the earth’s wrongdoing will turn back toward You.")
#eng("Let all who dwell in the world come to know that to You alone every knee shall bend and every tongue pledge faith. Before You, the Eternal our God, may all bow low and give honor to Your name, and take upon themselves the yoke of Your reign — and may You reign over them, soon and forever. For sovereignty is Yours, and to all eternity You will reign in glory — as it is written in Your Torah: The Eternal will reign forever and ever.")
#engn("And it is said: The Eternal shall be Sovereign over all the earth; on that day the Eternal shall be One, and God’s name One.",
  [Aleinu began as a coronation prayer for the High Holy Days and, by the Middle Ages, became the seal of every service. We keep its ancient first paragraph in full — long a target of Christian censors — hearing its distinction of Israel not as superiority but as particular calling: every people in this room has one. Its second paragraph gave the tradition one of its defining phrases — #emph[l’takken olam], "to mend the world" — a hope not of conquest but of repair, when every people comes to know the One.])

// ===================== MOURNER’S KADDISH =====================
#startprayer("Mourner’s Kaddish", "קַדִּישׁ יָתוֹם", sec: "Concluding", newpage: true)
#rubric([Mourners rise; all who wish may stand with them.])
#stanza("Yitgadal v’yitkadash sh’meh raba. (Amen.) B’alma di v’ra chir’uteh, v’yamlich malchuteh b’chayeichon uvyomeichon uvchayei d’chol beit Yisra’el, ba’agala uvizman kariv, v’imru: Amen.",
  "יִתְגַּדַּל וְיִתְקַדַּשׁ שְׁמֵהּ רַבָּא. (אָמֵן.) בְּעָלְמָא דִּי־בְרָא כִרְעוּתֵהּ וְיַמְלִיךְ מַלְכוּתֵהּ בְּחַיֵּיכוֹן וּבְיוֹמֵיכוֹן וּבְחַיֵּי דְכָל־בֵּית יִשְׂרָאֵל בַּעֲגָלָא וּבִזְמַן קָרִיב וְאִמְרוּ אָמֵן.")
#stanza("Y’he sh’meh raba m’varach l’alam ulalmei almaya.",
  "יְהֵא שְׁמֵהּ רַבָּא מְבָרַךְ לְעָלַם וּלְעָלְמֵי עָלְמַיָּא.", label: "All")
#seasonmark[Ten Days: "l’eila ul’eila" — see p. 59]
#stanza("Yitbarach v’yishtabach v’yitpa’ar v’yitromam v’yitnase v’yit’hadar v’yit’ale v’yit’halal sh’meh d’kudsha b’rich hu, l’ela min kol birchata v’shirata, tushb’chata v’nechemata da’amiran b’alma, v’imru: Amen.",
  "יִתְבָּרַךְ וְיִשְׁתַּבַּח וְיִתְפָּאַר וְיִתְרוֹמַם וְיִתְנַשֵּׂא וְיִתְהַדָּר וְיִתְעַלֶּה וְיִתְהַלָּל שְׁמֵהּ דְקוּדְשָׁא בְּרִיךְ הוּא, לְעֵלָּא מִן־כָּל בִּרְכָתָא וְשִׁירָתָא תֻּשְׁבְּחָתָא וְנֶחָמָתָא דַּאֲמִירָן בְּעָלְמָא, וְאִמְרוּ אָמֵן.")
#stanza("Y’he sh’lama raba min sh’maya, v’chayim aleinu v’al kol Yisra’el, v’imru: Amen.",
  "יְהֵא שְׁלָמָא רַבָּא מִן שְׁמַיָּא, וְחַיִּים עָלֵינוּ וְעַל כָּל יִשְׂרָאֵל, וְאִמְרוּ אָמֵן.")
#ritual([some step back, bowing, taking leave])
#chatimah("Oseh shalom bimromav, hu ya’aseh shalom aleinu, v’al kol Yisra’el, v’al kol yosh’vei tevel, v’imru: Amen.",
  "עוֹשֶׂה שָׁלוֹם בִּמְרוֹמָיו, הוּא יַעֲשֶׂה שָׁלוֹם עָלֵינוּ, וְעַל כָּל יִשְׂרָאֵל, וְעַל כָּל יוֹשְׁבֵי תֵבֵל, וְאִמְרוּ אָמֵן.")
#eng("May the great name be made great and holy in the world that was created by divine will. May its majesty be known in your lifetime and in your days and in the life of all the house of Israel, swiftly and soon — and say: Amen.")
#eng("May the great name be blessed forever and to all eternity. Blessed and praised, glorified and exalted, raised and honored, uplifted and celebrated be the name of the Holy One — far beyond any blessing or song, any praise or consolation that can be spoken in the world — and say: Amen.")
#engn-near("May great peace from heaven, and life, be upon us and upon all Israel — and say: Amen. May the One who makes peace in the high places make peace for us, for all Israel, and for all who dwell on earth — and say: Amen.",
  [The Kaddish never mentions death; it is a soaring praise of life and a yearning for a world made whole, spoken in the everyday Aramaic once shared across Jewish communities. We add #emph[v’al kol yosh’vei tevel] — "and upon all who dwell on earth" — widening the circle of peace to embrace the whole human family.])

// ===================== PRIESTLY BLESSING =====================
#startprayer("Birkat Kohanim · The Blessing", "בִּרְכַּת כֹּהֲנִים", sec: "Concluding", newpage: true)
#rubric([The clergy may offer this ancient blessing over the community.])
#ts("Y’varech’cha Adonai v’yishm’recha.",
  "יְבָרֶכְךָ֥ יְיָ וְיִשְׁמְרֶֽךָ׃")
#ts("Ya’er Adonai panav eilecha vichuneka.",
  "יָאֵ֨ר יְיָ פָּנָ֛יו אֵלֶ֖יךָ וִֽיחֻנֶּֽךָּ׃")
#ts([#text(fill:GOLDD)[Yisa Adonai panav eilecha v’yasem l’cha shalom.]],
  [#text(fill:GOLDD)[יִשָּׂ֨א יְיָ פָּנָיו֙ אֵלֶ֔יךָ וְיָשֵׂ֥ם לְךָ֖ שָׁלֽוֹם׃]])
#engn-near("May the Eternal bless you and keep you. May the Eternal’s face shine upon you and be gracious to you. May the Eternal’s face turn toward you and grant you peace.",
  [This is the oldest blessing still in daily use: its words were found inscribed on tiny silver scrolls from the seventh century BCE — the earliest fragment of any biblical text ever discovered. Its three lines widen from three words to five to seven, like two hands slowly opening (Numbers 6:24–26).])

// ===================== ADON OLAM =====================
#startprayer("Adon Olam · Eternal One", "אֲדוֹן עוֹלָם", sec: "Concluding", newpage: true)
#stanza("Adon olam asher malach, b’terem kol y’tzir nivra. L’et na’asa v’cheftzo kol, azai melech sh’mo nikra.",
  "אֲדוֹן עוֹלָם אֲשֶׁר מָלַךְ, בְּטֶרֶם כָּל יְצִיר נִבְרָא. לְעֵת נַעֲשָׂה בְחֶפְצוֹ כֹּל, אֲזַי מֶלֶךְ שְׁמוֹ נִקְרָא.")
#stanza("V’acharei kichlot hakol, l’vado yimloch nora. V’hu haya v’hu hove, v’hu yihyeh b’tif’ara.",
  "וְאַחֲרֵי כִּכְלוֹת הַכֹּל, לְבַדּוֹ יִמְלֹךְ נוֹרָא. וְהוּא הָיָה וְהוּא הֹוֶה, וְהוּא יִהְיֶה בְּתִפְאָרָה.")
#stanza("V’hu echad v’ein sheni, l’hamshil lo l’hachbira. B’li reshit b’li tachlit, v’lo ha’oz v’hamisra.",
  "וְהוּא אֶחָד וְאֵין שֵׁנִי, לְהַמְשִׁיל לוֹ לְהַחְבִּירָה. בְּלִי רֵאשִׁית בְּלִי תַכְלִית, וְלוֹ הָעֹז וְהַמִּשְׂרָה.")
#stanza("V’hu Eli v’chai go’ali, v’tzur chevli b’et tzara. V’hu nisi umanos li, m’nat kosi b’yom ekra.",
  "וְהוּא אֵלִי וְחַי גּוֹאֲלִי, וְצוּר חֶבְלִי בְּעֵת צָרָה. וְהוּא נִסִּי וּמָנוֹס לִי, מְנָת כּוֹסִי בְּיוֹם אֶקְרָא.")
#chatimah("B’yado afkid ruchi, b’et ishan v’a’ira. V’im ruchi g’viyati, Adonai li v’lo ira.",
  "בְּיָדוֹ אַפְקִיד רוּחִי, בְּעֵת אִישַׁן וְאָעִירָה. וְעִם רוּחִי גְּוִיָּתִי, יְיָ לִי וְלֹא אִירָא.")
#eng("Eternal One, who reigned before any form was created; when all was made by Your will, then were You called Sovereign. And after all has ceased to be, You alone will reign in awe. You were, You are, You will be in glory.")
#eng("You are One; there is no second to compare or set beside You. Without beginning, without end — Yours are the strength and the majesty. You are my God, my living Redeemer, my Rock in time of trouble; my banner, my refuge, the portion of my cup on the day I call.")
#engn("Into Your hand I entrust my spirit, when I sleep and when I wake; and with my spirit, my body too — the Eternal is with me, I will not fear.",
  [A hymn of pure trust, sung to countless melodies. Often credited to Solomon ibn Gabirol of eleventh-century Spain, its author is finally unknown. Its closing lines — "into Your hand I entrust my spirit… I will not fear" — are the words said at bedtime and at the very end of life; ending the service with them lets each Shabbat close as a gentle rehearsal of letting go and being held.])
