# Choreography Map — Shirei Shabbat

> **DEPRECATED — 2026-07-05.** Superseded by `liturgy-map/RITUAL-MARKS.md` per Daniel's same-day pivot: no RISE/SIT/SUNG posture glyphs will print — the rabbi announces communal movement live, and the margin carries **ritual marks** (small gold glyphs + "some of us…" micro-labels at unannounced embodied practices) instead. All posture/voice cue rows below are retired. **This file is not deleted: it remains the source archive — every Sefaria citation in it was verified on 2026-07-05 and remains authoritative; RITUAL-MARKS.md carries its sources over from here rather than re-researching them.**

**Date:** 2026-07-05
**Status:** DRAFT — awaiting Daniel review
**Rule:** Nothing in this file enters the book until Daniel approves it. Phase 1 R1 output only (see `03_MARGIN_SYSTEM_PLAN.md`). The CRC column is Daniel's alone — no agent may fill a ☐.

---

## How to read this map

- **Cues:** RISE · SIT · BOW · SUNG (sung together) · LEADER (leader alone). These correspond to the five drawn glyphs (indigo = posture, gold = voice).
- **Anchor** = the exact line/word in the current `build/typst/content/*.typ` draft where the glyph would sit.
- **Traditional** = codified or widely attested practice, verified against Sefaria (Shulchan Aruch OC = SA OC; Mishnah Berurah = MB; Arukh HaShulchan = AhS). Every citation below was looked up, not recalled.
- **Reform** = common Mishkan T'filah–era practice. MT itself prints almost **no** choreography rubrics; "Reform practice" is congregational custom, so most entries carry medium confidence at best.
- **CRC** = ☐ Daniel only.
- **Confidence:** `[high]` codified law verified · `[med]` attested custom or widespread practice · `[low]` varies congregation to congregation.
- ⚠ = traditional and Reform practice diverge; needs Daniel's call.
- **All SUNG rows are congregation-dependent by nature** (what CRC sings together is a setlist fact, not a halachic one). Every SUNG row is therefore marked CRC-fill regardless of what other communities do.
- Bowing mechanics, when a BOW cue appears: bend the knees at *Baruch*, bow the body at *atah*, straighten before the divine Name (MB 113:12; Kitzur SA 18:11 — verified).

---

## 1 · Kabbalat Shabbat

### Yedid Nefesh

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit | Sung as an opening niggun in many communities; a 16th-c. Safed addition with no codified choreography. Seated. [med] | Widely used as gathering song in MT-era services; seated. [med] | ☐ Daniel: |

No posture cues. Traditional and Reform agree: seated, no bows.

### Lighting the Shabbat Candles

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| LEADER | rubric "We kindle the lights…" | One person (classically the householder) lights; light first, shield the eyes/hand, *then* bless, so the blessing precedes the benefit (Rema, SA OC 263:5 — verified). [high] | A member or clergy lights; congregation often sings the blessing together after lighting. [med] | ☐ Daniel: |
| SUNG | "Barúch atá Adonai… l'hadlik ner shel Shabbat" | Said by the one lighting. [high] | Commonly sung by all. ⚠ (solo act vs communal song) [med] | ☐ Daniel: |

Posture: no rise traditionally or in common Reform practice (congregation seated while one lights). [med]

### Shalom Aleichem

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit | A home table-song (Safed kabbalists; angels of Shabbat 119b:3 — verified); when imported into the synagogue, sung seated; some communities stand at home. No codified posture. [low] | Sung together; posture varies widely — many seated, some rise. [low] | ☐ Daniel: |

### Psalm 95 · Psalm 96 · Psalm 97 · Psalm 98 · Psalm 99 · Psalm 29

One row covers all six (identical choreography):

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | each psalm, first line | The six psalms of Kabbalat Shabbat (AhS OC 242:40 — verified — describes the sequence Ps 95→29 said seated, as the week's six days). No rise, no bow. [med] | MT services typically sing one or two of the six (95/96/98 commonly) and read or skip the rest; seated. [med] | ☐ Daniel: |

Current draft's `#rubric([Recited])` on Ps 95 (psalms-A.typ:11) and Ps 92 (psalms-92-93.typ:9) already implies a spoken/sung split inside units — that's a SUNG-boundary question for Daniel, not a posture one.

### Ana B'koach

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit | Kabbalistic insertion after Ps 29; recited or sung seated; no codified choreography (post-talmudic; not in SA). [med] | Where used at all, sung (often the Idan Raichel-era melodies); seated. [low] | ☐ Daniel: |
| LEADER? | closing line "Baruch shem k'vod…" | Whispered line, said by all (parallel to Sh'ma practice). [low] | Varies. [low] | ☐ Daniel: |

### L'cha Dodi

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | refrain "L'cha dodi likrat kalá…" | Sung; verses often alternate leader/congregation, refrain by all. [med] | Sung by all; most congregations sing a subset of verses (a `variant:` note per the style guide will be needed if CRC sings 5 of 9). [med] | ☐ Daniel: |
| RISE ⚠anchor | final stanza, "Bó'i v'shalóm…" (lcha-dodi.typ:39) | Rise for the last stanza and say it standing (AhS OC 242:40 — verified: "ואומרים זה בעמידה"). [high] | Same — rising at Bo'i v'shalom is near-universal in Reform practice too. Aligned. [med] | ☐ Daniel: |
| turn (RISE glyph annotation) | at "Bó'i v'shalóm" — turn toward the entrance | Turn to face **west** / the door to greet the bride (AhS OC 242:40 — verified: "מחזירין פניהם למערב"), echoing R. Chanina & R. Yannai going out to greet Shabbat the queen (Shabbat 119a:2 — verified). [high] | Same custom, usually phrased "face the entrance." Aligned. [med] | ☐ Daniel: |
| BOW | the three-fold "bó'i chalá, bó'i chalá, bó'i chalá Shabbat malk'tá" | Widespread custom to dip/bow at each *bo'i chalah* (attested practice; **not** codified in SA/AhS — flagging honestly). [med] | Common but far from universal; often just a nod. [low] | ☐ Daniel: |

### Psalm 92 · Psalm 93

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | "Mizmór shir l'yom haShabbát" | Ps 92 is "the essential act of Kabbalat Shabbat" (AhS OC 242:40 — verified); remain standing from Bo'i v'shalom through the opening of Ps 92 in many customs, then sit. [med] | Often sung ("Tov l'hodot"); posture rarely cued. [low] | ☐ Daniel: |
| SIT | after the opening of Ps 92 (or at Ps 93) | Sit after the formal welcome is complete; exact sit-point is custom, not law. [low] | Congregation usually seated well before this. ⚠ (where does CRC sit back down after L'cha Dodi?) [low] | ☐ Daniel: |

---

## 2 · Sh'ma & Its Blessings

### Bar'chu

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE | unit start, before "Barchú et Adonai ham'vorách" | Stand for Bar'chu as for every *davar shebikdushah* (Rema, SA OC 56:1 — verified). Requires a minyan (Megillah 23b:6 — verified: "כל דבר שבקדושה לא יהא פחות מעשרה"; parallel Berakhot 21b, already cited in maariv-before.typ). [high] | Rise at the leader's call; recited regardless of count. ⚠ (minyan requirement set aside in Reform practice — a commentary-note question, not a glyph) [med] | ☐ Daniel: |
| LEADER | "Barchú et Adonai ham'vorách" (line 1) | Leader alone calls. [high] | Same. Aligned. [high] | ☐ Daniel: |
| BOW | leader at "Barchú"; congregation at "Barúch", straightening at the Name | Custom (not SA law): bow at Bar'chu and straighten at the Name (Kol Bo §7, cited in Ta'amei HaMinhagim 55:2 — verified). [med] | Bowing at Bar'chu is common Reform practice ("bend the knee and bow"). Aligned in substance. [med] | ☐ Daniel: |
| SUNG | "Baruch Adonai ham'vorách l'olám va'ed" (line 2) | Congregation's response; leader repeats. Matches the existing rubric (maariv-before.typ:5). [high] | Same, usually sung. [med] | ☐ Daniel: |
| SIT | after the response/repeat, before Ma'ariv Aravim | Sit for the blessings of the Sh'ma at ma'ariv (no standing requirement; cf. SA OC 63). [med] | Most Reform congregations also sit here — but some remain standing through the Sh'ma. ⚠ (depends on the Sh'ma decision below) [low] | ☐ Daniel: |

### Ma'ariv Aravim

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit or chatimah "Barúch atá Adonai, hama'arív aravím" | Leader recites; congregation seated, answering amen at the chatimah. [med] | Often sung together (many musical settings); seated. [med] | ☐ Daniel: |

### Ahavat Olam

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit or chatimah "ohév amó Yisra'él" | Leader recites; seated. [med] | Frequently sung together; seated. [med] | ☐ Daniel: |

### The Sh'ma (incl. V'ahavta & Tzitzit)

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE/SIT ⚠⚠ | "Sh'ma Yisra'el…" (maariv-shma.typ:16) | **Recite in whatever posture you are in — one who stands up specially is "called a sinner"** (SA OC 63:1–2 — verified; per Beit Hillel). So: traditional practice is *seated*. [high] | **Most Reform congregations rise for the Sh'ma** (classical Reform legacy; MT leaves it to custom), many remaining standing through the first verse or through V'ahavta. **This is the single sharpest divergence in the service.** [med] | ☐ Daniel: |
| cover eyes (glyph note, not one of the five) | first verse | Hands over the eyes for the first verse, said aloud (SA OC 61:4–5 — verified). [high] | Same custom widely kept. Aligned. [med] | ☐ Daniel: |
| SUNG | "Sh'ma Yisra'el… echad" | First verse aloud, all together (SA OC 61:4). [high] | Sung/declaimed by all. Aligned. [high] | ☐ Daniel: |
| quiet line (LEADER-inverse) | "Baruch shem k'vod…" — "(said softly)" already in draft | Said in an undertone (universal custom; the draft's rubric matches). [high] | Same, though some Reform congregations say it aloud. [med] | ☐ Daniel: |
| SIT | before or after V'ahavta | n/a traditionally (never rose). | If CRC stands for Sh'ma, where does it sit — after the first verse, or after V'ahavta? ⚠ CRC call with no traditional anchor. [low] | ☐ Daniel: |
| SUNG | "V'ahavtá…" | Individual recitation, seated. [high] | V'ahavta frequently chanted together (Torah trope — the draft already sets it in Ezra SIL with ta'amim). [med] | ☐ Daniel: |

### Emet v'Emunah (incl. Mi Chamocha)

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | "Mi chamócha ba'elím Adonai…" (maariv-after.typ:20) | The congregation joins the Song at the Sea lines; seated. [med] | Mi Chamocha is one of the great communal songs of the Reform Friday night; seated in most congregations, standing in a few. [med] | ☐ Daniel: |
| LEADER | "V'ne'emár: ki fadá…" chatimah "ga'ál Yisra'él" | Leader closes the blessing. [med] | Varies; often sung through by all. [low] | ☐ Daniel: |

### Hashkivenu

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit or "Ufrós aléinu sukát sh'lomécha" | Leader recites; seated. [med] | One of the most-sung units in Reform practice (many settings); seated. [med] | ☐ Daniel: |

### V'shamru

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | "V'shamrú v'nei Yisra'él…" | Sung together at ma'ariv; posture not codified — commonly seated, with the rise coming at Chatzi Kaddish. [low] | Sung together; some congregations rise here as the on-ramp to the Amidah. ⚠ (rise-point question — see divergence list) [low] | ☐ Daniel: |

### Chatzi Kaddish

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE ⚠ | "Yitgadál v'yitkadásh…" | Stand for Kaddish and every davar shebikdushah (Rema, SA OC 56:1 — verified); remain standing into the Amidah. [high] | Where included at all (MT includes it as an option; many congregations skip or sing it as a musical seam), standing is inconsistent. ⚠ [low] | ☐ Daniel: |
| LEADER | "Yitgadál…" | Leader alone; requires a minyan (Megillah 23b:6). [high] | Leader or cantor, often set musically. [med] | ☐ Daniel: |
| SUNG | "Y'hé sh'méh rabá m'varách…" (labeled "All" in draft) | The congregation's response — answered aloud, with focus, no interruption (SA OC 56:1 — verified). [high] | Same response, sung. Aligned. [med] | ☐ Daniel: |

---

## 3 · Amidah

### The Silent Amidah — opening ("We Open Our Lips")

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE | rubric "The silent Amidah — we rise…" / "Adonai, s'fatái tiftách" | Stand, feet together like the angels (SA OC 95:1 — verified), optionally three steps forward (Rokeach gloss there — verified); pray silently, lips moving, voice inaudible, from Hannah (Berakhot 31a:27 — verified; I Samuel 1:13). Stand start to finish. [high] | Rise together for the T'filah. Aligned on the rise itself. [high] | ☐ Daniel: |

### Avot v'Imahot

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| BOW | opening "Barúch atá Adonai" (amidah-silent.typ:14) **and** closing "Barúch atá Adonai, magén Avrahám v'ezrát Sará" | The four bows of the Amidah: Avot at beginning and end, Modim at beginning and end — and one who adds bows at other blessings is taught not to (SA OC 113:1 — verified). Knees at *Baruch*, bow at *atah*, straighten before the Name (MB 113:12 — verified). [high] | ⚠ In most Reform congregations Avot v'Imahot is **sung aloud together**, and the bows are individual choice, not cued. [med] | ☐ Daniel: |
| SUNG ⚠ | whole blessing | Silent, individual (Berakhot 31a). [high] | Commonly sung aloud by all through G'vurot (sometimes through K'dushat HaShem), then dropping into silence. ⚠ silent-vs-sung is a structural divergence. [med] | ☐ Daniel: |

### G'vurot

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG ⚠ | whole blessing | Silent, individual. No bow (SA OC 113:1 forbids adding bows). [high] | Often still sung aloud here. ⚠ [med] | ☐ Daniel: |

### K'dushat HaShem

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| — | "Atá kadósh…" | Silent, standing; short form when praying alone (the draft's commentary already says this). No cue. [high] | Often the point where communal singing stops and silence begins. ⚠ (glyph question: does a SIT or "silence" cue go here?) [low] | ☐ Daniel: |

### K'dushat HaYom · Avodah

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| — | — | Silent, standing, no posture cues (middle blessings take no bow, SA OC 113:1). [high] | Silent prayer; many Reform congregations *sit* for the silent portion. ⚠ standing-throughout vs sit-for-silence. [med] | ☐ Daniel: |

### Modim

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| BOW | opening "Modím anáchnu lach" **and** closing "Barúch atá Adonai, hatóv shimchá…" | Bows three and four of the Amidah (SA OC 113:1 — verified); at Modim, head and body bow together "like a reed" (MB 113:12 — verified). The draft's own commentary (amidah-silent.typ:89) already notes the slight bow. [high] | If praying silently, individual choice; not congregationally cued. ⚠ [med] | ☐ Daniel: |

### Shalom Rav

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | "Shalóm rav al Yisra'él…" | Silent, individual, no bow. [high] | Shalom Rav is very often sung together (Klepper/Freelander and others) — sometimes as the *re-gathering* point after silence. ⚠ [med] | ☐ Daniel: |

### Elohai N'tzor

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| — | "Elohái, n'tzór l'shoní…" | Private meditation (Berakhot 17a, cited in draft), still standing. [high] | Where used, read silently. [med] | ☐ Daniel: |
| BOW + steps — **TEXT GAP** | *Oseh Shalom — not printed in the silent Amidah draft* | The silent Amidah traditionally ends: bow, three steps back, head left at "oseh shalom bimromav," right at "hu ya'aseh shalom aleinu," bow forward "like a servant taking leave" (SA OC 123:1 — verified). **The current draft has no Oseh Shalom line in amidah-silent.typ — there is nothing to anchor the cue to.** [high for the practice; the gap is a content decision] | Reform practice generally drops the steps; Oseh Shalom appears instead as a sung setting (often after silence, or at Kaddish). ⚠ [med] | ☐ Daniel: (add Oseh Shalom line to silent Amidah, or deliberately omit?) |
| SIT | rubric "Here we may add our own words" / end of unit | Sit (or remain in place) when finished, each at their own pace. [med] | Sit individually as finished; leader waits. Aligned. [med] | ☐ Daniel: |

### Vayechulu

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE | rubric "We rise, and say together — as witnesses" / "Vay'chulú hashamáyim…" | Said aloud **and standing** (SA OC 271:10 and SA OC 268:7 — both verified), as communal testimony; whoever says Vayechulu on erev Shabbat becomes a partner in creation (Shabbat 119b:2–3 — verified). [high] | Where Vayechulu is done as a unit (as here), standing together is the norm. Aligned. [med] | ☐ Daniel: |
| SUNG | whole unit | Said by all together (testimony needs witnesses, plural). [high] | Sung or read in unison. Aligned. [med] | ☐ Daniel: |

### Me'ein Sheva (Magen Avot)

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| LEADER | opening "Barúch atá Adonai… konéi shamáyim va'áretz" | The chazan alone says the framing blessing; an individual does not say it (SA OC 268:8 — verified). Minyan-dependent. [high] | Almost never done in Reform services (the draft's commentary: "CRC has never had it — here it is, at last"), so there is **no settled Reform choreography to import.** ⚠ [low] | ☐ Daniel: |
| SUNG | "Magen avot bidvaro…" (middle paragraph) | Congregation says/sings Magen Avot together with the chazan (Rema, SA OC 268:8 — verified). [high] | Where sung, it's sung by all as a setting. [low] | ☐ Daniel: |
| RISE/SIT | unit start | Customarily still standing from Vayechulu through Magen Avot; sit-point varies by community. [low] | No precedent — CRC's call defines it. [low] | ☐ Daniel: |

---

## 4 · Concluding

### Mi Shebeirach — Healing

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | "Mi shebeirách avotéinu…" | **n/a** — the traditional Mi Shebeirach belongs to the Torah service, not Friday ma'ariv; no traditional Friday-night choreography exists for this unit. [high that it's n/a] | Debbie Friedman setting sung by all, seated; names offered aloud or silently (matches the draft rubric, concluding-body.typ:12). Some congregations invite those naming to stand. [med] | ☐ Daniel: |
| LEADER | rubric "We name… those in need of healing" | n/a | Leader opens the naming; community joins the song. [med] | ☐ Daniel: |

### Aleinu

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE | unit start, "Aléinu l'shabéach…" | Aleinu is said **standing** (Rema, SA OC 132:2 — verified: "עלינו לשבח, מעומד"). [high] | Congregation rises for Aleinu — among the most consistent Reform cues. Aligned. [high] | ☐ Daniel: |
| BOW | "Va'anáchnu kor'ím umishtachavím umodím" (concluding-body.typ:22, mid-stanza 1) | Bend and bow at these words — the Rema even directs a slight pause just before them (SA OC 132:2 — verified); the bow itself is universal custom enacting the words ("we bend, and bow"). [high] | Same — bow or dip at va'anachnu kor'im is standard Reform practice. Aligned. [med] | ☐ Daniel: |
| SUNG | stanza 1 and final line "bayóm hahú…" | Sung/said by all. [med] | First paragraph and V'ne'emar widely sung (standard melodies). Aligned. [med] | ☐ Daniel: |
| SIT | after "…ushmó echád" (or straight into Kaddish standing) | Traditionally remain standing — Mourner's Kaddish follows immediately (Rema, SA OC 132:2 mentions Kaddish Yatom after Aleinu — verified). [med] | Many Reform congregations also flow straight into Kaddish; whether anyone sits between is a CRC call. [low] | ☐ Daniel: |

### Mourner's Kaddish

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE ⚠⚠ | rubric "Mourners and those observing yahrzeit rise" | Two traditional layers: the **mourners** stand and recite; and per Ashkenazi ruling everyone stands for Kaddish as a davar shebikdushah (Rema, SA OC 56:1 — verified). Sephardi practice: those seated remain seated. So even "traditional" is split. [med] | Reform practice diverges again: very many congregations have the **entire community rise and recite together** (memory of those with no one to say Kaddish; the Six Million). The draft's current rubric (mourners rise, community responds) is the *more traditional* of the Reform options. ⚠⚠ CRC's single biggest choreography call. [med] | ☐ Daniel: |
| LEADER | "Yitgadál v'yitkadásh…" | Mourners recite; community responds. [high] | Depends on the rise decision above. [low] | ☐ Daniel: |
| SUNG | "Y'hé sh'méh rabá m'varách…" (labeled "Community") + each "Amén" | Communal responses, aloud (SA OC 56:1). [high] | Same. Aligned. [high] | ☐ Daniel: |
| BOW + steps | "Osé shalóm bimromáv…" (labeled "All rise in spirit with the mourners") | Mourners take three steps back with the left-right-forward bows, as at the Amidah's end (SA OC 123:1 by extension — verified for the Amidah; applied to Kaddish by universal custom). [med] | Rarely cued in Reform practice; the line is usually sung by all. ⚠ [low] | ☐ Daniel: |

### Birkat Kohanim — The Blessing

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| LEADER | rubric "The clergy may offer this ancient blessing" | **n/a** — there is no Birkat Kohanim slot in traditional Friday ma'ariv (it lives in the leader's Amidah repetition and, for Ashkenazim in the diaspora, festival musaf). This unit is a Reform-pattern benediction. [high that it's n/a] | Clergy benediction at the close of the service is a deep Reform pattern; congregation usually **standing** to receive it (often still standing from Kaddish). Posture is pure custom. [med] | ☐ Daniel: |
| RISE | unit start (if not already standing) | n/a | Standing to receive a blessing is the common instinct; could not determine a dominant practice — genuinely congregation-by-congregation. [low] | ☐ Daniel: |

### Adon Olam

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| SUNG | whole unit | Closing hymn "to countless melodies"; no codified posture — communities both sit and stand. [low] | Sung by all; posture varies (often standing simply because the congregation never sat after Kaddish). Could not determine a dominant practice. [low] | ☐ Daniel: |

---

## Back matter · Seasonal Insertions & Kiddush

### Seasonal insertions (Ya'aleh V'yavo · Al HaNisim · B'imei Mordechai · Ten Days lines · l'eila l'eila)

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| (inherits host) | each ✦ mark in the Amidah / Kaddish | Every insertion is said inside its host unit and **inherits the host's choreography** (standing in the Amidah; Kaddish posture for l'eila l'eila). No independent cues. [high] | Same logic. Aligned. [high] | ☐ Daniel: (confirm no glyphs on back-matter pages) |

### Counting the Omer

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE | blessing "…al s'firat ha'ómer" + the count | One blesses and counts **standing** (SA OC 489:1 — verified: "צריך לספור מעומד"). [high] | Where counted publicly, standing is generally kept. Aligned. [med] | ☐ Daniel: |
| LEADER + SUNG | leader blesses/counts; community repeats | It is a mitzvah for **each person** to count (SA OC 489:1 — verified), so leader-then-all is the norm. [high] | Leader counts, community echoes. Aligned. [med] | ☐ Daniel: |

### Kiddush (and Festival Kiddush on Shabbat)

| Cue | Anchor | Traditional | Reform | CRC |
|---|---|---|---|---|
| RISE ⚠ | "Vay'chulú hashamáyim…" (kiddush.typ:14) | Karo: say Vayechulu **standing**, then the wine blessing (SA OC 271:10 — verified). Rema there: the custom is to **sit** for Kiddush (rising slightly at the very start), looking at the candles. Even the classical sources split. [high] | Synagogue Kiddush in Reform practice is almost always **standing throughout**, sung together. ⚠ (sit-for-kiddush vs stand-throughout) [med] | ☐ Daniel: |
| LEADER | rubric "We raise the cup of wine and bless" | One person holds the cup and blesses for all (remember Shabbat over wine — Pesachim 106a, cited in draft commentary). [high] | Clergy or honoree raises the cup; congregation sings along. [med] | ☐ Daniel: |
| SUNG | "Barúch atá… boréi p'rí hagáfen" through the chatimah "m'kadésh haShabbát" | Listeners fulfill through the one blessing, answering amen. [high] | Whole Kiddush commonly sung by everyone. ⚠ (one voice + amen vs all voices) [med] | ☐ Daniel: |

---

## Divergences requiring Daniel's call

Ordered roughly by how much they shape the page:

1. **Sh'ma posture** ⚠⚠ — Traditional: seated (SA OC 63:1–2: standing up specially is "called a sinner"). Reform: most congregations rise. The book must print RISE, nothing, or SIT-stays — this decides the whole unit's glyphs. `[divergence: high-confidence on both sides]`
2. **Mourner's Kaddish — who rises** ⚠⚠ — mourners-only (current draft rubric; classic Ashkenazi: all stand anyway per Rema OC 56:1; Sephardi: seated stay seated) vs whole-congregation rise-and-recite (widespread Reform). The rubric at concluding-body.typ:38 already takes a position; confirm it's CRC's.
3. **Amidah texture** ⚠ — traditional fully silent standing (four bows, SA OC 113:1) vs Reform sung-aloud opening blessings, sit-or-stand silent middle, sung Shalom Rav re-gathering. Decides where SUNG glyphs go across nine sub-units, and whether BOW glyphs are printed at Avot/Modim at all.
4. **Oseh Shalom / end of silent Amidah — text gap** — SA OC 123:1's steps-and-bows have no anchor because Oseh Shalom is not printed in amidah-silent.typ. Add the line (with or without a glyph) or deliberately omit. *(Ruled 2026-07-05: deliberately omitted. SUPERSEDED 2026-07-06, Daniel voice memo: Oseh Shalom now prints at the close of Elohai N'tzor in amidah-silent.typ — the anchor exists; whether a closing-steps mark joins it is OPEN, see RITUAL-MARKS.md.)*
5. **Chatzi Kaddish standing** ⚠ — traditional stand (Rema OC 56:1) vs inconsistent Reform practice. Also determines whether the congregation is already on its feet when the Amidah begins.
6. **Where does the congregation rise before the Amidah** — at V'shamru, at Chatzi Kaddish, or at "Adonai s'fatai"? Low confidence everywhere; pure CRC call.
7. **Kiddush posture** ⚠ — Karo stand-for-Vayechulu / Rema sit vs Reform stand-throughout-and-sing.
8. **Candle blessing voice** ⚠ — one person blesses (Rema OC 263:5 choreography of light-cover-bless) vs communal singing of the blessing.
9. **Sit-point after L'cha Dodi** — traditional custom sits around Psalm 92's opening; needs one deliberate SIT glyph somewhere in Ps 92/93.
10. **Me'ein Sheva** — no Reform precedent exists and CRC has never done it; its choreography (leader frame, sung Magen Avot, stand/sit) will be invented here. Flag for extra care in R2/R4 copy.
11. **Bar'chu minyan note** — Berakhot 21b / Megillah 23b:6 requires ten; Reform recites regardless. Not a glyph — a candidate commentary footnote.
12. **Priestly Blessing & Adon Olam posture** — could not determine dominant practice anywhere; genuinely CRC-defined.
13. **All SUNG cues** — every SUNG row in this file is congregation-dependent and awaits Daniel's setlist reality, independent of what other communities do.

## Units where practice could not be determined

- **Shalom Aleichem, Adon Olam, Birkat Kohanim** — posture varies too widely for a defensible default; all rows low-confidence, CRC-defined.
- **Me'ein Sheva** — traditional choreography verified (SA OC 268:8), but no Reform practice exists to compare against.
- **Mi Shebeirach (Friedman)** — no traditional Friday-night analogue at all; Reform column only.
- **Psalms 95–99 & 29** — no codified traditional cues (seated throughout is inference from AhS 242:40's framing, not an explicit ruling).

*All Sefaria references above were retrieved and read on 2026-07-05 via the Sefaria MCP; none are cited from memory alone.*
