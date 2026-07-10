// ============================================================================
// EDITION MANIFEST — Shirei Shabbat · Songs of Shabbat (Friday-night Ma'ariv)
// ----------------------------------------------------------------------------
// AR-1 (QS-ARCH, 2026-07-09): each volume is a small manifest module consumed
// by book.typ. This file holds everything volume-specific — the unit registry,
// display aliases, rail captions, wordmark, title metadata, and the count of
// front-of-book "opener" sections. book.typ stores no volume of its own; it
// receives this dict via `#show: book.with(edition: EDITION)` and reads it
// through the `ss-edition` state.
//
// SOURCE OF TRUTH DISCIPLINE (unchanged): rail captions are governed by
// liturgy-map/CAPTIONS.md — edit it first, then re-wire `captions` here, and
// nowhere else. `units` mirrors the sectionopener() item lists in
// shirei-shabbat-FULL.typ (keep them in sync per FORK-YOUR-OWN.md §3).
//
// Moved verbatim from book.typ on 2026-07-09 (ARCH W2). No liturgical content
// changed — this is a pure relocation.
// ============================================================================

// ---------------- UNITS registry ---------------------------------------------
// Mirrors the sectionopener() item lists in shirei-shabbat-FULL.typ.
// startprayer() resolves the current unit against these names (see
// unit-lookup in book.typ); the rail's expanded list renders from here too.
#let _units=(
  (name:"Kabbalat Shabbat", units:(
    "Yedid Nefesh","Lighting the Candles","Shalom Aleichem","Psalm 95",
    "Psalm 96","Psalm 97","Psalm 98","Psalm 99","Psalm 29","Ana B'koach",
    "L'cha Dodi","Psalm 92","Psalm 93")),
  (name:"Sh'ma & Its Blessings", units:(
    "Bar'chu","Ma'ariv Aravim","Ahavat Olam","The Sh'ma","V'ahavta & Tzitzit",
    "Emet v'Emunah","Mi Chamocha","Hashkivenu","V'shamru","Chatzi Kaddish")),
  (name:"Amidah", units:(
    "The Silent Amidah","Avot v'Imahot","G'vurot","K'dushat HaShem",
    "K'dushat HaYom","Avodah","Modim","Shalom Rav","Elohai N'tzor",
    "Vayechulu","Me'ein Sheva","Kaddish Shalem")),
  (name:"Concluding", units:(
    "Mi Shebeirach — Healing","Aleinu","Mourner's Kaddish","Priestly Blessing",
    "Adon Olam")),
  // v8 A12: back-matter section so the rail stops falsely showing "Concluding"
  // across the seasonal/Kiddush pages. Not one of the four evening movements,
  // so the section OPENERS list only the first `opener-count` sections; the
  // rail (a fuller map) shows all five.
  (name:"Seasonal & Kiddush", units:(
    "Rise and Come","For the Miracles","In the Days of Mordechai",
    "Remember Us for Life","Counting the Omer","Festival Kiddush","Shehecheyanu","Kiddush")),
)

// English display titles in the content files that don't share a prefix with
// their registry unit name. Keys are lowercased stems (the part of `en`
// before "·", trimmed); values are canonical unit names from `_units`.
#let _aliases=(
  "lighting the shabbat candles": "Lighting the Candles",
  "we open our lips":             "The Silent Amidah",
  "our fathers and mothers":      "Avot v'Imahot",
  "divine power":                 "G'vurot",
  "the holiness of the name":     "K'dushat HaShem",
  "the holiness of the day":      "K'dushat HaYom",
  "draw near":                    "Avodah",
  "we give thanks":               "Modim",
  "abundant peace":               "Shalom Rav",
  "my god, guard my tongue":      "Elohai N'tzor",
  "birkat kohanim":               "Priestly Blessing",
)

// ---------------- CAPTIONS -----------------------------------------------------
// One "what's happening now" line per unit, shown below the accordion rail.
// FINAL COPY — wired 2026-07-05 from liturgy-map/CAPTIONS.md ("CAPTIONS
// dictionary (for book-v2.typ)" section; 41 approved lines, ALTs resolved).
// Edit CAPTIONS.md first, then re-wire here — and nowhere else. The last two
// keys ("Seasonal Insertions", "Kiddush") cover the back-matter families and
// stay unused until the rail learns back matter.
#let _captions=(
  "Yedid Nefesh": "We open with a love song — the soul aching toward its Beloved before a word of liturgy is spoken.",
  "Lighting the Candles": "Two flames, and Shabbat begins. We cover our eyes to bless the light before we let ourselves see it.",
  "Shalom Aleichem": "We welcome the unseen guests home with us — greeting the angels who, tradition says, walk each of us in.",
  "Psalm 95": "The first of the welcoming psalms — an invitation to sing that turns, mid-breath, into a warning not to harden.",
  "Psalm 96": "Six psalms — one for each day of the week just ended — before we rise to greet Shabbat herself.",
  "Psalm 97": "Still climbing through the six weekday psalms — the earth trembling, the far shores glad, as sovereignty is sung into being.",
  "Psalm 98": "All creation joins the choir — rivers clapping, mountains singing — as we sing our way toward the seventh day.",
  "Psalm 99": "The last of the weekday psalms of ascent — three times it names the Holy One before we reach the storm.",
  "Psalm 29": "The thunderstorm psalm that crowns the week — the world's roar resolving, in its final word, into peace.",
  "Ana B'koach": "A whispered plea between the psalms and the bride — seven short lines, an ancient reaching to be set free.",
  "L'cha Dodi": "We rise and turn to the door: the week is behind us, and Shabbat the bride is arriving now.",
  "Psalm 92": "Shabbat has arrived — now the first psalm sung inside it, the only one the Torah names for this day.",
  "Psalm 93": "The psalm of Friday itself — we close the week by singing the very crown creation sang when it was new.",
  "Bar'chu": "The formal call to prayer — the moment a room of individuals becomes a community. We rise together.",
  "Ma'ariv Aravim": "Night is falling as we pray — the first blessing thanks the One who turns the sky, evening after evening.",
  "Ahavat Olam": "Before we command ourselves to love, we pause on the love already given — Torah handed to us as tenderness.",
  "The Sh'ma": "The line we say lying down and rising up, and hope to say last of all — Israel's whole faith in six words.",
  "V'ahavta & Tzitzit": "And now the answer: love with all your heart — bound to the hand, worn on the fringe, spoken to the children.",
  "Emet v'Emunah": "Having declared the One, we remember the sea — the third blessing turns from creed to the memory of freedom.",
  "Mi Chamocha": "The song at the shore, sung again tonight — the moment slavery broke open and a people first sang free.",
  "Hashkivenu": "We ask to be laid down safely into the dark — sleep as a nightly act of trust, under a canopy of peace.",
  "V'shamru": "Two verses from Sinai, sung: Shabbat as the sign of an unbreakable promise, kept in every generation.",
  "Chatzi Kaddish": "A hinge in the service — this short Kaddish closes the Sh'ma and its blessings and turns us toward the Amidah.",
  "The Silent Amidah": "Three steps forward, as if entering a small room — and for a few minutes a hall full of people goes quiet together.",
  "Avot v'Imahot": "We enter by naming our people — every mother and father, the remembered and the long-unnamed, standing behind us.",
  "G'vurot": "The blessing of the power that revives — of falling and being held, of the buried seed and the returning green.",
  "K'dushat HaShem": "Alone and silent, the holiness prayer stays in its oldest, plainest form — three sentences holding one word to the light.",
  "K'dushat HaYom": "The one blessing that changes with the day — tonight it becomes our meditation on rest itself.",
  "Avodah": "We ask that our prayer be received the way an offering once was — the Presence longed home to dwell among us.",
  "Modim": "The blessing that stops to count the ordinary — breath, morning, the body's small mercies — the miracles we forget are miracles.",
  "Shalom Rav": "The evening's own plea for peace — shorter than its daytime sister, asking a covering of quiet over Israel and all who sleep tonight.",
  "Elohai N'tzor": "It begins by asking to guard the tongue, then opens a silence — room to pour in whatever we could not say aloud.",
  "Vayechulu": "After the long hush of the silent prayer, sound comes back into the room — the very words Genesis uses for the first evening finished.",
  "Me'ein Sheva": "Friday night's own communal blessing, sung aloud — a kindness born to let latecomers finish and walk home safe.",
  "Kaddish Shalem": "The full Kaddish seals the Amidah — asking, beyond every praise, that the prayers just offered be received.",
  "Mi Shebeirach — Healing": "We speak the names aloud, or hold them in the heart — the community turning to care for its own.",
  "Aleinu": "The bow that seals every service — we bend together, rising toward the day when God's name is One.",
  "Mourner's Kaddish": "Mourners rise; the community answers, and no one grieves alone — a prayer for the dead with no word for death.",
  "Priestly Blessing": "The oldest words still spoken among us — three lines widening like two hands slowly opening over the room.",
  "Adon Olam": "We close as we will one night close everything — a song of trust, letting go, and being held.",
  "Seasonal Insertions": "The words we fold in only when the calendar asks — festival, new moon, the days the Book of Life lies open.",
  "Kiddush": "We lift the cup and say it aloud: Shabbat is holy — the world made, and a people set free, in one blessing.",
)

// ---------------- the manifest -----------------------------------------------
// The single dict book.typ consumes. `sections` is derived (the flat name list
// the section openers and rail iterate); `opener-count` is how many of them are
// front-of-book movement openers (the 5th, "Seasonal & Kiddush", is rail-only).
#let EDITION=(
  wordmark: "SHIREI SHABBAT",
  title: (en: "Shirei Shabbat", full: "Shirei Shabbat · Songs of Shabbat", he: "שִׁירֵי שַׁבָּת"),
  opener-count: 4,
  units: _units,
  sections: _units.map(s => s.name),
  aliases: _aliases,
  captions: _captions,
)
