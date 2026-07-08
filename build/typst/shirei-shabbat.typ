#import "book.typ": *
#show: book

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
    whoever you love, whether you have prayed a thousand Friday nights or none — you belong here, and
    this book is yours. It is meant to be sung from, wondered at, and learned from, all at once.
  ]
  v(12pt)
  eyebrow("How the page works"); v(7pt)
  set par(leading:0.72em)
  text(size:10.5pt)[
    On each page, the *Hebrew* runs down the outer edge, with a *transliteration* — the sounds in
    English letters — right beside it, so anyone can join the singing aloud. The *translation* sits
    just below, in italics; it is faithful but unafraid to be a little free where that lets it sing.
  ]
  v(8pt)
  text(size:10.5pt)[
    In the transliteration, an accent mark (as in *Elohéinu*) shows a syllable that is stressed
    *before* the last one; words without a mark are stressed on their final syllable, as Hebrew
    usually is. A small note at the foot of many prayers offers a piece of their story — a way to
    learn a little Torah simply by turning the pages.
  ]
  v(8pt)
  text(size:10.5pt)[
    The rail on the outer edge is a map: it shows the four parts of the evening — Kabbalat Shabbat,
    the Sh'ma and Its Blessings, the Amidah, and the Concluding prayers — and quietly marks where you
    are within them.
  ]
}
#pagebreak()

// ===================== KABBALAT SHABBAT — SECTION OPENER =====================
#sectionopener(0, "Welcoming Shabbat", "קַבָּלַת שַׁבָּת",
  [Kabbalat Shabbat — "welcoming Shabbat" — is the youngest part of the service, built in the
   1500s by the mystics of Safed, who walked into the fields at sunset to greet Shabbat as a bride.
   We begin with song and candlelight, move through the psalms that crown Creation, and rise to
   meet Shabbat with L'cha Dodi.],
  ("Yedid Nefesh","Lighting the Candles","Shalom Aleichem","Psalm 95","Psalm 96","Psalm 97",
   "Psalm 98","Psalm 99","Psalm 29","Ana B'koach","L'cha Dodi","Psalm 92","Psalm 93"))

// ===================== YEDID NEFESH =====================
#pagebreak(weak:true)
#startprayer("Yedid Nefesh", "יְדִיד נֶפֶשׁ")
#stanza("Yedid nefesh, Av harachamán, m'shoch avd'chá el r'tzonécha. Yarutz avd'chá k'mo ayál, yishtachavé el mul hadarécha. Ye'erav lo y'didotécha, minófet tzuf v'chol tá'am.",
  "יְדִיד נֶפֶשׁ אָב הָרַחֲמָן, מְשׁוֹךְ עַבְדְּךָ אֶל רְצוֹנֶךָ. יָרוּץ עַבְדְּךָ כְּמוֹ אַיָּל, יִשְׁתַּחֲוֶה אֶל מוּל הֲדָרֶךָ. יֶעֱרַב לוֹ יְדִידוֹתֶיךָ, מִנֹּפֶת צוּף וְכָל טָעַם.")
#stanza("Hadur na'é ziv ha'olám, nafshí cholat ahavatécha. Ána El na r'fa na lah, b'har'ot lah nó'am zivécha. Az titchazék v'titrapé, v'haytá lah simchat olám.",
  "הָדוּר נָאֶה זִיו הָעוֹלָם, נַפְשִׁי חוֹלַת אַהֲבָתֶךָ. אָנָּא אֵל נָא רְפָא נָא לָהּ, בְּהַרְאוֹת לָהּ נֹעַם זִיוֶךָ. אָז תִּתְחַזֵּק וְתִתְרַפֵּא, וְהָיְתָה לָהּ שִׂמְחַת עוֹלָם.")
#stanza("Vatik, yehemú na rachamécha, v'chúsa na al ben ahuvécha. Ki ze kamá nichsóf nichsáfti lir'ot m'herá b'tif'éret uzécha. Éle chamdá libí, v'chúsa na v'al tit'além.",
  "וָתִיק יֶהֱמוּ נָא רַחֲמֶיךָ, וְחוּסָה נָא עַל בֵּן אֲהוּבֶךָ. כִּי זֶה כַּמָּה נִכְסוֹף נִכְסַפְתִּי לִרְאוֹת מְהֵרָה בְּתִפְאֶרֶת עֻזֶּךָ. אֵלֶּה חָמְדָה לִבִּי, וְחוּסָה נָא וְאַל תִּתְעַלֵּם.")
#stanza("Higalé na uf'ros, chavíi, alái et sukat sh'lomécha. Ta'ir éretz mik'vodécha, nagíla v'nism'chá bach. Maher ehóv ki va mo'éd, v'chonénu kimei olám.",
  "הִגָּלֶה נָּא וּפְרוֹס חֲבִיבִי עָלַי אֶת סֻכַּת שְׁלוֹמֶךָ. תָּאִיר אֶרֶץ מִכְּבוֹדֶךָ, נָגִילָה וְנִשְׂמְחָה בָּךְ. מַהֵר אֶהֹב כִּי בָא מוֹעֵד, וְחָנֵּנוּ כִּימֵי עוֹלָם.")
#eng("Beloved of the soul, compassionate Source: draw me toward what You want of me. I would run like a deer to bow before Your splendor; Your love is sweeter to me than honey, than any taste. Splendor and grace, radiance of the world — my soul is sick with love for You.")
#eng("Please, heal her by letting her glimpse the sweetness of Your light; then she will grow strong and be well, and hers will be a joy without end. Timeless One, let Your mercy stir; have compassion on the beloved child. So long, so deeply I have ached to see the beauty of Your strength — this is my heart's desire; have compassion, and do not hide.")
#eng("Reveal Yourself, my Beloved, and spread over me the shelter of Your peace. Let the earth shine with Your glory — we will delight and rejoice in You. Hurry, Beloved: the time has come.")
#eng("Be gracious to us as in the days of old.")
#note([The four stanzas open with letters that spell the four-letter Name of God, so the poem's very
  shape is a quiet reaching for the Beloved. It is credited to Elazar Azikri (1533–1600) of Safed,
  whose own handwritten copy surfaced only in the twentieth century.])

// ===================== LIGHTING THE CANDLES =====================
#startprayer("Lighting the Shabbat Candles", "הַדְלָקַת נֵרוֹת")
#rubric([We kindle the lights, and then, covering our eyes, we bless.])
#v(8pt)
#stanza("Baruch atah Adonai Elohéinu mélech ha'olám, asher kid'shánu b'mitzvotáv v'tzivánu l'hadlik ner shel Shabbat.",
  "בָּרוּךְ אַתָּה יְיָ אֱלֹהֵינוּ מֶלֶךְ הָעוֹלָם, אֲשֶׁר קִדְּשָׁנוּ בְּמִצְוֹתָיו וְצִוָּנוּ לְהַדְלִיק נֵר שֶׁל שַׁבָּת.")
#eng("Blessed are You, HaShem our God, Presence of the universe, who makes us holy with mitzvot and calls us to kindle the light of Shabbat.")
#note([Kindling these lights is a mitzvah the Sages gave us, not one the Torah commands: the Talmud
  names its purpose as *shalom bayit*, peace in the home, since no household rests easy in the dark.
  The blessing first appears in the ninth-century prayerbook of Rav Amram Gaon.])

// ===================== SHALOM ALEICHEM =====================
#startprayer("Shalom Aleichem", "שָׁלוֹם עֲלֵיכֶם")
#stanza("Shalom aleichém, malachei ha-sharét, malachei elyón, mimélech malchei ham'lachím, haKadosh Baruch Hu.",
  "שָׁלוֹם עֲלֵיכֶם מַלְאֲכֵי הַשָּׁרֵת, מַלְאֲכֵי עֶלְיוֹן, מִמֶּלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.", label:"The traditional text")
#stanza("Bo'achém l'shalom, malachei ha-shalom, malachei elyón, mimélech malchei ham'lachím, haKadosh Baruch Hu.",
  "בּוֹאֲכֶם לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם, מַלְאֲכֵי עֶלְיוֹן, מִמֶּלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.")
#stanza("Barchúni l'shalom, malachei ha-shalom, malachei elyón, mimélech malchei ham'lachím, haKadosh Baruch Hu.",
  "בָּרְכוּנִי לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם, מַלְאֲכֵי עֶלְיוֹן, מִמֶּלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.")
#stanza("Tzet'chém l'shalom, malachei ha-shalom, malachei elyón, mimélech malchei ham'lachím, haKadosh Baruch Hu.",
  "צֵאתְכֶם לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם, מַלְאֲכֵי עֶלְיוֹן, מִמֶּלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדוֹשׁ בָּרוּךְ הוּא.")
#rubric([Each verse is sung three times.])
#v(9pt)
#stanza("Shalom aleichém malachei ha-shalom · Bo'achém l'shalom malachei ha-shalom · Barchúni l'shalom malachei ha-shalom · Tzet'chém l'shalom malachei ha-shalom.",
  "שָׁלוֹם עֲלֵיכֶם מַלְאֲכֵי הַשָּׁלוֹם · בּוֹאֲכֶם לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם · בָּרְכוּנִי לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם · צֵאתְכֶם לְשָׁלוֹם מַלְאֲכֵי הַשָּׁלוֹם.", label:"As we often sing it")
#eng("Peace be upon you, angels of peace, angels of the Most High.")
#eng("Come in peace, bless me with peace, and take your leave in peace.")
#eng("You charge Your angels to guard us on all our ways.")
#note([The Talmud imagines two angels walking each of us home on Shabbat eve — and teaches that if
  the home is warm and ready, even the doubting angel must answer *Amen*. The hymn itself is younger,
  composed by the kabbalists of Safed in the sixteenth or seventeenth century.])

// ===================== PSALMS & THE REST OF KABBALAT SHABBAT =====================
#include "content/psalms-A.typ"
#include "content/psalms-B.typ"
#include "content/ana-bkoach.typ"
#include "content/lcha-dodi.typ"
#include "content/psalms-92-93.typ"
