; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 04_background.ks ======================================
;
; 背景の扱いについて説明します。
;
; ★登場する主なタグ。
; [bg] … 背景の描画・切り替えを行います。
;
; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

ティラノスクリプトで背景を出す方法は、とてもシンプル!![p]
［bg］タグで一発です。[p]
まあ、すでに教室の背景が出ているんだけど……これを切り替えてみよう。[p]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; [bg] 背景画像を出します。（すでに出ている場合は切り替えを行います。）
; デフォルトは1000ミリ秒でフェードイン。
[bg storage="rouka.jpg"]

廊下に出てみたよ。[p]

; [bg] 200ミリ秒。
[bg storage="room.jpg" time="200"]

すばやく教室に戻ってみた!![p]

; [bg] 2000ミリ秒×バニッシュイン。
[bg storage="mori.jpg" time="2000" method="vanishIn"]

ず～んと森に入ってみた。[p]

; [bg] 1000ミリ秒×回転イン。
[bg storage="eki.jpg" time="1000" method="rotateInDownRight"]

くるんっと駅前に来てみた!![p]

; [bg] 教室に戻る。
[bg storage="room.jpg"]

……などなど。[p]
背景切り替えに使える効果はいっぱいあるので、それについてはタグリファレンスを見てね。[p]
あるいは「サンプルテクニック集２」にも詳しく載せてるよっ!![p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

さて、ここでレイヤーの話をしておくね。[p]
［bg］タグで出した背景はどのレイヤーに出ているのかというと……。[p]
「ベースレイヤー」に出ています。[p]
ベースレイヤーは、他のどのレイヤーよりも下に表示されるレイヤーで――[p]
原則として、背景以外のオブジェクトを出すことはできません。[p]
ベースレイヤーは完全に「背景を出す機能オンリーのレイヤー」だと思ってね。[p][akn/hap]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

最後に、こんなこともできるという例として……。[p]
凝った背景の切り替えを二つ、紹介しておこう。[p]
いったん画面を覆い隠して、その間に背景を切り替える演出だ。[akn/def]
一つ目、渦を巻くように暗転。[p]

; [chara_hide_all] キャラクターをすべて消します。
[chara_hide_all time="0"]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーをいったん非表示に。（オブジェクトは残ります）
[layopt layer="message0" visible="false"]
[layopt layer="fix"      visible="false"]

; [image]x2 [wait]でやや時間差をつけながら黒い画像を2つ出して、画面を暗転させます。
[image layer="1" x="0"  y="0" width="960" height="640" storage="04_bg.png"       name="maskA" time="1000" wait="false"]
[wait time="200"]
[image layer="1" x="0"  y="0" width="960" height="640" storage="color/black.png" name="maskB" time="1000"]

; [bg] 背景を瞬時に切り替えます。
[bg time="0" storage="mori.jpg"]

; [free]x2 画面を覆っていた黒い画像を2つ消します。
[free layer="1" name="maskB" time="1000" wait="false"] [wait time="200"]
[free layer="1" name="maskA" time="1000"]

; [chara_show] あかねを出す。
[chara_show name="akane"]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを表示しなおします。
[layopt layer="message0" visible="true"]
[layopt layer="fix"      visible="true"]

いまのは［image］と［free］を使っているよ。[p]
次に、二つ目。帯が画面を覆い隠す。[p]

; [keyframe]～[endkeyframe]x8 キーフレームアニメーションを定義します。
[keyframe name="slideInA"]
  [frame p="  0%" rotate="-40deg" x="-800"]
  [frame p=" 25%" rotate="-40deg" x="0"]
  [frame p="100%" rotate="-40deg" x="0"]
[endkeyframe]
[keyframe name="slideInB"]
  [frame p="  0%" rotate="-80deg" x="800"]
  [frame p=" 15%" rotate="-80deg" x="800"]
  [frame p=" 50%" rotate="-80deg" x="0"]
  [frame p="100%" rotate="-80deg" x="0"]
[endkeyframe]
[keyframe name="slideInC"]
  [frame p="  0%" rotate="-35deg" x="-1500"]
  [frame p=" 35%" rotate="-35deg" x="-1500"]
  [frame p=" 75%" rotate="-35deg" x="0"]
  [frame p="100%" rotate="-35deg" x="0"]
[endkeyframe]
[keyframe name="slideInD"]
  [frame p="  0%" rotate="-80deg" x="1500"]
  [frame p=" 50%" rotate="-80deg" x="1500"]
  [frame p="100%" rotate="-80deg" x="0"]
[endkeyframe]
[keyframe name="slideOutA"]
  [frame p="  0%" rotate="-40deg" x="0"]
  [frame p=" 50%" rotate="-40deg" x="0"]
  [frame p="100%" rotate="-40deg" x="800"]
[endkeyframe]
[keyframe name="slideOutB"]
  [frame p="  0%" rotate="-80deg" x="0"]
  [frame p=" 35%" rotate="-80deg" x="0"]
  [frame p=" 75%" rotate="-80deg" x="-1200"]
  [frame p="100%" rotate="-80deg" x="-1200"]
[endkeyframe]
[keyframe name="slideOutC"]
  [frame p="  0%" rotate="-35deg" x="0"]
  [frame p=" 15%" rotate="-35deg" x="0"]
  [frame p=" 50%" rotate="-35deg" x="1500"]
  [frame p="100%" rotate="-35deg" x="1500"]
[endkeyframe]
[keyframe name="slideOutD"]
  [frame p="  0%" rotate="-80deg" x="0"]
  [frame p=" 25%" rotate="-80deg" x="-1500"]
  [frame p="100%" rotate="-80deg" x="-1500"]
[endkeyframe]

[chara_hide_all time="0"]
[layopt layer="message0" visible="false"]
[layopt layer="fix"      visible="false"]

; [image]x4 [kanim]x4 [wa] 帯画像を出す→登場キーフレームアニメーションを適用→その完了を待つ。
[image layer="1" x="-350"  y="-100" width=" 800" height="400" storage="color/col1.png" name="a" zindex="4"]
[image layer="1" x="-250"  y="   0" width="1000" height="440" storage="color/col2.png" name="b" zindex="3"]
[image layer="1" x="-250"  y="   0" width="1400" height="600" storage="color/col3.png" name="c" zindex="2"]
[image layer="1" x="  30"  y="   0" width="1400" height="600" storage="color/col4.png" name="d" zindex="1"]
[kanim keyframe="slideInA" name="a" time="1500"]
[kanim keyframe="slideInB" name="b" time="1500"]
[kanim keyframe="slideInC" name="c" time="1500"]
[kanim keyframe="slideInD" name="d" time="1500"]
[wa]

; [bg] 背景を瞬時に切り替えます。
[bg time="0" storage="eki.jpg"]

; [kanim]x4 [wa] [freeimage] 退場キーフレームアニメーションを適用→その完了を待つ→前景レイヤー1番を解放。
[kanim keyframe="slideOutA" name="a" time="1500"]
[kanim keyframe="slideOutB" name="b" time="1500"]
[kanim keyframe="slideOutC" name="c" time="1500"]
[kanim keyframe="slideOutD" name="d" time="1500"]
[wa]
[freeimage layer="1"]

[chara_show name="akane"]
[layopt layer="message0" visible="true"]
[layopt layer="fix"      visible="true"]
これはキーフレームアニメーションをふんだんに使っています。[p]
……こういう演出を組むのはかなり手間だけど、一度作り上げてしまえば使いまわせるから、[p]
自分だけの切り替え方法を作ってみるのも、一興かも？[p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]