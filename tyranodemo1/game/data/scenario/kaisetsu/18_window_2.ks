; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 18_window_2.ks ========================================
;
; メッセージウィンドウを複数出したり、
; メッセージウィンドウの上にキャラクターを表示したりする方法を説明します。
;
; ★登場する主なタグ。
; [current] … メッセージを出力するレイヤーを切り替えます。
; [er] … メッセージをクリアします。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

; [chara_new][chara_face]x4 メッセージウィンドウの上に出すあかねを定義します。
[chara_new  name="s_akane"  jname="あかね" storage="./chara/s_akane/normal.png"]
[chara_face name="s_akane"   face="angry"  storage="chara/s_akane/angry.png"   ]
[chara_face name="s_akane"   face="doki"   storage="chara/s_akane/doki.png"    ]
[chara_face name="s_akane"   face="happy"  storage="chara/s_akane/happy.png"   ]
[chara_face name="s_akane"   face="sad"    storage="chara/s_akane/sad.png"     ]

; [chara_new][chara_face]x4 メッセージウィンドウの上に出すやまとを定義します。
[chara_new  name="s_yamato" jname="やまと" storage="chara/s_yamato/normal.png" ]
[chara_face name="s_yamato"  face="angry"  storage="chara/s_yamato/angry.png"  ]
[chara_face name="s_yamato"  face="happy"  storage="chara/s_yamato/happy.png"  ]
[chara_face name="s_yamato"  face="sad"    storage="chara/s_yamato/sad.png"    ]
[chara_face name="s_yamato"  face="tohoho" storage="chara/s_yamato/tohoho.png" ]

さらに一歩進んだメッセージウィンドウのカスタマイズ方法を説明しよう!![p]
ティラノスクリプトでは、メッセージウィンドウの「上」にキャラクターを出したり、[p]
メッセージウィンドウを複数扱ったり、ということができるの。[p]

……説明する前に、メッセージウィンドウをシンプルにしておくね。[p]

; [clearfix][free] ロールボタンの消去と名前欄の削除を行います。
[clearfix]
[free  name="chara_name_area"  layer="message0"]

; [deffont][resetfont] デフォルトフォントを設定し、即座に反映します。
[deffont size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

; [position] メッセージウィンドウの設定をします。
[position layer="message0" left="  0" top="340" width="960" height="260" frame="window7/_frame.png" margint="52" marginl="300" marginr="90" marginb="10" opacity="210"]

; [ptext] 名前を出します。
[ptext    layer="message0"    x="100"   y="350" text="あかね" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif"color="0xffffff" edge="0x000000" name="chara_name"]

ふむ。[p]
こんなものかな。[p]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

ウィンドウの上にキャラクターを出すのは簡単だよ。[p]
キャラクターを出すとき、出力レイヤーに「メッセージレイヤー」を指定すればいい。[p]

; [chara_hide] あかねの立ち絵を消します。
[chara_hide name="akane"]

; [chara_show] あかねの顔をメッセージレイヤーに出します。
[chara_show name="s_akane" layer="message0" left="100" top="400"]

……だけど、それだけだとウィンドウとの重なりの順番がヘンになるので、そこも一緒に指定する必要がある。[p]

; [chara_hide] メッセージレイヤーに出ているあかねの顔を消します。
[chara_hide name="s_akane" layer="message0"]

; [chara_show] zindexパラメータを指定しながら、メッセージレイヤーにあかねの顔を出します。
[chara_show name="s_akane" layer="message0" left="100" top="400" zindex="101"]

[chara_mod  name="s_akane" face="happy"]
これでよし!![p]
[chara_mod  name="s_akane" face="default"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

さらに、複数のメッセージウィンドウを出してみよう。[p]
このサンプルゲームでは、メッセージレイヤーを「0番」と「1番」のふたつ使う設定にしていて、[p]
いま使っているメッセージレイヤーは0番なので、空いている1番を使ってみよう。[p]

; [position][ptext][chara_show][layopt] メッセージウィンドウの設定→名前出す→顔出す→レイヤを表示。
[position   layer="message1" left="  0" top=" 40" width="960" height="260" frame="window7/_frame.png" margint="52" marginl="300" marginr="90" marginb="10" opacity="210"]
[ptext      layer="message1"    x="100"   y=" 50" text="やまと" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif"color="0xffffff" edge="0x000000" name="chara_name"]
[chara_show layer="message1" left="100" top="100" name="s_yamato" time="0" zindex="101"]
[layopt layer=message1 visible=true]

じゃーん。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

ただ、これだけだと本当に「出しただけ」だから……。[p]
［current］タグや［er］タグを使いながら、メッセージを出力するレイヤーを切り替えていくといいよ。[p]

; 独自マクロ [mes0] 定義。
; [mes0] と記述するだけでメッセージレイヤー0番を使う準備が整うようにします。
[macro name="mes0"]
[current layer="message0"]
[er]
[endmacro]

; 独自マクロ [mes1] 定義。上記と同様。
[macro name="mes1"]
[current layer="message1"]
[er]
[endmacro]

[mes0]
たとえば、こんなふうに……。[l][er]
お疲れ様、やまと。[l]

[mes1]
[chara_mod  name="s_yamato" face="tohoho" time="0"]
おう、お疲れさん。[l][er]
こんなところで何やってんだ？[l]

[mes0]
[chara_mod  name="s_akane" face="happy" time="0"]
メッセージレイヤーのカスタマイズについて説明しているのだ!![l]

[mes1]
[chara_mod  name="s_yamato" face="default" time="0"]
なんだそうか。[l][er]
俺、帰っていい？[l]

[mes0]
[chara_mod  name="s_akane" face="default" time="0"]
あ、うん。いいよー。[l][er]

; [chara_hide][free][layopt] メッセージレイヤー1番に出したものを解放します。
[chara_hide layer="message1" name="s_yamato" time="0"]
[free       layer="message1" name="chara_name"]
[layopt     layer="message1" visible="false"]

……とまあ、こんなこともできるということです!![p]

; [chara_hide][free] メッセージレイヤー0番に出したものを解放します。
[chara_hide layer="message0" name="s_akane" time="0"]
[free       layer="message0" name="chara_name"]


;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]