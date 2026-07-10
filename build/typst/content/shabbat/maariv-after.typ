#import "../../book.typ": *
#let ts(tr, he, label: none)={
  block(breakable:false,{
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hbt(he))
  }); v(3pt)
}

// ===================== EMET V’EMUNAH → MI CHAMOCHA =====================
#startprayer("Emet v’Emunah · True and Faithful", "אֱמֶת וֶאֱמוּנָה", sec: "Sh’ma & Its Blessings")
#stanza("Emet ve’emuna kol zot v’kayam aleinu, ki hu Adonai Eloheinu v’ein zulato, va’anachnu Yisra’el amo. Hapodeinu miyad m’lachim malkeinu, hago’aleinu mikaf kol he’aritzim.",
  "אֱמֶת וֶאֱמוּנָה כָּל־זֹאת וְקַיָּם עָלֵינוּ כִּי הוּא יְיָ אֱלֹהֵינוּ וְאֵין זוּלָתוֹ וַאֲנַחְנוּ יִשְׂרָאֵל עַמּוֹ. הַפּוֹדֵנוּ מִיַּד מְלָכִים מַלְכֵּנוּ הַגּוֹאֲלֵנוּ מִכַּף כָּל־הֶעָרִיצִים.")
#stanza("Hasam nafsheinu bachayim, v’lo natan lamot ragleinu.",
  "הַשָּׂם נַפְשֵׁנוּ בַּחַיִּים וְלֹא־נָתַן לַמּוֹט רַגְלֵנוּ.")
#stanza("Ha’oseh lanu nisim, vayotze et amo Yisra’el mitocham l’cherut olam.",
  "הָעֹשֶׂה לָּנוּ נִסִּים וַיּוֹצֵא אֶת־עַמּוֹ יִשְׂרָאֵל מִתּוֹכָם לְחֵרוּת עוֹלָם.")
#stanza("Hama’avir banav bein gizrei yam suf. V’ra’u vanav g’vurato, shibchu v’hodu lishmo. L’cha anu shira b’simcha raba, v’amru chulam:",
  "הַמַּעֲבִיר בָּנָיו בֵּין גִּזְרֵי יַם סוּף. וְרָאוּ בָנָיו גְּבוּרָתוֹ שִׁבְּחוּ וְהוֹדוּ לִשְׁמוֹ. לְךָ עָנוּ שִׁירָה בְּשִׂמְחָה רַבָּה וְאָמְרוּ כֻלָּם:")
#submark("Mi Chamocha")
#ts("Mi chamocha ba’elim Adonai, mi kamocha nedar bakodesh, nora t’hilot oseh fele.",
  "מִֽי־כָמֹ֤כָה בָּֽאֵלִם֙ יְיָ מִ֥י כָּמֹ֖כָה נֶאְדָּ֣ר בַּקֹּ֑דֶשׁ נוֹרָ֥א תְהִלֹּ֖ת עֹ֥שֵׂה פֶֽלֶא׃", label: "The Song at the Sea")
#ts("Malchut’cha ra’u vanecha, bokea yam lifnei Moshe uMiryam, ze Eli anu v’amru:",
  "מַלְכוּתְךָ רָאוּ בָנֶיךָ, בּוֹקֵעַ יָם לִפְנֵי מֹשֶׁה וּמִרְיָם, זֶה אֵלִי עָנוּ וְאָמְרוּ:")
#ts("Adonai yimloch l’olam va’ed.",
  "יְיָ יִמְלֹ֖ךְ לְעֹלָ֥ם וָעֶֽד׃")
#chatimah("V’ne’emar: ki fada Adonai et Ya’akov, ug’alo miyad chazak mimenu. Baruch ata Adonai, ga’al Yisra’el.",
  "וְנֶאֱמַר כִּי־פָדָה יְיָ אֶת יַעֲקֹב וּגְאָלוֹ מִיַּד חָזָק מִמֶּנּוּ. בָּרוּךְ אַתָּה יְיָ גָּאַל יִשְׂרָאֵל.")
#eng("All this we hold true and faithful, binding upon us: that You are our God, and there is none else, and we are Your people. You are the One who redeems us from the grip of tyrants and frees us from the hand of every oppressor.")
#eng("You keep our very soul among the living, and do not let our feet give way.")
#eng("You work wonders for us — and You brought Your people out from among their oppressors into lasting freedom.")
#eng("You led us through the parted sea. Beholding that power, we praised and gave thanks, and with great joy we all sang out:")
#eng("Who is like You among the mighty, O Source of freedom? Who is like You — glorious in holiness, awesome in praises, working wonders!")
#eng("Your children beheld Your majesty as You split the sea before Moses and Miriam; “This is my God!” they answered, and said:")
#eng("The One will reign forever and ever.")
#engn-near("And it is said: the Source has redeemed us and freed us from a hand stronger than our own. Blessed are You, Redeemer of Israel.",
  [This blessing links the Sh’ma to memory: having declared God’s oneness, we recall the Exodus as proof that oneness acts in history. Mi Chamocha is the song Moses and Miriam sang at the sea (Exodus 15:11, 18) — the liturgy places the redemption song here so that every evening ends by rehearsing the move from slavery to freedom.])

// ===================== HASHKIVENU =====================
// Adapted: the v'haser-satan clause is not printed; malkeinu → shomreinu (Daniel, 2026-07-08). Logged in DECISIONS-LOG.
#startprayer("Hashkivenu · Lay Us Down in Peace", "הַשְׁכִּיבֵנוּ", sec: "Sh’ma & Its Blessings", newpage: true)
#stanza("Hashkiveinu Adonai Eloheinu l’shalom, v’ha’amideinu shomreinu l’chayim, ufros aleinu sukat sh’lomecha, v’takneinu b’etza tova milfanecha, v’hoshi’einu l’ma’an sh’mecha.",
  "הַשְׁכִּיבֵנוּ יְיָ אֱלֹהֵינוּ לְשָׁלוֹם וְהַעֲמִידֵנוּ שׁוֹמְרֵנוּ לְחַיִּים וּפְרוֹשׂ עָלֵינוּ סֻכַּת שְׁלוֹמֶךָ וְתַקְּנֵנוּ בְּעֵצָה טוֹבָה מִלְּפָנֶיךָ וְהוֹשִׁיעֵנוּ לְמַעַן שְׁמֶךָ.")
#stanza("V’hagen ba’adeinu, v’haser me’aleinu oyev, dever v’cherev, v’ra’av v’yagon, uvtzel k’nafecha tastireinu, ki El shomreinu umatzileinu ata, ki El melech chanun v’rachum ata.",
  "וְהָגֵן בַּעֲדֵנוּ וְהָסֵר מֵעָלֵינוּ אוֹיֵב דֶּבֶר וְחֶרֶב וְרָעָב וְיָגוֹן וּבְצֵל כְּנָפֶיךָ תַּסְתִּירֵנוּ כִּי אֵל שׁוֹמְרֵנוּ וּמַצִּילֵנוּ אָתָּה כִּי אֵל מֶלֶךְ חַנּוּן וְרַחוּם אָתָּה.")
#stanza("Ushmor tzeteinu uvo’einu l’chayim ulshalom me’ata v’ad olam. Ufros aleinu sukat sh’lomecha.",
  "וּשְׁמוֹר צֵאתֵנוּ וּבוֹאֵנוּ לְחַיִּים וּלְשָׁלוֹם מֵעַתָּה וְעַד עוֹלָם. וּפְרוֹשׂ עָלֵינוּ סֻכַּת שְׁלוֹמֶךָ.")
#chatimah("Baruch ata Adonai, hapores sukat shalom aleinu v’al kol amo Yisra’el v’al Yerushalayim.",
  "בָּרוּךְ אַתָּה יְיָ הַפּוֹרֵשׂ סֻכַּת שָׁלוֹם עָלֵינוּ וְעַל כָּל עַמּוֹ יִשְׂרָאֵל וְעַל יְרוּשָׁלָיִם.")
#eng("Lay us down in peace, our God, and raise us up again to life. Spread over us Your shelter of peace, set us right with good counsel, and save us for the sake of Your name.")
#eng("Shield us: turn away from us the enemy, plague and sword, famine and grief. Hide us in the shadow of Your wings, for You are the One who guards and rescues us, gracious and compassionate.")
#engn("Watch over our going out and our coming in, for life and for peace, now and forever. Spread over us Your shelter of peace. Blessed are You, who spreads a shelter of peace over us, over all Your people Israel, and over Jerusalem.",
  [Hashkivenu is the prayer of nightfall’s vulnerability — sleep as a small rehearsal of trust. Its image of the sukat shalom, the "shelter of peace" spread overhead, gives the Friday-evening version its name; unlike the weekday close, Shabbat ends not with a plea for protection but with the serene canopy of peace.])

// ===================== V’SHAMRU =====================
#startprayer("V’shamru · Keep the Sabbath", "וְשָׁמְרוּ", sec: "Sh’ma & Its Blessings", newpage: true)
#ts("V’shamru v’nei Yisra’el et haShabbat, la’asot et haShabbat l’dorotam b’rit olam.",
  "וְשָׁמְר֥וּ בְנֵֽי־יִשְׂרָאֵ֖ל אֶת־הַשַּׁבָּ֑ת לַעֲשׂ֧וֹת אֶת־הַשַּׁבָּ֛ת לְדֹרֹתָ֖ם בְּרִ֥ית עוֹלָֽם׃")
#ts("Beini uvein b’nei Yisra’el ot hi l’olam, ki sheshet yamim asa Adonai et hashamayim v’et ha’aretz, uvayom hashvi’i shavat vayinafash.",
  "בֵּינִ֗י וּבֵין֙ בְּנֵ֣י יִשְׂרָאֵ֔ל א֥וֹת הִ֖וא לְעֹלָ֑ם כִּי־שֵׁ֣שֶׁת יָמִ֗ים עָשָׂ֤ה יְיָ אֶת־הַשָּׁמַ֣יִם וְאֶת־הָאָ֔רֶץ וּבַיּוֹם֙ הַשְּׁבִיעִ֔י שָׁבַ֖ת וַיִּנָּפַֽשׁ׃")
#eng("The people of Israel shall keep Shabbat, observing Shabbat in every generation as a covenant for all time.")
#engn("It is a sign forever between Me and the people of Israel, for in six days the Source made heaven and earth, and on the seventh day rested and drew breath.",
  [These verses from Exodus 31:16–17 name Shabbat as an ot, a "sign" of covenant. In the Torah’s word for God’s rest — vayinafash, "caught breath, was refreshed" — the rabbis heard nefesh, soul: as if even the Creator were re-souled on the seventh day, the model for our own weekly renewal.])

// ===================== CHATZI KADDISH =====================
#startprayer("Chatzi Kaddish · The Half-Kaddish", "חֲצִי קַדִּישׁ", sec: "Sh’ma & Its Blessings", newpage: true)
#stanza("Yitgadal v’yitkadash sh’meh raba. (Amen.) B’alma di v’ra chir’uteh, v’yamlich malchuteh b’chayeichon uvyomeichon uvchayei d’chol beit Yisra’el, ba’agala uvizman kariv, v’imru: Amen.",
  "יִתְגַּדַּל וְיִתְקַדַּשׁ שְׁמֵהּ רַבָּא. (אָמֵן.) בְּעָלְמָא דִּי־בְרָא כִרְעוּתֵהּ וְיַמְלִיךְ מַלְכוּתֵהּ בְּחַיֵּיכוֹן וּבְיוֹמֵיכוֹן וּבְחַיֵּי דְכָל־בֵּית יִשְׂרָאֵל בַּעֲגָלָא וּבִזְמַן קָרִיב וְאִמְרוּ אָמֵן.")
#stanza("Y’he sh’meh raba m’varach l’alam ulalmei almaya.",
  "יְהֵא שְׁמֵהּ רַבָּא מְבָרַךְ לְעָלַם וּלְעָלְמֵי עָלְמַיָּא.", label: "All")
#seasonmark[Ten Days: "l’eila ul’eila" — see p. 59]
#stanza("Yitbarach v’yishtabach v’yitpa’ar v’yitromam v’yitnase v’yit’hadar v’yit’ale v’yit’halal sh’meh d’kudsha b’rich hu, l’ela min kol birchata v’shirata, tushb’chata v’nechemata da’amiran b’alma, v’imru: Amen.",
  "יִתְבָּרַךְ וְיִשְׁתַּבַּח וְיִתְפָּאַר וְיִתְרוֹמַם וְיִתְנַשֵּׂא וְיִתְהַדָּר וְיִתְעַלֶּה וְיִתְהַלָּל שְׁמֵהּ דְקוּדְשָׁא בְּרִיךְ הוּא לְעֵלָּא מִן־כָּל־בִּרְכָתָא וְשִׁירָתָא תֻּשְׁבְּחָתָא וְנֶחָמָתָא דַּאֲמִירָן בְּעָלְמָא וְאִמְרוּ אָמֵן.")
#eng("May the great name be made great and holy in the world that was created by divine will. May its majesty be known in your lifetime and in your days and in the life of all the house of Israel, swiftly and soon — and say: Amen.")
#engn("May the great name be blessed forever and to all eternity. Blessed and praised, glorified and exalted, raised and honored, uplifted and celebrated be the name of the Holy One — far beyond any blessing or song, any praise or consolation that can be spoken in the world — and say: Amen.",
  [The Chatzi (Half) Kaddish marks a seam in the service, closing the Sh’ma and its blessings before the Amidah begins. Though famous as a mourner’s prayer, the Kaddish contains no mention of death: it is written in everyday Aramaic and is, at heart, a communal yearning for a world made whole.])
