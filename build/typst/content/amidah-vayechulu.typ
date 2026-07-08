#import "../book.typ": *
#let ts(tr, he, label: none)={
  block(breakable:false,{
    if label!=none{ eyebrowsm(label); v(2pt) }
    grid(columns:(1fr,1.05fr), column-gutter:18pt, align:(left+top,right+top),
      [#set par(leading:0.8em); #text(size:10pt, fill:rgb("#4a4a52"))[#tr]], hbt(he))
  }); v(3pt)
}
#startprayer("Vayechulu", "וַיְכֻלּוּ", sec: "Amidah")
#rubric([We rise, and say together — as witnesses.])
#ts([Vay’chulú hashamáyim v’ha’áretz v’chol tz’va’ám. Vay’chál Elohím bayóm hash’vi’í m’lachtó ashér asáh, vayishbót bayóm hash’vi’í mikól m’lachtó ashér asáh. Vay’várech Elohím et yom hash’vi’í vay’kadésh otó, #text(fill:GOLDD)[ki vo shavát mikól m’lachtó ashér bará Elohím la’asót.]],
  [וַיְכֻלּ֛וּ הַשָּׁמַ֥יִם וְהָאָ֖רֶץ וְכׇל־צְבָאָֽם׃ וַיְכַ֤ל אֱלֹהִים֙ בַּיּ֣וֹם הַשְּׁבִיעִ֔י מְלַאכְתּ֖וֹ אֲשֶׁ֣ר עָשָׂ֑ה וַיִּשְׁבֹּת֙ בַּיּ֣וֹם הַשְּׁבִיעִ֔י מִכׇּל־מְלַאכְתּ֖וֹ אֲשֶׁ֥ר עָשָֽׂה׃ וַיְבָ֤רֶךְ אֱלֹהִים֙ אֶת־י֣וֹם הַשְּׁבִיעִ֔י וַיְקַדֵּ֖שׁ אֹת֑וֹ #text(fill:GOLDD)[כִּ֣י ב֤וֹ שָׁבַת֙ מִכׇּל־מְלַאכְתּ֔וֹ אֲשֶׁר־בָּרָ֥א אֱלֹהִ֖ים לַעֲשֽׂוֹת׃]])
#engn("The heavens and the earth were finished, and all their vast array. On the seventh day God completed the work that had been made, and rested on the seventh day from all the work. And God blessed the seventh day and made it holy, because on it God rested from all the work of creation.",
  [Vayechulu is the Torah’s own account of the first Shabbat (Genesis 2). We rise and say it together, standing as witnesses — testifying that the world was made, and that rest is what completes it.])
