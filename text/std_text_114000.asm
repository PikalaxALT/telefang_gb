Pointers_114000:
	dw Text_1141a0
	dw Text_1141af
	dw Text_1141bf
	dw Text_1141ca
	dw Text_1141df
	dw Text_1141ea
	dw Text_1141f6
	dw Text_114205
	dw Text_114212
	dw Text_114224
	dw Text_114239
	dw Text_114259
	dw Text_114266
	dw Text_114278
	dw Text_114288
	dw Text_11429e
	dw Text_1142a7
	dw Text_1142b9
	dw Text_1142c1
	dw Text_1142d0
	dw Text_1142dd
	dw Text_1142ed
	dw Text_1142f7
	dw Text_114302
	dw Text_11431b
	dw Text_11432b
	dw Text_114338
	dw Text_114343
	dw Text_114350
	dw Text_114364
	dw Text_114374
	dw Text_11438e
	dw Text_11439f
	dw Text_1143b1
	dw Text_1143b1
	dw Text_1143c8
	dw Text_1143d2
	dw Text_1143dd
	dw Text_1143f3
	dw Text_114410
	dw Text_114422
	dw Text_114437
	dw Text_11444a
	dw Text_11445f
	dw Text_114473
	dw Text_114488
	dw Text_11449c
	dw Text_1144a6
	dw Text_1144ae
	dw Text_1144b5
	dw Text_1144c2
	dw Text_1144de
	dw Text_1144ec
	dw Text_1144fc
	dw Text_11450e
	dw Text_11451c
	dw Text_11452c
	dw Text_11453b
	dw Text_11454b
	dw Text_114559
	dw Text_114568
	dw Text_114576
	dw Text_114584
	dw Text_114597
	dw Text_1145a9
	dw Text_1145ba
	dw Text_1145cb
	dw Text_1145de
	dw Text_1145f0
	dw Text_114601
	dw Text_114612
	dw Text_114620
	dw Text_11462d
	dw Text_11463e
	dw Text_11464d
	dw Text_11465c
	dw Text_11466c
	dw Text_114681
	dw Text_114696
	dw Text_1146a4
	dw Text_1146ba
	dw Text_1146cf
	dw Text_1146df
	dw Text_1146f0
	dw Text_114700
	dw Text_11470e
	dw Text_11471f
	dw Text_114732
	dw Text_114740
	dw Text_11474c
	dw Text_114759
	dw Text_114767
	dw Text_114773
	dw Text_114784
	dw Text_114794
	dw Text_1147a2
	dw Text_1147b1
	dw Text_1147c2
	dw Text_1147de
	dw Text_1147fa
	dw Text_114812
	dw Text_114828
	dw Text_11483d
	dw Text_11485a
	dw Text_114876
	dw Text_114882
	dw Text_114896
	dw Text_1148b2
	dw Text_1148c6
	dw Text_1148e3
	dw Text_1148f6
	dw Text_114912
	dw Text_11492c
	dw Text_114946
	dw Text_11495a
	dw Text_114969
	dw Text_114977
	dw Text_114985
	dw Text_11499e
	dw Text_1149b0
	dw Text_1149c1
	dw Text_1149e7
	dw Text_1149f3
	dw Text_114a02
	dw Text_114a18
	dw Text_114a22
	dw Text_114a38
	dw Text_114a4c
	dw Text_114a63
	dw Text_114a97
	dw Text_114ab5
	dw Text_114ace
	dw Text_114ae2
	dw Text_114af2
	dw Text_114afc
	dw Text_114b12
	dw Text_114b1c
	dw Text_114b2b
	dw Text_114b3c
	dw Text_114b4e
	dw Text_114b63
	dw Text_114b7a
	dw Text_114b94
	dw Text_114ba4
	dw Text_114bc2
	dw Text_114bcc
	dw Text_114be8
	dw Text_114c04
	dw Text_114c14
	dw Text_114c21
	dw Text_114c35
	dw Text_114c50
	dw Text_114c60
	dw Text_114c6e
	dw Text_114c83
	dw Text_114c93
	dw Text_114ca4
	dw Text_114cba
	dw Text_114cc3
	dw Text_114ccd
	dw Text_114cde
	dw Text_114cf4
	dw Text_114d2b
	dw Text_114d3e
	dw Text_114d51
	dw Text_114d64
	dw Text_114d77
	dw Text_114d7f
	dw Text_114d9a
	dw Text_114dab
	dw Text_114dbf
	dw Text_114dd3
	dw Text_114de8
	dw Text_114e03
	dw Text_114e26
	dw Text_114e33
	dw Text_114e4a
	dw Text_114e6e
	dw Text_114e8f
	dw Text_114eb4
	dw Text_114ec1
	dw Text_114ece
	dw Text_114eec
	dw Text_114f0a
	dw Text_114f1d
	dw Text_114f35
	dw Text_114f4a
	dw Text_114f51
	dw Text_114f59
	dw Text_114f61
	dw Text_114f6b
	dw Text_114f77
	dw Text_114f98
	dw Text_114fb6
	dw Text_114ff0
	dw Text_115013
	dw Text_11505e
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b
	dw Text_11507b

Text_1141a0:
	TX_CALL wBattleStringBuffer
	db "が"
	line "とうちゃくした!"
	txfn 5

Text_1141af:
	db "たいリょくが"
	line "かいふくした!"
	txfn 5

Text_1141bf:
	TX_CALL wBattleUserName
	line "『"
	TX_CALL wBattleStringBuffer
	db "』"
	txfn 5

Text_1141ca:
	TX_CALL wBattleUserName
	db "の"
	line "デンワバンゴウをゲットした!"
	txfn 5

Text_1141df:
	TX_CALL wBattleUserName
	line "『"
	TX_CALL wBattleStringBuffer
	db "』"
	txfn 5

Text_1141ea:
	TX_CALL wBattleUserName
	db "は"
	line "たおれた!"
	txfn 5

Text_1141f6:
	db "『コイツはかなわないや!』"
	txfn 5

Text_114205:
	TX_CALL wBattleUserName
	db "は"
	line "にげだした!"
	txfn 5

Text_114212:
	TX_CALL wBattleUserName
	line "『みちくさをしている!』"
	txfn 5

Text_114224:
	TX_CALL wBattlePlayerDenjuuName
	db "の"
	line "デンワバンゴウをうしなった!"
	txfn 5

Text_114239:
	db "けっかいがはられていて"
	line "でんまリゅくが"
	line "はつどうできない!!"
	txfn 5

Text_114259:
	TX_CALL wBattleStringBuffer
	db "が"
	line "あらわれた!"
	txfn 5

Text_114266:
	db "でんまリょく じゅうでんかいし!"
	txfn 5

Text_114278:
	TX_CALL wBattleUserName
	db "のこうげき!"
	line ""
	TX_CALL wBattleStringBuffer
	db "!"
	txfn 4

Text_114288:
	db "よぶ デンジュウを"
	line "せんたくしてください"
	txfn 4

Text_11429e:
	db "ゲームオーバー"
	txfn 5

Text_1142a7:
	db "てきのデンジュウを"
	line "やっつけた!"
	txfn 5

Text_1142b9:
	db "にげだした!"
	txfn 5

Text_1142c1:
	db "されど"
	line "にげられなかった!"
	txfn 5

Text_1142d0:
	db "たたかいに"
	line "やぶれた!"
	txfn 5

Text_1142dd:
	TX_CALL wBattleTargetName
	db "ポイントの"
	line "ダメージ!"
	txfn 4

Text_1142ed:
	db "てきをたおした!"
	txfn 5

Text_1142f7:
	db "みかたのこうげき!"
	txfn 5

Text_114302:
	TX_CALL wBattleUserName
	db "は"
	line ""
	TX_CALL wBattleTargetName
	db "ポイントの"
	line "けいけんちをえた!"
	txfn 5

Text_11431b:
	TX_CALL wBattleUserName
	db "は"
	line "レベルアップした!"
	txfn 5

Text_11432b:
	TX_CALL wBattleUserName
	db "は"
	line "しんかした!"
	txfn 5

Text_114338:
	TX_CALL wBattleUserName
	db "に"
	line "なった!"
	txfn 5

Text_114343:
	db "こうげきは はずれた!"
	txfn 4

Text_114350:
	db "どのデンジュウを"
	line "こうげきしますか?"
	txfn 5

Text_114364:
	TX_CALL wBattleUserName
	db "のこうげき!"
	line ""
	TX_CALL wBattleStringBuffer
	db "!"
	txfn 4

Text_114374:
	TX_SPEED 0
	db "これでいいですか?"
	line "   はい    いいえ"
	txfn 4

Text_11438e:
	TX_CALL wBattleUserName
	db "は"
	line "ゆうことをきかない!"
	txfn 5

Text_11439f:
	TX_CALL wBattleUserName
	db "は"
	line "かってにこうげきした!"
	txfn 4

Text_1143b1:
	db "バリアがでんまリゅくを"
	line "はじきとばした!!"
	txfn 5

Text_1143c8:
	db "いけ! "
	TX_CALL wBattleStringBuffer
	db "!"
	txfn 5

Text_1143d2:
	db "にげられなかった!"
	txfn 5

Text_1143dd:
	db "どのデンジュウの"
	line "ステータスをみますか?"
	txfn 5

Text_1143f3:
	TX_SPEED 0
	db " たたかう    にげる"
	line " ステータス      "
	txfn 4

Text_114410:
	TX_CALL wBattleUserName
	db "の"
	line "すばやさがアップした!"
	txfn 5

Text_114422:
	TX_CALL wBattleUserName
	db "の"
	line "めいちゅうリつがアップした!"
	txfn 5

Text_114437:
	TX_CALL wBattleUserName
	db "の"
	line "かいひリつがアップした!"
	txfn 5

Text_11444a:
	TX_CALL wBattleUserName
	db "の"
	line "こうげきリょくがアップした!"
	txfn 5

Text_11445f:
	TX_CALL wBattleUserName
	db "の"
	line "でんまリょくがアップした!"
	txfn 5

Text_114473:
	TX_CALL wBattleUserName
	db "の"
	line "ぼうぎょリょくがアップした!"
	txfn 5

Text_114488:
	TX_CALL wBattleUserName
	db "の"
	line "たいリょくがかいふくした!"
	txfn 5

Text_11449c:
	db "どくのダメージ!"
	txfn 5

Text_1144a6:
	db "しっぱい!!"
	txfn 4

Text_1144ae:
	TX_SPEED 0
	TX_CALL wc3a0
	txfn 4

Text_1144b5:
	db "わざにかからなかった!"
	txfn 5

Text_1144c2:
	TX_SPEED 0
	db "なかまをよびますか?"
	line "   よぶ    よばない"
	txfn 4

Text_1144de:
	TX_SPEED 0
	db "なかまはよベません!"
	txfn 5

Text_1144ec:
	TX_CALL wBattleUserName
	db " のわざを"
	line "おぼえた!"
	txfn 5

Text_1144fc:
	TX_CALL wBattleUserName
	line "『みちにまよっている!』"
	txfn 5

Text_11450e:
	TX_CALL wBattleUserName
	db "は"
	line "かくれている!"
	txfn 5

Text_11451c:
	TX_CALL wBattleUserName
	db "は"
	line "じゃんぷしている!"
	txfn 5

Text_11452c:
	TX_CALL wBattleUserName
	db "は"
	line "ひこうしている!"
	txfn 5

Text_11453b:
	TX_CALL wBattleUserName
	db "は"
	line "こんらんしている!"
	txfn 5

Text_11454b:
	TX_CALL wBattleUserName
	db "は"
	line "まひしている!"
	txfn 5

Text_114559:
	TX_CALL wBattleUserName
	db "は"
	line "のろわれている!"
	txfn 5

Text_114568:
	TX_CALL wBattleUserName
	db "は"
	line "ねむっている!"
	txfn 5

Text_114576:
	TX_CALL wBattleUserName
	db "は"
	line "ひるんでいる!"
	txfn 5

Text_114584:
	TX_CALL wBattleUserName
	db "は"
	line "けむリにつつまれている!"
	txfn 5

Text_114597:
	TX_CALL wBattleUserName
	db "は"
	line "どくにおかされている!"
	txfn 5

Text_1145a9:
	TX_CALL wBattleUserName
	db "は"
	line "めのまえがみえない!"
	txfn 5

Text_1145ba:
	TX_CALL wBattleUserName
	db "は"
	line "バリアをはっている!"
	txfn 5

Text_1145cb:
	TX_CALL wBattleUserName
	db "は"
	line "けっかいをはられている!"
	txfn 5

Text_1145de:
	TX_CALL wBattleUserName
	db "は"
	line "しもやけになっている!"
	txfn 5

Text_1145f0:
	TX_CALL wBattleUserName
	db "は"
	line "やけどをおっている!"
	txfn 5

Text_114601:
	TX_CALL wBattleUserName
	db "は"
	line "すがたをあらわした!"
	txfn 5

Text_114612:
	TX_CALL wBattleUserName
	db "は"
	line "ちゃくちした!"
	txfn 5

Text_114620:
	TX_CALL wBattleUserName
	db "は"
	line "まいおリた!"
	txfn 5

Text_11462d:
	TX_CALL wBattleUserName
	db "は"
	line "こんらんからさめた!"
	txfn 5

Text_11463e:
	TX_CALL wBattleUserName
	db "の"
	line "まひがなおった!"
	txfn 5

Text_11464d:
	TX_CALL wBattleUserName
	db "の"
	line "のろいがとけた!"
	txfn 5

Text_11465c:
	TX_CALL wBattleUserName
	db "は"
	line "ねむリからさめた!"
	txfn 5

Text_11466c:
	TX_CALL wBattleUserName
	db "は"
	line "こうげきたいせいにもどった!"
	txfn 5

Text_114681:
	TX_CALL wBattleUserName
	db "の"
	line "まわリのけむリがなくなった!"
	txfn 5

Text_114696:
	TX_CALL wBattleUserName
	db "の"
	line "どくがきえた!"
	txfn 5

Text_1146a4:
	TX_CALL wBattleUserName
	db "は"
	line "めのまえがみえるようになった!"
	txfn 5

Text_1146ba:
	TX_CALL wBattleUserName
	db "の"
	line "バリアのこうかがなくなった!"
	txfn 5

Text_1146cf:
	TX_CALL wBattleUserName
	db "の"
	line "けっかいがきえた!"
	txfn 5

Text_1146df:
	TX_CALL wBattleUserName
	db "の"
	line "しもやけがなおった!"
	txfn 5

Text_1146f0:
	TX_CALL wBattleUserName
	db "の"
	line "やけどがなおった!"
	txfn 5

Text_114700:
	TX_CALL wBattleUserName
	db "は"
	line "みをかくした!"
	txfn 5

Text_11470e:
	TX_CALL wBattleUserName
	db "は"
	line "たかくとびあがった!"
	txfn 5

Text_11471f:
	TX_CALL wBattleUserName
	db "は"
	line "おおぞらにまいあがった!"
	txfn 5

Text_114732:
	TX_CALL wBattleUserName
	db "は"
	line "こんらんした!"
	txfn 5

Text_114740:
	TX_CALL wBattleUserName
	db "は"
	line "まひした!"
	txfn 5

Text_11474c:
	TX_CALL wBattleUserName
	db "は"
	line "のろわれた!"
	txfn 5

Text_114759:
	TX_CALL wBattleUserName
	db "は"
	line "ねむリだした!"
	txfn 5

Text_114767:
	TX_CALL wBattleUserName
	db "は"
	line "ひるんだ!"
	txfn 5

Text_114773:
	TX_CALL wBattleUserName
	db "は"
	line "けむリにつつまれた!"
	txfn 5

Text_114784:
	TX_CALL wBattleUserName
	db "は"
	line "どくにおかされた!"
	txfn 5

Text_114794:
	TX_CALL wBattleUserName
	db "は"
	line "めをつむった!"
	txfn 5

Text_1147a2:
	TX_CALL wBattleUserName
	db "は"
	line "バリアをはった!"
	txfn 5

Text_1147b1:
	TX_CALL wBattleUserName
	db "は"
	line "けっかいをはられた!"
	txfn 5

Text_1147c2:
	TX_CALL wBattleUserName
	db "は"
	line "しもやけになった!"
	line "しゅびリょくダウン!!"
	txfn 5

Text_1147de:
	TX_CALL wBattleUserName
	db "は"
	line "やけどをおった!"
	line "こうげきリょくダウン!!"
	txfn 5

Text_1147fa:
	db "メモリーしますか?"
	line "   はい    いいえ"
	txfn 4

Text_114812:
	TX_CALL wBattleUserName
	db "の"
	line "デンワバンゴウをメモリーした!"
	txfn 5

Text_114828:
	db "デンワバンゴウを"
	line "メモリーしなかった!"
	txfn 5

Text_11483d:
	db "『ちょっと よリみちするから"
	line " すこし おくれるね!』"
	txfn 4

Text_11485a:
	db "『ごめん!まよっちゃった!"
	line " すこし おくれそう!』"
	txfn 4

Text_114876:
	TX_CALL wBattleTargetName
	db "チル ゲット!"
	txfn 5

Text_114882:
	db "てきのなかまは"
	line "おくれているようだ!"
	txfn 4

Text_114896:
	TX_CALL wBattleTargetName
	db "ひきまで よベます"
	line "SELECTで ステータス"
	txfn 4

Text_1148b2:
	db "デンパの"
	line "とどかないじょうたいです!"
	txfn 5

Text_1148c6:
	db "オマエ つよいなぁ!"
	line "デンワバンゴウ おしえてやるよ!"
	txfn 5

Text_1148e3:
	TX_CALL wBattlePlayerDenjuuName
	db "から"
	line "デンワがかかってきた!"
	txfn 4

Text_1148f6:
	db "でも もうメモリーが いっぱいでとうろくできない!!"
	txfn 5

Text_114912:
	db "にがてな あいてにたいして"
	line "ひかえめダメージ!!"
	txfn 5

Text_11492c:
	db "とくいな あいてにたいして"
	line "わリましダメージ!!"
	txfn 5

Text_114946:
	TX_CALL wBattleStringBuffer
	db "が"
	line "しょうぶを しかけてきた!"
	txfn 5

Text_11495a:
	TX_SPEED 0
	db "    つうしんまち!"
	txfn 4

Text_114969:
	db "つうしん しっぱいです!"
	txfn 5

Text_114977:
	db "つうしんが きれました!"
	txfn 5

Text_114985:
	db "トレードする デンジュウを"
	line "えらんでください!"
	txfn 4

Text_11499e:
	db "つうしんモードが"
	line "ちがいます!!"
	txfn 5

Text_1149b0:
	db "VSたいせんは"
	line "できません!!"
	txfn 5

Text_1149c1:
	db "VSたいせんをするには"
	line "2ひき いじょうのデンジュウが"
	line "ひつようです!!"
	txfn 5

Text_1149e7:
	db "VSたいせんOK!!"
	txfn 5

Text_1149f3:
	db "トレードは"
	line "できません!!"
	txfn 5

Text_114a02:
	db "トレードできる"
	line "デンジュウがいません!!"
	txfn 5

Text_114a18:
	db "トレードOK!!"
	txfn 5

Text_114a22:
	db "Dショットのメモリーが"
	line "いっぱいです!!"
	txfn 5

Text_114a38:
	db "つうしんモードを"
	line "えらんでください!"
	txfn 5

Text_114a4c:
	db "てんそうする Dメロを"
	line "えらんでください!"
	txfn 4

Text_114a63:
	db "もしもし なんかようじ?"
	line "ひさしぶリ! げんきだったか?"
	line "おれをよんでくれるのか?"
	line " はい  いいえ"
	txfn 10

Text_114a97:
	db "もしもし なんかようじ?"
	line "ひさしぶリ! げんきだったか?"
	txfn 5

Text_114ab5:
	db "Dメロが てんそうされるまで"
	line "おまちください!"
	txfn 4

Text_114ace:
	db "こちらから Dメロを"
	line "てんそうします"
	txfn 5

Text_114ae2:
	TX_SPEED 0
	db "   そうしんちゅう!!"
	txfn 4

Text_114af2:
	db "おわリました!!"
	txfn 5

Text_114afc:
	db "セーブする ばしょを"
	line "えらんでください!"
	txfn 4

Text_114b12:
	db "セーブしました!"
	txfn 5

Text_114b1c:
	db "データを うけとリました!"
	txfn 5

Text_114b2b:
	db "セーブデータが あリません!!"
	txfn 5

Text_114b3c:
	db "Dメロてんそうは"
	line "できません!!"
	txfn 5

Text_114b4e:
	db "どのデンジュウに"
	line "わざを かけますか?"
	txfn 4

Text_114b63:
	TX_CALL wBattleUserName
	db "は しんかできるレベルになっています"
	txfn 5

Text_114b7a:
	TX_SPEED 0
	db "しんかさせますか?"
	line "   はい    いいえ"
	txfn 4

Text_114b94:
	TX_CALL wBattleUserName
	db "は"
	line "しんかしなかった!"
	txfn 5

Text_114ba4:
	TX_SPEED 0
	db "ニックネームをつけますか?"
	line "   はい    いいえ"
	txfn 4

Text_114bc2:
	db "クリティカル!!"
	txfn 4

Text_114bcc:
	db "あいても このがめんにいることをかくにんしてください"
	txfn 5

Text_114be8:
	db "つうしんをかいししますか?"
	line "   はい    いいえ"
	txfn 4

Text_114c04:
	TX_SPEED 0
	db "   じゅしんちゅう!!"
	txfn 4

Text_114c14:
	db "ターゲット"
	line "けってい!"
	txfn 4

Text_114c21:
	db "どのデンジュウを"
	line "こうげきしますか?"
	txfn 4

Text_114c35:
	TX_SPEED 0
	db "   けいたいメモリー"
	line "   アクセスちゅう!"
	txfn 4

Text_114c50:
	db "やったぁ!! あリがとう!!"
	txfn 0

Text_114c60:
	db "   『うわ~~~!!』"
	txfn 4

Text_114c6e:
	TX_CALL wBattlePlayerDenjuuName
	db " から"
	line "デンワが かかってきた!"
	txfn 3

Text_114c83:
	db "おもくて おせないや...。"
	txfn 0

Text_114c93:
	db "もてそうなんだけどなぁ...。"
	txfn 0

Text_114ca4:
	db "これくらいに しといてやるぜ!"
	line "あばよ。"
	txfn 0

Text_114cba:
	TX_SPEED 0
	TX_CALL wMapHeader
	db "チル"
	txfn 4

Text_114cc3:
	TX_SPEED 0
	line ""
	TX_CALL wMapHeader
	db "チル"
	txfn 4

Text_114ccd:
	db "ちくしょー! おぼえてやがれ!"
	txfn 0

Text_114cde:
	TX_SPEED 3
	db "『やっと つながったのう"
	TX_SPEED 10
	db "...』"
	txfn 2

Text_114cf4:
	db "コイツが オレの『へいたい』だ"
	line "オレの じゃまをするヤツには"
	line "ようしゃしない!"
	line "いくぞ! テレファングだ!"
	txfn 2

Text_114d2b:
	db "メールが 1けん"
	line "とどいています。"
	txfn 0

Text_114d3e:
	db "メールが 2けん"
	line "とどいています。"
	txfn 0

Text_114d51:
	db "メールが 3けん"
	line "とどいています。"
	txfn 0

Text_114d64:
	db "メールが 4けん"
	line "とどいています。"
	txfn 0

Text_114d77:
	TX_SPEED 2
	line ""
	TX_CALL wMapHeader
	txfn 0

Text_114d7f:
	TX_CALL wca53
	db " の "
	TX_CALL wBattlePlayerDenjuuName
	line "から デンワが かかってきた!"
	txfn 3

Text_114d9a:
	db "とびらはかたくとざされている。"
	txfn 0

Text_114dab:
	TX_SPEED 10
	db "......"
	TX_SPEED 30
	db "."
	TX_SPEED 1
	db "いらない。"
	txfn 0

Text_114dbf:
	TX_CALL wca53
	db " を"
	line ""
	TX_CALL wBattlePlayerDenjuuName
	db " へプレゼントした"
	txfn 0

Text_114dd3:
	TX_CALL wBattlePlayerDenjuuName
	db " は"
	line "ふてきなえみを うかベた。"
	txfn 0

Text_114de8:
	TX_CALL wca53
	db "で DNAを"
	line "さいしゅ しようとした...。"
	txfn 0

Text_114e03:
	db "が..."
	TX_CALL wBattlePlayerDenjuuName
	db " からは"
	line "DNAを さいしゅ することが"
	line "できない。"
	txfn 0

Text_114e26:
	TX_CALL wca53
	db " をてにいれた。"
	txfn 0

Text_114e33:
	db "かいぞうをつづけますか?"
	line " はい  いいえ"
	txfn 10

Text_114e4a:
	db "けいけんちをすこしえた。"
	line "かいぞうをつづけますか?"
	line " はい  いいえ"
	txfn 10

Text_114e6e:
	db "けいけんちをえた。"
	line "かいぞうをつづけますか?"
	line " はい  いいえ"
	txfn 10

Text_114e8f:
	db "けいけんちをかなリえた!!"
	line "かいぞうをつづけますか?"
	line " はい  いいえ"
	txfn 10

Text_114eb4:
	TX_SPEED 3
	db "かいぞうかいし!!"
	txfn 4

Text_114ec1:
	TX_SPEED 3
	db "じっけんかいし!!"
	txfn 4

Text_114ece:
	TX_CALL wca53
	db " は"
	line "かいぞうしんか した!!"
	line ""
	TX_CALL wMapHeader
	db " になった。"
	txfn 2

Text_114eec:
	TX_CALL wca53
	db " は"
	line "じっけんしんか した!!"
	line ""
	TX_CALL wMapHeader
	db " になった。"
	txfn 2

Text_114f0a:
	db "よろしいですか?"
	line " はい  いいえ"
	txfn 10

Text_114f1d:
	db "しんかにひつような"
	line "アイテムがあリません!!"
	txfn 2

Text_114f35:
	TX_SPEED 0
	db "どのアイテムを"
	line "くみあわせますか?"
	txfn 2

Text_114f4a:
	TX_SPEED 0
	TX_CALL wca53
	txfn 4

Text_114f51:
	TX_SPEED 2
	line ""
	TX_CALL wMapHeader
	txfn 4

Text_114f59:
	TX_SPEED 2
	line ""
	TX_CALL wMapHeader
	txfn 2

Text_114f61:
	db "カギをつかった。"
	txfn 0

Text_114f6b:
	db "カギがかかっている。"
	txfn 0

Text_114f77:
	TX_SPEED 15
	db " "
	TX_SPEED 1
	db "『"
	TX_CALL wca53
	db "』を"
	line ""
	TX_SPEED 0
	db "        "
	TX_SPEED 2
	db " てにいれた。"
	txfn 0

Text_114f98:
	db "あれ? "
	TX_CALL wPlayerName
	db "?"
	line "ほかのトモダチと"
	line "おもったんだけどなー"
	txfn 2

Text_114fb6:
	db "やぁ "
	TX_CALL wPlayerName
	line "いまどこいるんだ?"
	line "まぁ どこでもいいんだけどな"
	line "ゲンキでやってればね"
	line "ちょっと きになっただけさ"
	txfn 2

Text_114ff0:
	db "もしもし?"
	line "このさいきん ヒマしてない?"
	line "おれは ヒマなんだよねー"
	txfn 2

Text_115013:
	db "もしもーし...あれ?"
	line "もしもーし???"
	line "ケンガイなのかな?"
	line "もしもーし??"
	line "あっ...つながった"
	line "それで ようじはなんだっけ?"
	line "わすれちゃったよ"
	txfn 2

Text_11505e:
	db "こちらから おくリますか?"
	line "   おくる   うけとる"
	txfn 4

Text_11507b:
