// ============================================================================
// Shirei Shabbat · Songs of Shabbat — COMPLETE FRIDAY-NIGHT SIDDUR (single doc)
// Front matter unnumbered; page 1 begins at Kabbalat Shabbat; continuous numbering.
// ============================================================================
#import "book.typ": *
#show: book

// ---------- FRONT MATTER (unnumbered) ----------
#include "content/frontmatter.typ"

// ---------- page numbering begins at Kabbalat Shabbat ----------
// (2026-07-05 stray-folio fix: frontmatter.typ now ends on its own hard
// #pagebreak(), so this reset and sectionopener's started.update(true) land
// on that already-fresh page instead of leaking onto frontmatter's last
// printed page. Seed at 1, not 0, since no further pagebreak occurs before
// the Kabbalat Shabbat opener prints.)
#counter(page).update(1)

// ================= 1 · KABBALAT SHABBAT =================
#sectionopener(0, "Welcoming Shabbat", "קַבָּלַת שַׁבָּת",
  [Kabbalat Shabbat — "welcoming Shabbat" — is the youngest part of the service, built in the
   1500s by the mystics of Safed, who walked into the fields at sunset to greet Shabbat as a bride.
   We begin with song and candlelight, move through the psalms that crown Creation, and rise to
   meet Shabbat with L'cha Dodi.],
  ("Yedid Nefesh","Lighting the Candles","Shalom Aleichem","Psalm 95","Psalm 96","Psalm 97",
   "Psalm 98","Psalm 99","Psalm 29","Ana B'koach","L'cha Dodi","Psalm 92","Psalm 93"),
  cue: [However we each greet her, we rise together at L'cha Dodi and turn to meet the bride.],
  epithet: [singing the week out, welcoming her in])
#include "content/kabbalat-inline.typ"
#include "content/psalms-A.typ"
#include "content/psalms-B.typ"
#include "content/ana-bkoach.typ"
#include "content/lcha-dodi.typ"
#include "content/psalms-92-93.typ"

// ================= 2 · SH'MA & ITS BLESSINGS =================
// (2026-07-06/07) Compact opener (R6 dedupe): Daniel wants this opener and
// the whole Bar'chu unit (incl. its footnote) to share one page. Formerly an
// inline copy; now sectionopener(..., compact: true) in book.typ — same
// structure, copy, metrics, and state/rail behavior, render-verified identical.
#sectionopener(1, "Sh'ma & Its Blessings", "שְׁמַע וּבִרְכוֹתֶיהָ",
  [The heart of the evening: Israel's watchword of God's oneness, wrapped in blessings for the One
   who brings on evening, who loves us through Torah, and who redeems. We rise for Bar'chu and move
   through creation, revelation, and redemption to the Sh'ma itself.],
  ("Bar'chu","Ma'ariv Aravim","Ahavat Olam","The Sh'ma","V'ahavta & Tzitzit","Emet v'Emunah","Mi Chamocha","Hashkivenu","V'shamru","Chatzi Kaddish"),
  cue: [Scattered or gathered, we come back to the gold line as one.],
  epithet: [one God: creation, love, freedom],
  compact: true)
#include "content/maariv-before.typ"
#include "content/maariv-shma.typ"
#include "content/maariv-after.typ"

// ================= 3 · AMIDAH =================
// (2026-07-06) Renamed "The Standing Prayer"/עֲמִידָה → "T'filah"/תְּפִלָּה (Daniel).
// (2026-07-08, Wave 4 · D1) Reverted to AMIDAH everywhere per Daniel's panel ruling —
// the opener now joins the rest of the book (tab/rail/mini-TOCs/eyebrows already said Amidah).
// (2026-07-07) Compact opener (R6 dedupe): "We Open Our Lips" (Adonai s'fatai,
// the first unit of amidah-silent.typ) begins ON the opener page. Formerly an
// inline copy; now sectionopener(..., compact: true) in book.typ — same
// structure, copy, metrics, and state/rail behavior, render-verified identical.
#sectionopener(2, "Amidah", "עֲמִידָה",
  [The #emph[Amidah] — "the standing" — is the prayer of prayers; tradition also calls it simply #emph[T'filah], "prayer." We pray it silently, each at our own pace — seven
   blessings for Shabbat — then rise together for Vayechulu and Me'ein Sheva, Friday night's own
   communal blessing that gathers the whole Amidah into one.],
  ("The Silent Amidah","Avot v'Imahot","G'vurot","K'dushat HaShem","K'dushat HaYom","Avodah","Modim","Shalom Rav","Elohai N'tzor","Vayechulu","Me'ein Sheva"),
  cue: [From the silence, we gather again at the gold line and turn.],
  epithet: [standing close, each in our own silence],
  compact: true)
#include "content/amidah-silent.typ"
#include "content/amidah-vayechulu.typ"
#include "content/amidah-meein-sheva.typ"

// ================= 4 · CONCLUDING =================
#sectionopener(3, "Concluding Prayers", "סִיּוּם",
  [We gather what the evening has opened. We pray for healing, bow the ancient bow that seals
   every service, hold our dead in the community's arms, receive a blessing as old as Scripture,
   and close with a hymn of trust — Shabbat carrying us out as gently as it drew us in.],
  ("Mi Shebeirach — Healing","Aleinu","Mourner's Kaddish","Priestly Blessing","Adon Olam"),
  cue: [One last time, we meet at the gold line — then out into the week together.],
  epithet: [healing, memory, blessing — and out into the week])
#include "content/concluding-body.typ"

// ================= BACK MATTER =================
#pagebreak(weak:true)
#v(0.2in)
#text(size:22pt, weight:"bold", fill:TWID)[Seasonal Insertions & Kiddush]
// (escaping fix 2026-07-05: `line`/`v` were markup-mode text after the first
// `#v(6pt);` — they printed literally on this opener page. Each call needs
// its own `#`.)
#v(6pt); #line(length:100%, stroke:1pt+GOLD); #v(10pt)
#text(size:10.5pt, style:"italic", fill:MUT)[The words we add when the calendar calls for them, and the Kiddush over wine.]
#v(8pt)
#include "content/seasonal-insertions.typ"
#include "content/kiddush.typ"
