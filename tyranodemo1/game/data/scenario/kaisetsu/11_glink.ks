; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 11_glink.ks ===========================================
;
; 選択肢表現などに使える「文字ボタンオブジェクト」の使い方、
; カスタマイズの仕方などを説明します。
;
; ★登場する主なタグ。
; [glink]   … 文字ボタンオブジェクトを出します。
; [loadcss] … 外部CSSを読み込みます。（独自デザインの文字ボタンを出すのに使います。）

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

文字ボタンオブジェクトというのは、テキストを指定して作るボタン。[p]
画像を用意する必要がないので、手軽に利用することができるよ。[p]
……たとえば、このように。

; [glink] 文字ボタンを出します。
[glink x="370" y="300" text="次に進む" target="*Part1"]

; [s] ゲームを停止します。ボタンを表示したあとは必ず設置します。
[s]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

ボタンのデザインは9種類用意されていて、colorパラメータで指定できます。[p]
全部出してみるとこんな感じです。

; [glink] colorパラメータに着目しよう。全部で9種類あります。
[glink x="230" y=" 60" text="black"  target="*Part2" color="black" ]
[glink x="230" y="140" text="gray"   target="*Part2" color="gray"  ]
[glink x="230" y="220" text="white"  target="*Part2" color="white" ]
[glink x="230" y="300" text="orange" target="*Part2" color="orange"]
[glink x="230" y="380" text="red"    target="*Part2" color="red"]
[glink x="490" y=" 60" text="blue"  target="*Part2" color="blue"   ]
[glink x="490" y="140" text="rosy"  target="*Part2" color="rosy"   ]
[glink x="490" y="220" text="green" target="*Part2" color="green"  ]
[glink x="490" y="300" text="pink"  target="*Part2" color="pink"   ]
[s]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

背景画像を独自に指定することもできる。なお、画像はボタンのサイズに引き伸ばされるよ。

; [glink] graphicパラメータとenterimgパラメータを指定した例。
[glink x="370" y="300" text="次に進む" target="*Part3" graphic="11_glink_A.png" enterimg="11_glink_B.png"]
[s]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

ボタンの横幅や高さ、文字サイズや文字色なんかも変えられます。[p]

; [glink]x3 size/width/height/font_colorパラメータなどを指定した例。
[glink x="230" y="100" width="345" height="45" text="次に進む" target="*Part4" color="blue" size="40" font_color="0x000000"]
[glink x="230" y="200" width="345" height="45" text="次に進む" target="*Part4" color="blue" size="40" font_color="0x000000"]
[glink x="230" y="300" width="345" height="45" text="次に進む" target="*Part4" color="blue" size="40" font_color="0x000000"]
[s]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

[akn/dok]
あとは普通のボタンと同様に、効果音を指定してみたり。

; [ptext] クレジット表記。音声素材は「Music is VFR」より。
[ptext layer="1" x="5" y="0" size="40" edge=black color=white text="効果音素材：Music&ensp;is&ensp;VFR" name="credit"]

; [glink] enterse/leavese/clickseパラメータを指定した例。
[glink enterse=09_button_1.ogg leavese=09_button_2.ogg clickse=09_button_3.ogg x="370" y="300" text="次に進む" target="*Part5" color="pink"]
[s]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

; [free] クレジット表記を消す。
[free layer=1 name=credit]

文字ボタンをアニメーションの対象にとることもできる。

; [glink]x3 あとでアニメーションの対象にとれるようにnameパラメータを適当に指定しておく。
[glink x="1320" y="100" width="200" text="次に進む" target="*Part6" color="red" name="glink1"]
[glink x="1320" y="200" width="200" text="次に進む" target="*Part6" color="red" name="glink2"]
[glink x="1320" y="300" width="200" text="次に進む" target="*Part6" color="red" name="glink3"]

; [anim]x3 若干の[wait]を挟みながら、アニメーションを適用していきます。
[anim name="glink1" time="500" left="-=1000"]
[wait time="100"]
[anim name="glink2" time="500" left="-=1000"]
[wait time="100"]
[anim name="glink3" time="500" left="-=1000"]
[s]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

[akn/def]
……。[p]
以上が、文字ボタンを出すタグ［glink］の基本的な使い方ですが……。[p][akn/hap]
……「HTML」「CSS」の心得ある者ならば!![r]さらに発展した使い方も可能です!![p][akn/def]
……情報を確認する？[l]

[glink x="320" y="200" width="200" text="みせて" target="*Part6.2" color="red"]
[glink x="320" y="300" width="200" text="いいや" target="*Part6.1" color="black"]
[s]

;-------------------------------------------------------
*Part6.1

[akn/hap]
いまは、いっか。[p][akn/def]
じゃあ、文字ボタンオブジェクトの説明を終わります。[p]
[jump target="*End"]

;-------------------------------------------------------
*Part6.2

［glink］タグのcolorパラメータは、「HTML」で言うところの「クラス」に対応しているので、[p]
それに対して「CSS」を設定してあげると、自分だけのボタンが作れたりしちゃうわけです。[p][akn/hap]
じゃー、私が作ってみたボタンを披露しちゃう![p][akn/def]
[jump target="*Part7.1"]


;-----------------------------------------------------------
*Part7.1
;-----------------------------------------------------------

フラットなデザインで攻めたボタン。

; [glink]x3 colorパラメータに独自の値を指定します。
; これは「first.ks」で [loadcss file="data/others/glink/glink.css"] タグを使っているために
; 指定することができる値です。（これ以下の記述も同様）
[glink x="230" y="100" text="次に進む" target="*Part7.2" color="my-blue"]
[glink x="230" y="200" text="次に進む" target="*Part7.2" color="my-red"]
[glink x="230" y="300" text="次に進む" target="*Part7.2" color="my-orange"]
[s]



;-----------------------------------------------------------
*Part7.2
;-----------------------------------------------------------

背景無しのシンプルなテキストで攻めたボタン。……後ろの枠はふつうの画像オブジェクトです。

[image layer=1 storage=../image/11_glink_A.png x=320 y=70 width=320 height=320]
[glink x="230" y="100" text="次に進む" target="*Part7.3" color="my-text"]
[glink x="230" y="200" text="次に進む" target="*Part7.3" color="my-text"]
[glink x="230" y="300" text="次に進む" target="*Part7.3" color="my-text"]
[s]



;-----------------------------------------------------------
*Part7.3
;-----------------------------------------------------------

[freeimage layer="1"]

画像を使ってみる。

[glink x="230" y="100" text="次に進む" target="*Part7.4" color="my-image"]
[glink x="230" y="200" text="次に進む" target="*Part7.4" color="my-image"]
[glink x="230" y="300" text="次に進む" target="*Part7.4" color="my-image"]
[s]



;-----------------------------------------------------------
*Part7.4
;-----------------------------------------------------------

アニメーションさせてみる・その１。

[glink x="230" y="100" text="次に進む" target="*Par7.5" color="my-kanim"]
[glink x="230" y="200" text="次に進む" target="*Par7.5" color="my-kanim"]
[glink x="230" y="300" text="次に進む" target="*Par7.5" color="my-kanim"]
[s]



;-----------------------------------------------------------
*Par7.5
;-----------------------------------------------------------

アニメーションさせてみる・その２。

[glink x="230" y="100" text="次に進む" target="*Part8" color="my-anim"]
[glink x="230" y="200" text="次に進む" target="*Part8" color="my-anim"]
[glink x="230" y="300" text="次に進む" target="*Part8" color="my-anim"]
[s]



;-----------------------------------------------------------
*Part8
;-----------------------------------------------------------

……などなど。[p][akn/hap]
ちょっと難しいテクニックかもしれないけど……ボタンの可能性は無限大なのだよ!![p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]