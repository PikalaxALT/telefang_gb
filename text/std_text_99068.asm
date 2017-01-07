Pointers_99068:
	dw Text_99130
	dw Text_99148
	dw Text_99155
	dw Text_99164
	dw Text_99181
	dw Text_991ad
	dw Text_991d4
	dw Text_991e5
	dw Text_991f0
	dw Text_991fc
	dw Text_99206
	dw Text_99235
	dw Text_9925c
	dw Text_99282
	dw Text_9928d
	dw Text_9929c
	dw Text_992ab
	dw Text_992b7
	dw Text_992d6
	dw Text_992f3
	dw Text_9930f
	dw Text_9931d
	dw Text_9932a
	dw Text_9933b
	dw Text_99358
	dw Text_9936f
	dw Text_99388
	dw Text_993a4
	dw Text_993b2
	dw Text_993c1
	dw Text_993ce
	dw Text_993dd
	dw Text_99406
	dw Text_99421
	dw Text_99438
	dw Text_99448
	dw Text_99457
	dw Text_99467
	dw Text_99476
	dw Text_994a1
	dw Text_994b9
	dw Text_994d1
	dw Text_994dc
	dw Text_994eb
	dw Text_994f9
	dw Text_9950a
	dw Text_99523
	dw Text_9953b
	dw Text_99557
	dw Text_99567
	dw Text_99577
	dw Text_99583
	dw Text_99595
	dw Text_995ae
	dw Text_995c9
	dw Text_995e1
	dw Text_995ef
	dw Text_995fe
	dw Text_9960e
	dw Text_9961c
	dw Text_99639
	dw Text_99648
	dw Text_99661
	dw Text_9968c
	dw Text_996a5
	dw Text_996be
	dw Text_996cc
	dw Text_996dc
	dw Text_996ed
	dw Text_996fa
	dw Text_99716
	dw Text_99729
	dw Text_9973b
	dw Text_99771
	dw Text_9978b
	dw Text_997aa
	dw Text_997b6
	dw Text_997c6
	dw Text_997d3
	dw Text_997e8
	dw Text_9980d
	dw Text_99825
	dw Text_9983d
	dw Text_9984b
	dw Text_9985b
	dw Text_99866
	dw Text_9987e
	dw Text_998a2
	dw Text_998b8
	dw Text_998dc
	dw Text_998ec
	dw Text_998f9
	dw Text_99900
	dw Text_99919
	dw Text_99946
	dw Text_99966
	dw Text_99994
	dw Text_999a1
	dw Text_999b0
	dw Text_999b8

Text_99130:
	db "モシモシ?デンワくれた?"
	line " したよ してない"
	txfn 10

Text_99148:
	db "ゴメンきづかなかったよ"
	txfn 2

Text_99155:
	db "じゃあだれだろう?そんだけ"
	txfn 2

Text_99164:
	db "もう!しんじらんない!"
	line " どうしたの? またおこってる"
	txfn 10

Text_99181:
	db "きいてよ!トモダチにオモチャ"
	line "かしたらこわしたんだ!!"
	line " ヒドイなあ ゆるしてやれよ"
	txfn 10

Text_991ad:
	db "おこるさ!いまおこらないで"
	line "いつおこるんだよ!!"
	line " いつもおこってる いま"
	txfn 10

Text_991d4:
	db "もうアイツとはクチきかないんだ"
	txfn 2

Text_991e5:
	db "あやまってきたらな"
	txfn 2

Text_991f0:
	db "そんなことないさ!!"
	txfn 2

Text_991fc:
	db "そうだ!いまだ!"
	txfn 2

Text_99206:
	db "デンジュウはとベるのととベない"
	line "のがいるけど ニンゲンも?"
	line " とベるわけないよ どうだろ?"
	txfn 10

Text_99235:
	db "そうなの?ニンゲンってみんな"
	line "とベないんだ?へぇー"
	line " いけない? そうだよ"
	txfn 10

Text_9925c:
	db "みたことないの?じゃあとベる"
	line "ヒトはめずらしいんだ"
	line " そうそう なんてね"
	txfn 10

Text_99282:
	db "そんなことないよ!"
	txfn 2

Text_9928d:
	db "だからヒコウキがあるんだね"
	txfn 2

Text_9929c:
	db "こんどつかまえにいこうよ!"
	txfn 2

Text_992ab:
	db "え?ホントはいないの"
	txfn 2

Text_992b7:
	db "さっきおおきなへビがでたよ!"
	line " おっきかった? みたかった"
	txfn 10

Text_992d6:
	db "モノスゴイおおきさだったよ!"
	line " スゴイね! ホントに?"
	txfn 10

Text_992f3:
	db "おぅ みせたかったよ!"
	line " つかまえてみせて ざんねん"
	txfn 10

Text_9930f:
	db "ほんとスゴイよ マジで!"
	txfn 2

Text_9931d:
	db "うそっぽくきこえる??"
	txfn 2

Text_9932a:
	db "ムリだよ!チョーでかいんだぞ!"
	txfn 2

Text_9933b:
	db "そんなにへビすきなのか?"
	line "こんどみかけたらデンワするよ"
	txfn 2

Text_99358:
	TX_CALL wPlayerName
	db "はスキキライ"
	line "ある?"
	line " ある ないよ"
	txfn 10

Text_9936f:
	db "なにがスキなの?"
	line " あまいもの しょっぱいもの"
	txfn 10

Text_99388:
	db "そうなんだーえらいな"
	line " あるの? なんでもたベなきゃ"
	txfn 10

Text_993a4:
	db "あまいものはウマイよなぁ"
	txfn 2

Text_993b2:
	TX_CALL wPlayerName
	db "なかなか"
	line "シブイなあ"
	txfn 2

Text_993c1:
	db "じつはイッパイあるんだ"
	txfn 2

Text_993ce:
	db "そうだよなぁ がんばるよ!"
	txfn 2

Text_993dd:
	db "オイ "
	TX_CALL wPlayerName
	db "!オレっておこリんぼうにみえるのか!!"
	line " もうおこってる みえない"
	txfn 10

Text_99406:
	db "そんなことないぞ!!"
	line " おこってるよ!! ああそぅ"
	txfn 10

Text_99421:
	db "やっぱリ みえないよなぁ"
	line " うん たぶんね"
	txfn 10

Text_99438:
	db "なんでオマエがおこるんだ??"
	txfn 2

Text_99448:
	db "イイカゲンなへんじすんな!"
	txfn 2

Text_99457:
	db "はぁ よかったーアリガトな "
	txfn 2

Text_99467:
	db "『たぶん』ってなんだよお!"
	txfn 2

Text_99476:
	db "オレのトモダチがぜんぜん"
	line "デンワにでないんだよ!!"
	line " どうしたのかな キラワレたね"
	txfn 10

Text_994a1:
	db "シンパイだよなぁ"
	line " うん ようすみてくれば?"
	txfn 10

Text_994b9:
	db "そ そうなのか?"
	line " ダイジョウブだよ うーん"
	txfn 10

Text_994d1:
	db "デンワこないかなぁ"
	txfn 2

Text_994dc:
	db "そうだな チョットみてくる"
	txfn 2

Text_994eb:
	db "ホントに?ダイジョウブ?"
	txfn 2

Text_994f9:
	db "え?なんでかんがえこんでるの?"
	txfn 2

Text_9950a:
	TX_CALL wPlayerName
	db "ゲンキにしてる? カゼひいた ゲンキだよ"
	txfn 10

Text_99523:
	db "カゼ?ダイジョウブか?"
	line " なんとか もうダメ"
	txfn 10

Text_9953b:
	db "そうか"
	TX_CALL wPlayerName
	db "はいつも"
	line "ゲンキだな"
	line " うん そうかな?"
	txfn 10

Text_99557:
	db "ひどくならないうちになおせよ"
	txfn 2

Text_99567:
	db "イシャにいかなきゃダメだぞ!"
	txfn 2

Text_99577:
	db "ゲンキはいいことだ!"
	txfn 2

Text_99583:
	db "うん!"
	TX_CALL wPlayerName
	db "でも"
	line "カゼひくのか?"
	txfn 2

Text_99595:
	db "アキカンってもえるゴミ?"
	line " そうだよ ちがうよ"
	txfn 10

Text_995ae:
	db "こんなにカタくてももえるのか?"
	line " うん まちがえた"
	txfn 10

Text_995c9:
	db "もえないゴミなんだ"
	line " そう ちゃんとわけてね"
	txfn 10

Text_995e1:
	db "ホントにホントかぁー??"
	txfn 2

Text_995ef:
	db "だろ?やっぱリもえないんだ"
	txfn 2

Text_995fe:
	db "よし わかったぞ!サンキュー"
	txfn 2

Text_9960e:
	db "おう!きちんとわけるぜ!"
	txfn 2

Text_9961c:
	db "なぁ オレ "
	TX_CALL wPlayerName
	db "に"
	line "ホンかリた?"
	line " うん かしてない"
	txfn 10

Text_99639:
	db "ゴメン もうちょっとまって"
	txfn 2

Text_99648:
	db "そっかわかった じゃあ"
	line "こんどあったらかえすよ"
	txfn 2

Text_99661:
	db "ニンゲンカイではケイタイデンワ"
	line "つかうとおカネとられんだろ?"
	line " そうだよ しらない"
	txfn 10

Text_9968c:
	db "へぇータイへンなんだなぁ"
	line " そうだよ らしいね"
	txfn 10

Text_996a5:
	db "なんでしらないの??"
	line " もってないもん さぁ?"
	txfn 10

Text_996be:
	db "ムダづかいにちゅういだな"
	txfn 2

Text_996cc:
	TX_CALL wPlayerName
	db "は"
	line "つかってないのか?"
	txfn 2

Text_996dc:
	db "そっか カネかからなくていいな"
	txfn 2

Text_996ed:
	db "オレのはなしきいてる?"
	txfn 2

Text_996fa:
	db "つかれたー"
	line ""
	TX_CALL wPlayerName
	db "むかえにきて"
	line " イヤダ! きるよ!"
	txfn 10

Text_99716:
	db "ケチーほかのトモダチに"
	line "たのむもん"
	txfn 2

Text_99729:
	db "あー "
	TX_CALL wPlayerName
	db "?"
	line "モシモシ?おーい"
	txfn 2

Text_9973b:
	db "あたらしいケイタイをかおうと"
	line "おもっていて いまおカネを"
	line "ためてるんだ!"
	line " エライじゃん かってもらえよ"
	txfn 10

Text_99771:
	db "いくらためればいいかな?"
	line " わかんない いっぱい"
	txfn 10

Text_9978b:
	TX_CALL wPlayerName
	db "はいっつも"
	line "かってもらってんの?"
	line " うん ちがうけど"
	txfn 10

Text_997aa:
	db "うーん いくらだろ?"
	txfn 2

Text_997b6:
	db "そうだね おおいほうがいいね"
	txfn 2

Text_997c6:
	db "ジブンでかわなきゃ!!"
	txfn 2

Text_997d3:
	db "かってもらってばっかじゃ"
	line "ダメだよね!"
	txfn 2

Text_997e8:
	db "ねぇ サンダルっていったい"
	line "どんなタル?"
	line " ながほそいの はきものだよ"
	txfn 10

Text_9980d:
	db "そっか ながいのか"
	line " うん しかもオモイんだ"
	txfn 10

Text_99825:
	db "そうなんだ!?"
	line " しらなかったの? ほしい?"
	txfn 10

Text_9983d:
	db "どのくらいほそいんだろ?"
	txfn 2

Text_9984b:
	db "オモイのか?オレもてるかな?"
	txfn 2

Text_9985b:
	db "はじめてしったよ!"
	txfn 2

Text_99866:
	db "うん はいてみたいな"
	line "キイロいのがいいなぁ!"
	txfn 2

Text_9987e:
	db "このまえはアリガトウ"
	line "おれいしないとね"
	line " なに?なに? いいよベつに"
	txfn 10

Text_998a2:
	db "なにがいい?"
	line " おカネ なんでもいいよ!"
	txfn 10

Text_998b8:
	db "ダメだよ!おれいは"
	line "キチンとしないと!!"
	line " そうか きをつかうなよ!"
	txfn 10

Text_998dc:
	db "トモダチからカネとるのか?!"
	txfn 2

Text_998ec:
	db "じゃあ ウタを1きょく"
	txfn 2

Text_998f9:
	db "そうだよ!"
	txfn 2

Text_99900:
	db "うん アリガト"
	line "じゃあこれからもなかよくしてね"
	txfn 2

Text_99919:
	db "オマエのへヤみたぞ!!"
	line "ダメじゃないか かたづけなきゃ"
	line " いつみたの? ゴメンかたすよ"
	txfn 10

Text_99946:
	db "オマエのママがみせてくれたよ"
	line " カッテにはいるな! えぇー!"
	txfn 10

Text_99966:
	db "ちゃんとかたさないとドコに"
	line "ナニがあるかわからなくなるよ"
	line " はい ニンゲンカイいったの?"
	txfn 10

Text_99994:
	db "なんだよ!いいじゃん!"
	txfn 2

Text_999a1:
	db "みられてこまるものあった?"
	txfn 2

Text_999b0:
	db "よろしい!!"
	txfn 2

Text_999b8:
	db "ナイショ!"
	txfn 2
