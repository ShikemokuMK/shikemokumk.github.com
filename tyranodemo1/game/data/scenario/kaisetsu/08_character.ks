; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 08_character.ks =======================================
;
; キャラクター操作について学習します。
;
; ★登場する主なタグ。
; [chara_new]       … キャラクターを定義します。
; [chara_face]      … 定義してあるキャラクターに表情を追加します。
; [chara_delete]    … キャラクターの定義を削除します。。
; [chara_show]      … 定義してあるキャラクターをオブジェクトとして表示します。
; [chara_mod]       … 表示しているキャラクターオブジェクトの表情を変更します。
; [chara_hide]      … 表示しているキャラクターオブジェクトを解放します。
; [chara_hide_all]  … 表示しているキャラクターオブジェクトをすべて解放します。
; [chara_ptext]     … キャラクターの名前欄として扱うべき文字オブジェクトを指定します。
; [chara_config]    … キャラクター操作にまつわる各種設定を行います。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

……説明しよう!![p]
「キャラクターオブジェクト」というのは……[r]いままさに!! あなたの目の前にいる私のことだ!![p]
私は「前景レイヤー0番」の上に乗っかっているキャラクターオブジェクトなのです。[p][akn/dok]
ただの画像オブジェクトだと思ったら、大間違いだぜ!![p][akn/def]
キャラクターオブジェクトは、画像オブジェクトに「便利な機能」が山ほどついたものなの。[p]
具体的には「画像の切り替え」「自動位置調整」「自動強調表現」などの機能がついてるよ。[p][akn/hap]
だから、キャラクターの立ち絵はぜひとも「キャラクターオブジェクト」で管理しよう!![p][akn/def]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

それでは……。[p]
キャラクター関連のタグを豊富に使った「寸劇」を見てもらおうかな。[p]
この「寸劇」では、キャラクター関係のタグ以外のタグはほとんど使ってないよ。[p]
では、どうぞ。[p]

; [chara_config] 強調表現を「ブライトネス」指定、表情の記憶機能を「有効」、表情切り替え時間を「０」に。
[chara_config talk_focus="brightness" memory="true" time="0"]

; [chara_new][chara_face]x4 やまとを定義します。
[chara_new  name="yamato" jname="やまと" storage="chara/yamato/normal.png" ]
[chara_face name="yamato"  face="angry"  storage="chara/yamato/angry.png"  ]
[chara_face name="yamato"  face="happy"  storage="chara/yamato/happy.png"  ]
[chara_face name="yamato"  face="sad"    storage="chara/yamato/sad.png"    ]
[chara_face name="yamato"  face="tohoho" storage="chara/yamato/tohoho.png" ]

; [chara_new][chara_face]x2 マスコットの怪獣キャラクターを定義します。最初の名前は「？？？」。
[chara_new   name="tyrano" jname="？？？" storage="chara/mascot_1/normal.png" ]
[chara_face  name="tyrano"  face="happy"  storage="chara/mascot_1/happy.png"  ]
[chara_face  name="tyrano"  face="angry"  storage="chara/mascot_1/angry.png"  ]

; [chara_show] マスコット(tyrano)を表示。
[chara_show  name="tyrano" zindex="10"]

; #tyrano ← これは[chara_ptext name=tyrano]と同義。特殊な書き方です。
#tyrano
がおーーー!![p]

; #akane:doki ← これは[chara_ptext name=akane face=doki]と同義。特殊な書き方です。
#akane:doki
な、なになに？　あなたはだれ？[p]

#tyrano:happy
がおがおーーーーー!!![p]

#akane
何を言っているのかさっぱりわからない……。[p]
これじゃ名前もわからないわ……。[p]
じゃあ……仮に「ティラ乃」ちゃんということにしておこうかな。[p]
……いい？[p]

; [iscript]～[endscript] 直接JavaScriptを操作して、
; マスコット(tyrano)の名前を「？？？」から「ティラ乃」に変更します。
[iscript]
TYRANO.kag.stat.charas['tyrano'].jname = 'ティラ乃'
[endscript]

#tyrano:default
が～～!![p]

#akane:default
通じてるのかな……かわいいわね。[p]

#
――ガラガラガラ。[p]

; [chara_show] やまと(yamato)を表示します。
[chara_show  name="yamato" top="30"]

#yamato
おっすー。[p]

#yamato:angry
やや、なんだこれ。ぬいぐるみか？[p]

; [chara_config] 強調アニメ－ションを「アップ」に。その時間は「150」ミリ秒。
[chara_config talk_anim="up" talk_anim_time="150"]
[chara_mod name="tyrano" reflect="true"] 
#tyrano:angry
[font size="100"]がうがう!!![p]

#yamato:tohoho
うおっ!!!![p][resetfont]

; [chara_move] やまとを左に相対的に80ピクセル動かします。
[chara_move name="yamato" left="-=80" anim="true" wait="false" time="200"]

おいっ、あかねっ! なんなんだよこいつは!![p]

[chara_mod name="tyrano" face="default"]
; [chara_config] 強調アニメーションを「無し」に。
[chara_config talk_anim="none"]
#akane:angry
その子はティラ乃ちゃんよ。[p]
こいつなんて言わないで!![p]

#yamato
……てぃらの？　んだ、そりゃ……。[p]

#akane:angry
……いいわ、私たちはあっちでお話ししてよう。ね、ティラ乃ちゃん。[p]

[chara_mod name="tyrano" reflect="false"] 
#tyrano:default
がお～。[p]

; [chara_hide]x2 あかね(akane)とマスコット(tyrano)を退場させます。
[chara_hide name="akane" wait="false" pos_mode="false"]
[chara_hide name="tyrano"]

#yamato:default
マジでなんなんだあれ……[p]

; [chara_show] あかね(akane)を再登場。
[chara_show name="akane"]
#akane
「あれ」じゃなくてティラ乃ちゃん!![p]
やまともちょっとこっちに来なさい!![p]

#yamato:tohoho
いや、いいけどよ……。[p]

; [chara_config] 自動強調表現を「無し」、表情記憶を「無効」、強調アニメーションを「ダウン」に。
[chara_config talk_focus="none" memory="false" talk_anim="down"]

; [chara_hide_all] キャラクターをすべて退場させます。
[chara_hide_all]

#３人
（ぺちゃくちゃぺちゃくちゃ）[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; [chara_show]x3 wait=falseを指定して、同時に3人登場させてみます。
[chara_show name="akane"  left=520 top=40  wait="false"]
[chara_show name="tyrano" left=330 top=140 wait="false" zindex="10"]
[chara_show name="yamato" ]

#akane
以上、寸劇でした～。[p]
#tyrano:happy
がお～!!![p]

[chara_config time="600" talk_anim="none"]

;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]