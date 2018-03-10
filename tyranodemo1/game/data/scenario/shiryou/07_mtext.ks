; [reset_all] 独自マクロ。ゲーム画面をすべてリセットして、ゲーム起動時の状態に戻します。(詳細は「macro.ks」をご参照ください)
[reset_all]

演出文字オブジェクト資料集。[p]

; [layopt]x2 メッセージレイヤー0番とフィックスレイヤーを非表示に。
[layopt layer=1        visible=true ]
[layopt layer=message0 visible=false]
[layopt layer=fix      visible=false]

; [image][anim] 黒画像を画面いっぱいに引き伸ばして表示し、即座に不透明度をゼロにします。
[image layer=0 x=0 y=0 width=960 height=640 storage=color/black.png name=black]
[anim name=black opacity=0 time=0]

; [anim][wa] 1000ミリ秒かけて例の黒画像の不透明度を190にし、そのアニメーションの完了を待機します。
[anim name=black opacity=190 time=1000 effect=easeOutExpo]
[wa]



*Font_1

; [call] 説明用の文字オブジェクトを出しまくるサブルーチンを呼びます。
[call target="*Sub_Font_Ptext"]

; [glink][s]「再生する」リンクを設置して、ゲームを停止させます。
[glink color="black" text="再生する" x="310" y="250" target="*Font_2" width="240"]
[s]

*Font_2

; [call] 演出文字オブジェクト再生用のサブルーチンを呼びます。
[call target="*Sub_Font_Mtext"]

; [glink]x2 [s]「もう一度再生する」および「次へ」リンクを設置して、ゲームを停止させます。
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Font_2"   width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*Effect_1" width="240"]
[s]

*Effect_1

[freeimage layer="1"]
[call target="*Sub_Effect_1_Ptext"]
[glink color="black" text="再生する" x="310" y="250" target="*Effect_2" width="240"]
[s]

*Effect_2

[call target="*Sub_Effect_1_Mtext"]
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Effect_2" width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*Effect_3" width="240"]
[s]

*Effect_3

[freeimage layer="1"]
[call target="*Sub_Effect_2_Ptext"]
[glink color="black" text="再生する" x="310" y="250" target="*Effect_4" width="240"]
[s]

*Effect_4

[call target="*Sub_Effect_2_Mtext"]
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Effect_4" width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*Sync_1"   width="240"]
[s]

*Sync_1

[freeimage layer="1"]
[call target="*Sub_Sync_Ptext"]
[glink color="black" text="再生する" x="310" y="250" target="*Sync_2" width="240"]
[s]

*Sync_2

[call target="*Sub_Sync_Mtext"]
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Sync_2"  width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*Delay_1" width="240"]
[s]

*Delay_1

[freeimage layer="1"]
[call target="*Sub_Delay_Ptext"]
[glink color="black" text="再生する" x="310" y="250" target="*Delay_2" width="240"]
[s]

*Delay_2

[call target="*Sub_Delay_Mtext"]
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Delay_2"       width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*Delay_Scale_1" width="240"]
[s]

*Delay_Scale_1

[freeimage layer="1"]
[call target="*Sub_Delay_Scale_Ptext"]
[glink color="black" text="再生する" x="310" y="250" target="*Delay_Scale_2" width="240"]
[s]

*Delay_Scale_2

[call target="*Sub_Delay_Scale_Mtext"]
[glink color="black" text="もう一度再生する" x="310" y="250" target="*Delay_Scale_2" width="240"]
[glink color="red"   text="次へ"             x="310" y="350" target="*End"           width="240"]
[s]

*End

[jump storage="select.ks"]



; ※ 以下サブルーチン用ラベル ※



; ●
; ●文字の装飾について
; ●

; ------------------------------------------------------
*Sub_Font_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="通常"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="色文字"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="縁取り"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="影付け"]

[ptext layer="1" x=" 21" y="160" size="18" color="0xffcccc" text="太字"]
[ptext layer="1" x="501" y="160" size="18" color="0xffcccc" text="縦書き"]

[return]

; ------------------------------------------------------
*Sub_Font_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト～。" wait="false"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト～。" wait="false" color="0xff0000"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト～。" wait="false" edge="0xff0000"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト～。" wait="false" shadow="0xff0000"]

[mtext layer="1" x=" 20" y="180" size="36" text="演出文字オブジェクト～。" wait="false" bold="bold"]
[mtext layer="1" x="500" y="180" size="36" text="演出文字オブジェクト～。" wait="true"  vertical="true"]

[return]






; ●
; ●文字の演出方法について・その１。
; ●

; ------------------------------------------------------
*Sub_Effect_1_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="flash/flash"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="bounce/bounce"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="shake/shake"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="tada/tada"]

[ptext layer="1" x=" 21" y="160" size="18" color="0xffcccc" text="swing/swing"]
[ptext layer="1" x="501" y="160" size="18" color="0xffcccc" text="wobble/wobble"]
[ptext layer="1" x=" 21" y="235" size="18" color="0xffcccc" text="pulse/pulse"]
[ptext layer="1" x="501" y="235" size="18" color="0xffcccc" text="flip/flip"]

[ptext layer="1" x=" 21" y="310" size="18" color="0xffcccc" text="flipInX/flipOutX"]
[ptext layer="1" x="501" y="310" size="18" color="0xffcccc" text="flipInY/flipOutY"]
[ptext layer="1" x=" 21" y="385" size="18" color="0xffcccc" text="fadeIn/fadeOut"]
[ptext layer="1" x="501" y="385" size="18" color="0xffcccc" text="fadeInUp/fadeOutUp"]

[ptext layer="1" x=" 21" y="460" size="18" color="0xffcccc" text="fadeInDown/fadeOutDown"]
[ptext layer="1" x="501" y="460" size="18" color="0xffcccc" text="fadeInLeft/fadeOutLeft"]
[ptext layer="1" x=" 21" y="535" size="18" color="0xffcccc" text="fadeInRight/fadeOutRight"]
[ptext layer="1" x="501" y="535" size="18" color="0xffcccc" text="fadeInUpBig/fadeOutUpBig"]

[return]

; ------------------------------------------------------
*Sub_Effect_1_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト～。" in_effect="flash"  out_effect="flash"  wait="false"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト～。" in_effect="bounce" out_effect="bounce" wait="false"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト～。" in_effect="shake"  out_effect="shake"  wait="false"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト～。" in_effect="tada"   out_effect="tada"   wait="false"]

[mtext layer="1" x=" 20" y="180" size="36" text="演出文字オブジェクト～。" in_effect="swing"  out_effect="swing"  wait="false"]
[mtext layer="1" x="500" y="180" size="36" text="演出文字オブジェクト～。" in_effect="wobble" out_effect="wobble" wait="false"]
[mtext layer="1" x=" 20" y="255" size="36" text="演出文字オブジェクト～。" in_effect="pulse"  out_effect="pulse"  wait="false"]
[mtext layer="1" x="500" y="255" size="36" text="演出文字オブジェクト～。" in_effect="flip"   out_effect="flip"   wait="false"]

[mtext layer="1" x=" 20" y="330" size="36" text="演出文字オブジェクト～。" in_effect="flipInX"  out_effect="flipOutX"  wait="false"]
[mtext layer="1" x="500" y="330" size="36" text="演出文字オブジェクト～。" in_effect="flipInY"  out_effect="flipOutY"  wait="false"]
[mtext layer="1" x=" 20" y="405" size="36" text="演出文字オブジェクト～。" in_effect="fadeIn"   out_effect="fadeOut"   wait="false"]
[mtext layer="1" x="500" y="405" size="36" text="演出文字オブジェクト～。" in_effect="fadeInUp" out_effect="fadeOutUp" wait="false"]

[mtext layer="1" x=" 20" y="480" size="36" text="演出文字オブジェクト～。" in_effect="fadeInDown"  out_effect="fadeOutDown"  wait="false"]
[mtext layer="1" x="500" y="480" size="36" text="演出文字オブジェクト～。" in_effect="fadeInLeft"  out_effect="fadeOutLeft"  wait="false"]
[mtext layer="1" x=" 20" y="555" size="36" text="演出文字オブジェクト～。" in_effect="fadeInRight" out_effect="fadeOutRight" wait="false"]
[mtext layer="1" x="500" y="555" size="36" text="演出文字オブジェクト～。" in_effect="fadeInUpBig" out_effect="fadeOutUpBig" wait="true "]

[return]






; ●
; ●文字の演出方法について・その２。
; ●

; ------------------------------------------------------
*Sub_Effect_2_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="fadeInDownBig/fadeOutDownBig"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="fadeInLeftBig/fadeOutLeftBig"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="fadeInRightBig/fadeOutRightBig"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="bounceIn/bounceOut"]

[ptext layer="1" x=" 21" y="160" size="18" color="0xffcccc" text="bounceInDown/bounceOutDown"]
[ptext layer="1" x="501" y="160" size="18" color="0xffcccc" text="bounceInUp/bounceOutUp"]
[ptext layer="1" x=" 21" y="235" size="18" color="0xffcccc" text="bounceInLeft/bounceOutLeft"]
[ptext layer="1" x="501" y="235" size="18" color="0xffcccc" text="bounceInRight/bounceOutRight"]

[ptext layer="1" x=" 21" y="310" size="18" color="0xffcccc" text="rotateIn/rotateOut"]
[ptext layer="1" x="501" y="310" size="18" color="0xffcccc" text="rotateInDownLeft/rotateOutDownLeft"]
[ptext layer="1" x=" 21" y="385" size="18" color="0xffcccc" text="rotateInDownRight/rotateOutDownRight"]
[ptext layer="1" x="501" y="385" size="18" color="0xffcccc" text="rotateInUpLeft/rotateOutUpLeft"]

[ptext layer="1" x=" 21" y="460" size="18" color="0xffcccc" text="rotateInUpRight/rotateOutUpRight"]
[ptext layer="1" x="501" y="460" size="18" color="0xffcccc" text="rollIn/rollOut"]
[ptext layer="1" x=" 21" y="535" size="18" color="0xffcccc" text="fadeIn/hinge"]

[return]

; ------------------------------------------------------
*Sub_Effect_2_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト～。" in_effect="fadeInDownBig"  out_effect="fadeOutDownBig"  wait="false"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト～。" in_effect="fadeInLeftBig"  out_effect="fadeOutLeftBig"  wait="false"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト～。" in_effect="fadeInRightBig" out_effect="fadeOutRightBig" wait="false"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト～。" in_effect="bounceIn"       out_effect="bounceOut"      wait="false"]

[mtext layer="1" x=" 20" y="180" size="36" text="演出文字オブジェクト～。" in_effect="bounceInDown"  out_effect="bounceOutDown"  wait="false"]
[mtext layer="1" x="500" y="180" size="36" text="演出文字オブジェクト～。" in_effect="bounceInUp"    out_effect="bounceOutUp"    wait="false"]
[mtext layer="1" x=" 20" y="255" size="36" text="演出文字オブジェクト～。" in_effect="bounceInLeft"  out_effect="bounceOutLeft"  wait="false"]
[mtext layer="1" x="500" y="255" size="36" text="演出文字オブジェクト～。" in_effect="bounceInRight" out_effect="bounceOutRight" wait="false"]

[mtext layer="1" x=" 20" y="330" size="36" text="演出文字オブジェクト～。" in_effect="rotateIn"          out_effect="flipOutX"           wait="false"]
[mtext layer="1" x="500" y="330" size="36" text="演出文字オブジェクト～。" in_effect="rotateInDownLeft"  out_effect="rotateOutDownLeft"  wait="false"]
[mtext layer="1" x=" 20" y="405" size="36" text="演出文字オブジェクト～。" in_effect="rotateInDownRight" out_effect="rotateOutDownRight" wait="false"]
[mtext layer="1" x="500" y="405" size="36" text="演出文字オブジェクト～。" in_effect="rotateInUpLeft"    out_effect="rotateOutUpLeft"    wait="false"]

[mtext layer="1" x=" 20" y="480" size="36" text="演出文字オブジェクト～。" in_effect="rotateInUpRight" out_effect="rotateOutUpRight"  wait="false"]
[mtext layer="1" x="500" y="480" size="36" text="演出文字オブジェクト～。" in_effect="rollIn"          out_effect="rollOut"           wait="false"]
[mtext layer="1" x=" 20" y="555" size="36" text="演出文字オブジェクト～。" in_effect="fadeIn"          out_effect="hinge"             wait="true "]

[return]






; ●
; ●文字の演出順序について。
; ●

; ------------------------------------------------------
*Sub_Sync_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="通常(左から)"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="同時"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="ランダム"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="右から"]

[return]

; ------------------------------------------------------
*Sub_Sync_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト" wait="false"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト" wait="false" in_sync="true"    out_sync="true"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト" wait="false" in_shuffle="true" out_shuffle="true"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト" wait="true " in_reverse="true" out_reverse="true"]

[return]






; ●
; ●文字の演出遅延(ミリ秒指定)について。
; ●

; ------------------------------------------------------
*Sub_Delay_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="0ミリ秒遅延"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="50ミリ秒遅延"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="100ミリ秒遅延"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="200ミリ秒遅延"]

[return]

; ------------------------------------------------------
*Sub_Delay_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト～。" wait="false" in_delay="  0" out_delay="  0"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト～。" wait="false" in_delay=" 50" out_delay=" 50"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト～。" wait="false" in_delay="100" out_delay="100"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト～。" wait="true " in_delay="200" out_delay="200"]

[return]






; ●
; ●文字の演出遅延(倍率指定)について。
; ●

; ------------------------------------------------------
*Sub_Delay_Scale_Ptext

[ptext layer="1" x=" 21" y=" 10" size="18" color="0xffcccc" text="0倍遅延"]
[ptext layer="1" x="501" y=" 10" size="18" color="0xffcccc" text="1倍遅延"]
[ptext layer="1" x=" 21" y=" 85" size="18" color="0xffcccc" text="2倍遅延"]
[ptext layer="1" x="501" y=" 85" size="18" color="0xffcccc" text="3倍遅延"]

[return]

; ------------------------------------------------------
*Sub_Delay_Scale_Mtext

[mtext layer="1" x=" 20" y=" 30" size="36" text="演出文字オブジェクト" wait="false" in_delay_scale="0" out_delay_scale="0"]
[mtext layer="1" x="500" y=" 30" size="36" text="演出文字オブジェクト" wait="false" in_delay_scale="1" out_delay_scale="1"]
[mtext layer="1" x=" 20" y="105" size="36" text="演出文字オブジェクト" wait="false" in_delay_scale="2" out_delay_scale="2"]
[mtext layer="1" x="500" y="105" size="36" text="演出文字オブジェクト" wait="true " in_delay_scale="3" out_delay_scale="3"]

[return]