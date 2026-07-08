# Convergence Map — Gold Lines for Every Unit

*Prepared 2026-07-05 · Phase 1, R3 (see `03_MARGIN_SYSTEM_PLAN.md`). Status: **DRAFT — awaiting Daniel's rule decision**.*

*Sources: `01_STYLE_GUIDE.md` (convergence-line spec), `design-lab/margin-lab.typ` (`#chatimah()` treatment), `build/typst/shirei-shabbat-FULL.typ` + all `build/typst/content/*.typ` (current content, read 2026-07-05), and `proofs/Shirei-Shabbat-FULL-DRAFT.pdf` (58 PDF pages / 46 printed pages, rendered 2026-07-05 10:44 CDT, read-only, via `pdftotext`/`pdfinfo` — no proofs files modified). Note the `#chatimah()` helper exists only in `design-lab/margin-lab.typ` today; none of the `build/typst/content/*.typ` files call it yet — this map is what Phase 3 will mark up.*

*Page references below use two numbers: **PDF p.NN** (the raw page index from the draft PDF, 1–58, matching what a page-render/pdftotext tool addresses) and **(printed p.NN)** (the number stamped at the page foot; printed page = PDF page − 2, since the cover and welcome/how-to-use spread are unnumbered front matter).*

---

## 1 · The rule for non-blessing units — three options for Daniel

Every unit with a true b'rachah has an unambiguous gold line: the chatimah, the "Baruch atah Adonai…" closing formula. Psalms, piyyutim, and songs (Yedid Nefesh, Shalom Aleichem, all nine psalms, Ana B'koach's body, L'cha Dodi, Adon Olam, Vayechulu, Birkat Kohanim, Mourner's Kaddish, etc.) have no such formula. Three candidate rules, applied consistently:

### Option (a) — Final verse
The gold line is simply the last verse/stanza of the unit as printed, whatever it is.
- **Pros:** Zero editorial judgment — mechanical, unambiguous, survives any future reordering of verses. Matches "the point where everyone re-gathers before turning the page" literally: the last thing on the page *is* the convergence point by definition.
- **Cons:** For long psalms the final verse is often a minor, non-memorable line (e.g., Psalm 92 ends on "to declare that You are upright, my Rock" — true, but not what anyone is actually singing together). Doesn't track *communal* re-gathering if the room doesn't actually reach the last verse in unison (long psalms are sometimes read responsively or trimmed live).

### Option (b) — Best-known refrain / last sung refrain
The gold line is the line the room actually converges on musically — e.g., L'cha Dodi's "L'cha dodi likrat kalá" refrain (sung between every stanza, and again at the very end), Shalom Aleichem's "Shalom aleichem" refrain, Ana B'koach's "Baruch shem k'vod malchuto" (which doubles as both refrain and closing line here).
- **Pros:** Matches lived congregational practice — the line everyone actually knows and sings, which is the real re-gathering point after any verse gets skipped or mumbled through. More useful as a *turn cue* since it's visually and aurally distinct from the surrounding verses (rubric already marks it "(refrain)" in several units).
- **Cons:** Requires a judgment call per unit — "best-known" is a CRC-practice question, not a text-structural one, so this map can only flag candidates, not settle them (parallel to the CRC-practice column in R1). Some units have no refrain at all (Psalms 92, 93, 97, 98, 99, 29 are through-composed with no repeated line), so the rule doesn't cover every non-blessing unit and would need to fall back to (a) or (c) for those anyway — meaning CRC would be running two rules, not one.

### Option (c) — No gold line on psalm/song units at all (semantic purity)
Gold appears *only* where a true chatimah exists. Psalms and songs get no gold line; the page-turn cue for those units is carried by other wayfinding elements (rail, accordion) alone.
- **Pros:** Keeps the gold line meaning exactly one thing everywhere it appears — "a blessing has just closed" — which is easier to teach in the front matter ("gold means a b'rachah just ended") and never misleads a reader into thinking a psalm's last line carries the same liturgical weight as a chatimah. Zero judgment calls; nothing to get wrong.
- **Cons:** Loses the gold line as a *universal* turn cue — for roughly half the book's units (17 of 31 have no chatimah) there is no gold signal telling the room "gather here, then turn." The margin system's own logic (R3 brief: "the gold line is also the turn cue") is weakened for exactly the units where pages are densest and hardest to navigate (the nine-psalm run in Kabbalat Shabbat).

### Recommendation

**Option (a), with a manual override list for the handful of units where the final verse is genuinely not what the room converges on.** Reasoning: (a) is the only rule that covers all 31 units without exception and requires no CRC-practice judgment to *apply* — it can be typeset today. Where it produces an obviously wrong turn cue, that's a short, explicit list (see flags below — mainly the strophic/refrain pieces: L'cha Dodi, Shalom Aleichem, Ana B'koach), and Daniel can promote those to their refrain (effectively borrowing (b) for a named exception, not a parallel universal rule). This preserves (c)'s instinct — don't dilute what "gold" means — by keeping the *chatimah* gold visually identical to the *final-verse* gold (same treatment, same color) while the caption/front-matter text can note "gold also marks where a song ends, so we can gather before turning." If Daniel prefers semantic purity instead, this map is built so (c) is a one-line decision: strike every row flagged "rule-a" from the typeset and leave those units without a gold line.

---

## 2 · Unit-by-unit inventory

Legend: **Type** = `chatimah` (true closing b'rachah, high confidence) · `rule-a` (final verse/stanza as printed) · `rule-b` (best-known/last-sung refrain — flagged as an alternate candidate, not the default) · **Page-end?** = does the candidate line fall at the end of a printed page in `Shirei-Shabbat-FULL-DRAFT.pdf` (i.e., is it the last content before a page turn) — Y / N / mid-page(continues) · **Confidence** = high/medium/low.

### Section 1 — Kabbalat Shabbat (no chatimot; every unit needs a rule)

**REMOVED — Daniel, 2026-07-06:** all 13 Kabbalat Shabbat gold lines are struck (Yedid Nefesh,
Lighting the Candles, Shalom Aleichem, Psalms 95/96/97/98/99/29, Ana B'koach, the L'cha Dodi
refrain override, Psalms 92/93). Each line's text remains in the book, rendered as a regular
stanza — only the gold treatment is removed. Gold now first appears at Ma'ariv Aravim's chatimah,
at the top of the Sh'ma & Its Blessings section (`content/maariv-before.typ`). The table below is
retained for the record only.

| Unit | Candidate line (translit → Hebrew opening) | Type | Page-end? | Confidence |
|---|---|---|---|---|
| Yedid Nefesh | rule-a: *"Higalé na uf'ros, chavívi..."* (v.4, trans. "Reveal Yourself, my Beloved...") → הִגָּלֶה נָּא וּפְרוֹס | rule-a | **N** — ends mid PDF p.4/p.5 (printed p.2/3); Lighting the Candles begins same page (p.5/printed p.3) | medium — final stanza is strong and thematically final ("the time has come"), a reasonable rule-a pick |
| Lighting the Candles | chatimah: *"Barúch atá Adonai Elohéinu mélech ha'olám, asher kid'shánu... l'hadlik ner shel Shabbat"* → בָּרוּךְ אַתָּה יְיָ אֱלֹהֵינוּ מֶלֶךְ הָעוֹלָם | **chatimah** | N — ends mid PDF p.5 (printed p.3); Shalom Aleichem begins same page | high |
| Shalom Aleichem | rule-a: *"Tzet'chém l'shalom..."* (as sung, repeating refrain) → צֵאתְכֶם לְשָׁלוֹם ★ rule-b alt: the four-line "As we often sing it" refrain block itself → שָׁלוֹם עֲלֵיכֶם ... | rule-a (rule-b flagged) | **Y** — refrain block ends at bottom of PDF p.6 (printed p.4), Psalm 95 starts new unit same page | medium — rule-a's literal final line is one verse of a 4-line rotating refrain; rule-b (the "as we often sing it" composite line already set apart in the text) is arguably the truer convergence point |
| Psalm 95 | rule-a: *"Asher nishbá'ti v'apí, im y'vo'ún el m'nuchatí"* (trans. "...they would not come into My rest") → אֲשֶׁר־נִשְׁבַּעְתִּי בְאַפִּי | rule-a | **Y** — ends at bottom of PDF p.7 (printed p.5) | medium — final verse is a hard, unresolved line (Meribah/Massah); thematically abrupt but is genuinely the last verse |
| Psalm 96 | rule-a: *"Lifnei Adonai ki va, ki va lishpót ha'áretz..."* (trans. "...judging the world with justice and the peoples in faithfulness") → לִפְנֵי יְיָ כִּי בָא | rule-a | N — ends mid PDF p.9 (printed p.7); Psalm 97 begins same page | medium |
| Psalm 97 | rule-a: *"Simchú tzadikím b'Adonai, v'hodú l'zécher kodshó"* (trans. "Rejoice in the One, you righteous...") → שִׂמְחוּ צַדִּיקִים בַּיְיָ | rule-a | **Y** — ends bottom of PDF p.10 (printed p.8) | high — strong, quotable closing line, good candidate even under rule-b intuition |
| Psalm 98 | rule-a: *"...yishpót tevél b'tzédek, v'amím b'meisharím"* (trans. "...judge the world with justice and the peoples with fairness") → יִשְׁפֹּט תֵּבֵל בְּצֶדֶק | rule-a | N — ends mid PDF p.11 (printed p.9); Psalm 99 begins same page | medium |
| Psalm 99 | rule-a: *"Rom'mú Adonai Elohéinu, v'hishtachavú l'har kodshó — ki kadósh Adonai Elohéinu"* → רוֹמְמוּ יְיָ אֱלֹהֵינוּ | rule-a | N — ends mid PDF p.13 (printed p.11); Psalm 29 begins same page | medium |
| Psalm 29 | rule-a: *"Adonai y'varéch et amó vashalóm"* (trans. "...bless this people with peace") → יְיָ יְבָרֵךְ אֶת עַמּוֹ בַשָּׁלוֹם | rule-a | **Y** — ends bottom of PDF p.14 (printed p.12) | high — closes on *shalom*, a strong, singable, memorable final word; good under any rule |
| Ana B'koach | rule-a **and** rule-b coincide: *"Baruch shem k'vod malchuto l'olam va'ed"* → בָּרוּךְ שֵׁם כְּבוֹד מַלְכוּתוֹ לְעוֹלָם וָעֶד | rule-a/rule-b (same line) | **Y** — ends bottom of PDF p.15 (printed p.13) | high — this line is explicitly marked as its own rubric/refrain in the content file and is the literal final line; rule-a and rule-b agree, making this one of the strongest non-chatimah candidates in the book |
| L'cha Dodi | rule-a: *"Bó'i v'shalóm..." final line "bó'i chalá... Shabbat malk'tá"* → בּוֹאִי כַלָּה שַׁבָּת מַלְכְּתָא ★ rule-b alt: the *L'cha dodi* refrain itself → לְכָה דוֹדִי לִקְרַאת כַּלָּה | rule-a (rule-b strongly flagged) | mid-page(continues) — final stanza ends mid PDF p.18 (printed p.16); Psalm 92 begins same page | rule-a: medium; rule-b: **high** — L'cha Dodi is the single strongest case for overriding rule-a: the refrain (sung after every stanza, and the piece's namesake) is unambiguously what the room converges on, not the final "bo'i chala" stanza, which many congregations sing as a special flourish rather than the re-gathering point. **Flagged for Daniel's override list under the recommended rule.** |
| Psalm 92 | rule-a: *"...to declare that You are upright, my Rock, in whom there is no wrong"* → לְהַגִּיד כִּי־יָשָׁר יְיָ צוּרִי | rule-a | **Y** — ends bottom of PDF p.20 (printed p.18) | high |
| Psalm 93 | rule-a: *"...holiness graces Your house for all the length of days"* → נַאֲוָה־קֹדֶשׁ יְיָ לְאֹרֶךְ יָמִים | rule-a | **Y** — ends bottom of PDF p.20 (printed p.18), same page as Psalm 92's end (both psalms share the page); section closes here, Sh'ma & Its Blessings opener begins PDF p.21 | high |

### Section 2 — Sh'ma & Its Blessings (six chatimot; three non-blessing units)

| Unit | Candidate line (translit → Hebrew opening) | Type | Page-end? | Confidence |
|---|---|---|---|---|
| Bar'chu | *(no chatimah — call-and-response, not a b'rachah)* rule-a: *"Baruch Adonai ham'vorách l'olám va'ed"* → בָּרוּךְ יְיָ הַמְבֹרָךְ לְעוֹלָם וָעֶד | rule-a | N — ends mid PDF p.22 (printed p.20); Ma'ariv Aravim begins same page | medium — this is the community's response line, already functioning as the room's convergence point liturgically, so rule-a happens to land well here |
| Ma'ariv Aravim | chatimah: *"El chai v'kayám tamíd yimlóch aléinu l'olám va'ed. Barúch atá Adonai, hama'arív aravím"* → אֵל חַי וְקַיָּם תָּמִיד ... בָּרוּךְ אַתָּה יְיָ הַמַּעֲרִיב עֲרָבִים | **chatimah** | **Y** — ends bottom of PDF p.22 (printed p.20) | high |
| Ahavat Olam | chatimah: *"V'ahavatchá al tasír miménu l'olamím. Barúch atá Adonai, ohév amó Yisra'él"* → וְאַהֲבָתְךָ אַל תָּסִיר מִמֶּנּוּ ... בָּרוּךְ אַתָּה יְיָ אוֹהֵב עַמּוֹ יִשְׂרָאֵל | **chatimah** | **Y** — ends bottom of PDF p.23 (printed p.21) | high |
| The Sh'ma | *(no chatimah — biblical text, not a b'rachah; V'ahavta/Tzitzit is treated as part of this unit in the content files)* rule-a: *"...Aní Adonai Eloheichém"* (final words of the third paragraph) → אֲנִי יְיָ אֱלֹהֵיכֶם | rule-a | **Y** — ends bottom of PDF p.25 (printed p.23) | medium — "Ani Adonai Eloheichem," repeated twice, is a strong, deliberate textual close (see commentary note on the Exodus ending); reasonable rule-a pick even though it isn't a chatimah |
| Emet v'Emunah / Mi Chamocha | chatimah: *"V'ne'emár: ki fadá Adonai et Ya'akóv, ug'aló miyád chazák miménu. Barúch atá Adonai, ga'ál Yisra'él"* → כִּי־פָדָה יְיָ אֶת יַעֲקֹב ... בָּרוּךְ אַתָּה יְיָ גָּאַל יִשְׂרָאֵל | **chatimah** | **Y** — ends bottom of PDF p.27 (printed p.25) | high — note: content file merges Emet v'Emunah and Mi Chamocha into one `#startprayer` unit (no separate heading for Mi Chamocha), consistent with the section-opener's unit list, which lists them together as "Emet v'Emunah" / "Mi Chamocha" as two names for one flow |
| Hashkivenu | chatimah: *"Ushmór tzeteinu uvo'éinu... Barúch atá Adonai, haporés sukát shalóm aléinu v'al kol amó Yisra'él v'al Yerushaláyim"* → וּשְׁמוֹר צֵאתֵנוּ ... בָּרוּךְ אַתָּה יְיָ הַפּוֹרֵשׂ סֻכַּת שָׁלוֹם | **chatimah** | **Y** — ends bottom of PDF p.28 (printed p.26) | high — this is also the exact line used in `design-lab/margin-lab.typ`'s worked chatimah example |
| V'shamru | *(no chatimah — biblical text, Exodus 31:16–17)* rule-a: *"...uvayóm hashvi'í shavát vayinafásh"* (trans. "...on the seventh day rested and drew breath") → וּבַיּוֹם הַשְּׁבִיעִי שָׁבַת וַיִּנָּפַשׁ | rule-a | **Y** — ends bottom of PDF p.28 (printed p.26), same page as Hashkivenu's chatimah above (both units share the page) | high — the two-verse unit is short enough that its only real "final verse" is also its most well-known line (*vayinafash*, glossed in the footnote); rule-a and the intuitive pick coincide |
| Chatzi Kaddish | *(no chatimah — Aramaic doxology, not a b'rachah)* rule-a: *"...v'imrú: Amén"* (final words, trans. "...say: Amen") → וְאִמְרוּ אָמֵן | rule-a | **Y** — ends bottom of PDF p.29 (printed p.27); Amidah section opener begins PDF p.30 | high — "v'imru amen" is the traditional congregational response point, so rule-a lands on the natural convergence line here too |

### Section 3 — Amidah (the Silent Amidah has 7 internal b'rachot / 2 more chatimot follow)

The Silent Amidah is one printed unit (per the section-opener's unit list and the content file `amidah-silent.typ`) but contains **seven blessings**, six of which close with a chatimah, plus a non-blessing opening verse and a non-blessing closing meditation. Per the task brief: **the unit-level gold line is the LAST chatimah** (Shalom Rav's), and the six interior chatimot are listed separately below as candidates for Daniel to decide whether they should also be gold.

**Unit-level gold line (recommended): Shalom Rav's chatimah — see interior candidate #6 below.**

| Interior candidate (within The Silent Amidah) | Candidate line (translit → Hebrew opening) | Type | Page-end? | Confidence |
|---|---|---|---|---|
| Opening — We Open Our Lips | *(no chatimah — single verse, Psalm 51:17)* not a candidate; too short to need one | — | — | n/a |
| 1. Avot v'Imahot | chatimah: *"Mélech ozér umoshí'a umagén. Barúch atá Adonai, magén Avrahám v'ezrát Sará"* → מֶלֶךְ עוֹזֵר וּמוֹשִׁיעַ וּמָגֵן ... בָּרוּךְ אַתָּה יְיָ מָגֵן אַבְרָהָם וְעֶזְרַת שָׂרָה | **chatimah** (interior) | N — ends mid PDF p.32 (printed p.30); G'vurot begins same page | high |
| 2. G'vurot | chatimah: *"V'ne'emán atá l'hachayót hakól. Barúch atá Adonai, m'chayéh hakól/meitím"* → וְנֶאֱמָן אַתָּה לְהַחֲיוֹת הַכֹּל ... בָּרוּךְ אַתָּה יְיָ מְחַיֵּה הַכֹּל/מֵתִים | **chatimah** (interior) | **Y** — ends bottom of PDF p.32 (printed p.30) | high |
| 3. K'dushat HaShem | chatimah: *"Atá kadósh v'shimchá kadósh... Barúch atá Adonai, ha'El hakadósh"* → אַתָּה קָדוֹשׁ וְשִׁמְךָ קָדוֹשׁ ... בָּרוּךְ אַתָּה יְיָ הָאֵל הַקָּדוֹשׁ | **chatimah** (interior) | N — ends mid PDF p.33 (printed p.31); K'dushat HaYom begins same page | high — this whole blessing is only three sentences; chatimah is almost the entire unit |
| 4. K'dushat HaYom | chatimah: *"...v'yanúchu va Yisra'él m'kad'shéi sh'mécha. Barúch atá Adonai, m'kadésh haShabát"* → וְיָנוּחוּ בָהּ יִשְׂרָאֵל מְקַדְּשֵׁי שְׁמֶךָ ... בָּרוּךְ אַתָּה יְיָ מְקַדֵּשׁ הַשַּׁבָּת | **chatimah** (interior) | **Y** — ends bottom of PDF p.34 (printed p.32) | high |
| 5. Avodah (R'tzeh) | chatimah: *"V'techezéna einéinu b'shuvchá l'Tziyón b'rachamím. Barúch atá Adonai, hamachazír sh'chinató l'Tziyón"* → וְתֶחֱזֶינָה עֵינֵינוּ ... בָּרוּךְ אַתָּה יְיָ הַמַּחֲזִיר שְׁכִינָתוֹ לְצִיּוֹן | **chatimah** (interior) | **Y** — ends bottom of PDF p.35 (printed p.33) | high |
| 6. Modim | chatimah: *"V'al kulám yitbaréch... Barúch atá Adonai, hatóv shimchá ulchá na'éh l'hodót"* → וְעַל כֻּלָּם יִתְבָּרַךְ ... בָּרוּךְ אַתָּה יְיָ הַטּוֹב שִׁמְךָ וּלְךָ נָאֶה לְהוֹדוֹת | **chatimah** (interior) | N — ends mid PDF p.37 (printed p.35); Shalom Rav begins same page | high |
| 7. Shalom Rav (Birkat Shalom) — **UNIT-LEVEL GOLD LINE** | chatimah: *"Barúch atá Adonai, hamvaréch et amó Yisra'él bashalóm"* → בָּרוּךְ אַתָּה יְיָ הַמְבָרֵךְ אֶת עַמּוֹ יִשְׂרָאֵל בַּשָּׁלוֹם | **chatimah** (unit-level) | **Y** — ends bottom of PDF p.37 (printed p.35) | high |
| Closing — Elohai N'tzor | *(no chatimah — private meditation, Berakhot 17a / Psalm 19:15)* rule-a: *"Yihyú l'ratzón imréi fi v'hegyón libí l'fanécha, Adonai tzurí v'go'alí"* → יִהְיוּ לְרָצוֹן אִמְרֵי פִי | rule-a (not unit-level; see note) | mid-page(continues) — ends mid PDF p.38 (printed p.36); Vayechulu begins same page | high as a rule-a pick — this closing verse is traditional and universally recognized, but it sits *after* the unit-level gold line (Shalom Rav's chatimah) within the same printed "Silent Amidah" unit. **Flag for Daniel:** if the gold line must be the visually *last* gold in the unit, this creates a conflict — either Elohai N'tzor gets no gold (favoring "chatimah only" logic) or it becomes a second, later gold line in the same unit, which would contradict "one gold line per unit." Recommend: no gold on Elohai N'tzor; Shalom Rav's chatimah remains the unit's single gold line even though it isn't the visually final text. |

| Unit (Amidah, continued) | Candidate line (translit → Hebrew opening) | Type | Page-end? | Confidence |
|---|---|---|---|---|
| Vayechulu | *(no chatimah — biblical text, Genesis 2:1–3, recited standing "as witnesses")* rule-a: *"...ki vo shavát mikol m'lachtó asher bará Elohím la'asót"* (the whole three-verse passage is short; final words trans. "...for on it God rested from all the work of creation") → כִּי בוֹ שָׁבַת מִכָּל מְלַאכְתּוֹ | rule-a | **Y** — ends bottom of PDF p.39 (printed p.37) | high — the passage is only three verses; the final clause is also its thematic climax, so rule-a is uncontroversial here |
| Me'ein Sheva | chatimah: *"...v'yanúchu vah Yisrael m'kad'shei sh'mécha. Barúch atá Adonai m'kadesh haShabbat"* → וְיָנוּחוּ בָהּ יִשְׂרָאֵל מְקַדְּשֵׁי שְׁמֶךָ ... בָּרוּךְ אַתָּה יְיָ מְקַדֵּשׁ הַשַּׁבָּת | **chatimah** | N — ends mid PDF p.41 (printed p.39); rest of p.41/PDF is blank/footnote only, Concluding section opener begins PDF p.42 | high — note this chatimah's wording is nearly identical to K'dushat HaYom's (both "m'kadesh haShabbat"), since Me'ein Sheva folds the whole Amidah into one blessing; not a duplication error, just the liturgy's own design |

### Section 4 — Concluding (one chatimah-bearing unit; four non-blessing units)

| Unit | Candidate line (translit → Hebrew opening) | Type | Page-end? | Confidence |
|---|---|---|---|---|
| Mi Shebeirach — Healing | *(no chatimah — modern composite blessing, Friedman/Setel 1988, not in classical b'rachah form)* rule-a: *"...v'imrú: Amen"* (trans. "...let us say together: Amen") → וְנֹאמַר אָמֵן *(English-only close; no separate Hebrew line printed for this final phrase — see content file, `engn` block ends in English "And let us say together: Amen")* | rule-a | **Y** — ends bottom of PDF p.43 (printed p.41) | medium — unlike other units, this piece's translation-only close means there is no separate Hebrew "candidate line" to set in gold alongside the transliteration; flag for Daniel: either gold the shared English/Hebrew "Amen" convergence point loosely, or treat this unit under option (c) if adopted |
| Aleinu | *(no chatimah — coronation prayer, not a b'rachah)* rule-a: *"V'ne'emár: v'hayá Adonai l'mélech al kol ha'áretz, bayóm hahú yihyé Adonai echád ushmó echád"* → וְהָיָה יְיָ לְמֶלֶךְ עַל כָּל הָאָרֶץ | rule-a | **Y** — ends bottom of PDF p.45 (printed p.43) | high — closing verse ("Adonai will be one and God's name one") is a strong, well-known liturgical climax; good rule-a pick |
| Mourner's Kaddish | *(no chatimah — Aramaic doxology; note this Kaddish is textually almost identical to the Chatzi Kaddish above but with two additional closing lines)* rule-a: *"...v'al kol yosh'véi tevél, v'imrú: Amén"* (trans. "...and for all who dwell on earth — and say: Amen") → וְעַל כָּל יוֹשְׁבֵי תֵבֵל וְאִמְרוּ אָמֵן | rule-a | **Y** — ends bottom of PDF p.46 (printed p.44) | high — final line, expanded by this siddur to include "kol yosh'vei tevel," is both the literal final line and the community's spoken response, so rule-a and intuition coincide |
| Priestly Blessing (Birkat Kohanim) | *(no chatimah — biblical blessing formula, Numbers 6:24–26, spoken over the congregation, not a b'rachah recited by it)* rule-a: *"Yisá Adonai panáv eilécha v'yasém l'chá shalóm"* (trans. "...grant you peace") → יִשָּׂא יְיָ פָּנָיו אֵלֶיךָ וְיָשֵׂם לְךָ שָׁלוֹם | rule-a | **Y** — ends bottom of PDF p.47 (printed p.45) | high — closes on *shalom*, the traditional and expected final word of the three-line blessing; uncontroversial |
| Adon Olam | *(no chatimah — medieval hymn)* rule-a: *"B'yadó afkíd ruchí... V'im ruchí g'viyatí, Adonai li v'lo irá"* (trans. "...the Eternal is with me, I will not fear") → בְּיָדוֹ אַפְקִיד רוּחִי ... וְעִם רוּחִי גְּוִיָּתִי | rule-a | **Y** — ends bottom of PDF p.48 (printed p.46); this is the final page of the numbered service (Seasonal Insertions & Kiddush back matter follows, outside the ~31 core units) | high — closing line is the hymn's most famous couplet (said at bedtime and at death), a strong rule-a pick that also matches intuitive "best known line" logic |

---

## 3 · Summary counts

- **Total units inventoried:** 31 (per the four section-opener unit lists in `shirei-shabbat-FULL.typ`), plus 6 interior chatimot inside the Silent Amidah listed separately as Daniel-decision candidates (7 blessings total in that unit, 6 with a chatimah, 1 — Avot v'Imahot through Modim minus the opening/closing meditations — already counted individually above).
- **True chatimah (high confidence):** 13 total — 6 stand-alone unit-level chatimot (Lighting the Candles, Ma'ariv Aravim, Ahavat Olam, Emet v'Emunah/Mi Chamocha, Hashkivenu, Me'ein Sheva) + 1 unit-level chatimah selected as the "last of seven" for the Silent Amidah (Shalom Rav) + 6 further interior chatimot inside the Silent Amidah offered as optional additional gold (Avot v'Imahot, G'vurot, K'dushat HaShem, K'dushat HaYom, Avodah, Modim).
- **Rule-based picks (rule-a, final verse):** 18 non-blessing units, all defaulted to option (a) in this draft.
- **Flagged for likely override to rule-b (refrain) even under the recommended rule:** L'cha Dodi (high-confidence override candidate), Shalom Aleichem (medium), Ana B'koach (rule-a and rule-b already coincide, no conflict).
- **Candidates that do NOT fall at a page end** (gold line would sit mid-page, so it can't double as a turn cue there — flagged above with **N**): Yedid Nefesh, Shalom Aleichem's literal final refrain line (though the composite refrain block does end the page), Psalm 96, Psalm 98, Psalm 99, Bar'chu, Avot v'Imahot (interior), K'dushat HaShem (interior), Modim (interior), Me'ein Sheva. In every one of these cases the unit's content simply continues onto the same page as the next unit's opening (no blank space, no wasted page) — this is normal, not a defect, but it means the gold line there is a *pause* cue rather than a *turn* cue, and the front-matter explanation should say so rather than promise every gold line precedes a page turn.

---

## 4 · Open items for Daniel

**ALL RESOLVED — Daniel, 2026-07-05 (gate-4 walkthrough; see DECISIONS-LOG.md):** items 1–4 were
settled in the earlier walkthrough (rule-a final verse; L'cha Dodi refrain override; interior
chatimot stay regular, Shalom Rav only; no second gold after Shalom Rav). Item 5 (Mi Shebeirach):
**NO gold line** — the flexible slot converges in the rabbi's live voice. Additionally ruled:
**Vayechulu** — split the cantillated block, gild the final clause only via in-place gold styling
(not `#chatimah`, which drops cantillation); **Seasonal Insertions** — the Festival Kiddush seal
(*m'kadésh haShabbát v'Yisra'él v'hazmaním*) is the unit's single gold line.

**SUPERSEDED IN PART — Daniel, 2026-07-06:** all Section 1 (Kabbalat Shabbat) gold lines removed —
all 13 units, text retained as regular stanzas. See the note above the Section 1 table. The book's
gold treatment now begins at Ma'ariv Aravim (Sh'ma & Its Blessings).

1. **Pick the rule:** (a) final verse [recommended], (b) refrain, or (c) chatimah-only/no psalm gold.
2. **L'cha Dodi override:** even under rule (a), recommend promoting the *L'cha dodi* refrain to gold instead of the final "bo'i chala" stanza — confirm.
3. **Silent Amidah interior chatimot:** confirm whether any/all of the six interior chatimot (Avot v'Imahot through Modim) should also render gold, or whether gold should appear only once per unit (Shalom Rav) as recommended.
4. **Elohai N'tzor conflict:** confirm no second, later gold line after Shalom Rav's chatimah within the Silent Amidah unit.
5. **Mi Shebeirach:** this unit's chatimah-style close is English-only in translation with no distinct closing Hebrew line — confirm how (or whether) to render a gold line here.
