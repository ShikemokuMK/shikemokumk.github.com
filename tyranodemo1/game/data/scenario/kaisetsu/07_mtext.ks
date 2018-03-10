; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 07_mtext.ks ===========================================
;
; 演出文字オブジェクトについて解説します。
;
; ★登場する主なタグ。
; [mtext] … 演出文字オブジェクトを出します。
;
; ==========================================================



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; ●
; ●演出文字オブジェクトをとりあえず出してみる。
; ●

この節では「演出文字オブジェクト」について見てみよう。[p]
これは派手な登場＆退場アニメーションの付いた文字を出すもので、実際にやってみると……。[p]

; [mtext]x2 演出オブジェクトを出してみます。
; 1個目が完全に消えてから2個目が出ます。
[mtext text="ざわ･･" layer="0" x="200" y="100" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff"]
[mtext text="ざわ･･" layer="0" x="600" y="300" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff"]

と、こんな感じです。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; ●
; ●演出の完了を待たずに次のスクリプトに進む。
; ●

同時に複数の演出文字を出すこともできる。[p]

; [mtext]x4 waitパラメータにfalseを指定することで、消えるのを待たずに次のスクリプトへ進ませることができます。
[mtext text="ざわ･･" layer="0" x="200" y="100" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff" wait="false"]
[mtext text="ざわ･･" layer="0" x="460" y="300" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff" wait="false"]
[mtext text="ざわ･･" layer="0" x="560" y="100" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff" wait="false"]
[mtext text="ざわ･･" layer="0" x="140" y="300" size="70" in_effect="wobble" time="0" color="0x000000" edge="0xffffff"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; ●
; ●フェードアウトさせずにレイヤーに残す。
; ●

さて、演出文字は基本的には勝手に消えるんだけど――[p]
退場アニメーションをなくして、演出文字をレイヤー上に残しておくこともできるよ。[p]

; [mtext] fadeoutパラメータにfalseを指定することで、退場を行わない。
; また、nameパラメータに適当な文字を指定しておくことで、のちに個別操作ができる。
[mtext text="教室&emsp;午前7時30分" layer="0" x="5" y="5" size="40" in_effect="fadeInRightBig" time="0" color="0xc0006f" edge="0xffffff" fadeout="false" name="mtext"]

[akn/hap]
ね。[p][akn/def]
背景の切り替えと一緒に演出文字を出してみたりして。[p]

; [free] 先ほどの演出文字オブジェクトを指定して解放する。
[free layer="0" name="mtext"]

; [mtext][bg] 演出文字オブジェクトと背景の切り替えを同時に行う。
[mtext text="廊下&emsp;午前7時45分" layer="0" x="5" y="5" size="40" in_effect="fadeInRightBig" time="0" color="0xc0006f" edge="0xffffff" fadeout="false" name="mtext" wait="false"]
[bg storage="rouka.jpg"]

[akn/hap]
探索要素があるアドベンチャーゲームでは、こういうのがあると親切かもしれないね![p]
[free layer="0" name="mtext"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

; ●
; ●メッセージレイヤーに出してみる。
; ●

[akn/def]工夫をすれば、メッセージウィンドウに演出文字を出すこともできるよ。[p]
やってみようか。[p][akn/dok]

; [glyph] クリック待ち画像の場所を直接指定します。
[glyph fix="true" left="850" top="575"]

; [mtext] layer=message0に着目しよう。メッセージレイヤー0番を出力対象にしています。
[mtext layer="message0" x="35" y="505" text="うわああぁぁぁああ!!!" size="80" edge="0x000000" fadeout="false" in_effect="bounceIn" name="mtext"]

[l]
[free name="mtext" layer="message0"]

; [glyph][mtext] 同じことをします。
[glyph fix="true" left="920" top="575"]
[mtext layer="message0" x="35" y="505" text="バケモノが出たぞぉお!!!" size="80" edge="0x000000" fadeout="false" in_effect="bounceIn" name="mtext"]

[l]
[free name="mtext" layer="message0"]

; [glyph] クリック待ち画像の場所を元に戻します。
[glyph fix="false"]

[akn/def]
……なんてね。[p]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

; ●
; ●画面を暗転させて文字を強調してみる。
; ●

画面を暗転させて演出文字を強調するのもよし。[p]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを非表示に。
[layopt layer=message0 visible=false]
[layopt layer=fix      visible=false]

; [image][anim] 黒画像を画面いっぱいに引き伸ばして表示し、即座に不透明度をゼロにします。
[image layer=0 x=0 y=0 width=960 height=640 storage=color/black.png name=black]
[anim name=black opacity=0 time=0]

; [anim][wa] 1000ミリ秒かけて例の黒画像の不透明度を190にし、そのアニメーションの完了を待機します。
[anim name=black opacity=190 time=1000 effect=easeOutExpo]
[wa]

; [mtext]x2 演出文字オブジェクトを出します。
[mtext layer=1 x=0 y=280 width=960 align=center size=36 text=ねえ……                 in_shuffle=true out_shuffle=true]
[mtext layer=1 x=0 y=280 width=960 align=center size=36 text=私の声……聞こえる……？ in_shuffle=true out_shuffle=true]

; [free] 例の黒画像を削除します。
[free  layer=0 name=black time=1000]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを表示に。
[layopt layer=message0 visible=true]
[layopt layer=fix      visible=true]

いいでしょ!![p]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

; ●
; ●エンディングを作ってみる。[p]
; ●

エンディングのスタッフロールもこれで作ることができるよ。[p]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを非表示にします。
[layopt layer=message0 visible=false]
[layopt layer=fix      visible=false]

; [image] 前景レイヤー1番を黒画像で覆います。(これによって、ベースレイヤーと前景レイヤー0番は見えなくなります。)
[image  layer=1 storage=color/black.png x=0 y=0 width=960 height=640 time=1000]

; [image] 背景用フォルダに入っている画像を画像オブジェクトとして前景レイヤー2番に出します。
[image layer=2 time=1000 x=40 y=100 width=400 folder=bgimage storage=room.jpg]

; ([mtext][wait])x2 前景レイヤー2番に演出文字オブジェクトをwait=falseで出して、
; 直後に[wait]タグを置いて待機時間を調整します。
[mtext layer=2 text=Director  x=520 y=200 size=30 color=white wait=false in_effect=rotateIn time=3000 out_effect=rotateOut] [wait time=500]
[mtext layer=2 text=OgawaYuji x=560 y=240 size=30 color=white wait=false in_effect=rotateIn time=3000 out_effect=rotateOut] [wait time=3000]

; [freeimage] 前景レイヤー2番を解放します。
[freeimage layer=2 time=1000]

; [image]～[freeimage] 上記の繰り返し。
[image layer=2 time=1000 x=520 y=300 width=400 storage=../bgimage/rouka.jpg]
[mtext layer=2 text=Scenario      x=80  y=340 size=30 color=white wait=false in_effect=rotateIn time=3000 out_effect=rotateOut] [wait time=500]
[mtext layer=2 text=HasegawaYuko  x=120 y=380 size=30 color=white wait=false in_effect=rotateIn time=3000 out_effect=rotateOut] [wait time=3000]
[freeimage layer=2 time=1000]

; [freeimage] 前景レイヤー1番を覆っていた黒画像を削除します。
[freeimage layer=1 time=1000]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを表示します。
[layopt layer=message0 visible=true]
[layopt layer=fix      visible=true]

…………。[p][akn/hap]
…………ね!![p]
以上、演出文字オブジェクトの解説でした。[p]
資料集として、演出方法などの各種パラメータの一覧を用意しているので、[p]
興味がある方はそちらも見てみてくださいー!![p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]