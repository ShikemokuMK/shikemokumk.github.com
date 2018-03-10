; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 13_clickable.ks =======================================
;
; クリッカブル領域を作成する方法を紹介します。
;
; ★登場する主なタグ。
; [clickable] … クリッカブル領域（簡易ボタン）を作成する。
; 
; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

［clickable］というタグを知ってる？[p]
これを使えば、クリッカブルな領域――「クリック可能な長方形の領域」を簡単に作れるよ。[p]
その領域をクリックすると特定のラベルに飛ぶ、という仕掛けが作れる。[p][akn/hap]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------


さっそく使ってみるね。[p][akn/def]
私の顔にクリッカブルマップを貼り付けたので、クリックしてみて。

; [clickable] クリックすると*Part2に飛ばす領域を作成します。
[clickable x="373" y="56" width="250" height="233" target="*Part2" opacity="0" mouseopacity="50" color="0xffffff"]

; [s] ゲームを停止。
[s]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[akn/hap]
わっ! クリックしてくれたねっ!![p][akn/def]
このクリッカブル領域は、いくつでも配置できるし……。[p]
枠のデザインや透明度なんかも、けっこう自由が利くんだよ～。[p]
いろいろ見せてあげるね。[p]
私にクリッカブルマップを貼り付けたよ。[r]全部で４つ!!

; [clickable]x4 クリッカブルマップ、デザインいろいろ。
[clickable x="432" y="148" width="114" height="134" target="*Pos_1" opacity=" 64" mouseopacity="128" border="5px:dotted:black" color="0xffffff     "]
[clickable x="530" y="141" width=" 56" height=" 55" target="*Pos_2" opacity="128" mouseopacity="255" border="5px:outset:white" color="rgba(0,0,0,0)"]
[clickable x="431" y="303" width="101" height=" 96" target="*Pos_3" opacity=" 64" mouseopacity="128" border="5px:groove:white" color="lightblue    "]
[clickable x="374" y=" 48" width="123" height="103" target="*Pos_4" opacity=" 64" mouseopacity="128" border="1px:solid :black" color="pink         "]

; ※ 余談 ※ 
; borderパラメータには、｢CSS｣でいうところのborderプロパティに相当する内容が指定できます。
; (←その際、半角スペースを「:」に置き換える必要があります。)
; ｢CSS border｣などで調べるとよいでしょう。

; [s] ゲームを停止します。
[s]

; 以下、情報ラベル群。
; いずれも簡単な文章を2～3文読んだ後「*Part3」ラベルにジャンプします。

;-------------------------------------------------------
*Pos_1
顔か～。[p]
……。[p]
……面食い？[p]
[jump target="*Part3"]

;-------------------------------------------------------
*Pos_2
これは私のヘアピンだね。[p]
お気に入りなんだ～。[p]
[jump target="*Part3"]

;-------------------------------------------------------
*Pos_3
胸のリボンが気になる？[p]
ワンポイントの紅色が[ruby text="は"]栄えるでしょ～。[p]
[jump target="*Part3"]

;-------------------------------------------------------
*Pos_4
ハネてる髪の毛が気になる？[p]
これはわざとセットしてるんだよ!![p]
[jump target="*Part3"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

……ふむ。[p]
このクリッカブルマップを使えば、いろんなことができるね。[p]
たとえば、プレイヤーに背景を調べてもらう。[p]
そう、脱出ゲームや推理アドベンチャーゲームでよく見るやつ。[p]
実際にやってみるので、背景を思う存分調べてみてください!![p]
終わりたいときは右上の「Back」ボタンを押してね。[p]

; [layopt] メッセージレイヤー0番を非表示にします。
[layopt layer="message0" visible="false"]

; [clearfix] ロールボタンを解放します。
[clearfix]

; [position] ウィンドウの背景画像を変更します。
[position frame="window0/_frame4.png"]

; [chara_hide_all] キャラクターをすべて消します。
[chara_hide_all]

; [macro]～[endmacro]x2
; メッセージレイヤー0番を表示するだけのマクロ [sm] を定義します。(show messageの略のつもり)
[macro name="sm"]
  [layopt layer="message0" visible="true"]
[endmacro]

; *Set_Clickable_Mapにジャンプするだけのマクロ [jc] を定義します。(jump clickableの略のつもり)
[macro name="jc"]
  ; [clearstack] スタックを廃棄します。
  [clearstack]
  [jump target="*Set_Clickable_Map"]
[endmacro]



;-----------------------------------------------------------
*Set_Clickable_Map
;-----------------------------------------------------------

; ●
; ●クリッカブルマップを展開するラベル。
; ●

; [layopt] メッセージレイヤー0番を非表示にします。
[layopt layer="message0" visible="false"]

; [button] backボタンを表示します。
[button graphic="config/c_btn_back.png" enterimg="config/c_btn_back2.png" target="*Part4" x="860" y="10"]

; [clickable]x18 クリッカブルマップを貼り付けます。
[clickable  1 時計       x="561" y="150" width=" 46" height=" 53" target="*Pos_01" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  2 スピーカー x="440" y="149" width=" 54" height=" 42" target="*Pos_02" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  3 黒板       x="267" y="210" width="348" height=" 91" target="*Pos_03" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  4 粉受け     x="426" y="299" width=" 38" height=" 14" target="*Pos_04" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  5 黒板消し   x="280" y="286" width=" 47" height=" 13" target="*Pos_05" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  6 教卓       x="418" y="310" width="104" height=" 97" target="*Pos_06" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  7 テレビ     x="167" y="200" width=" 90" height=" 58" target="*Pos_07" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  8 スクリーン x="114" y=" 75" width="152" height=" 49" target="*Pos_08" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable  9 学級文庫   x="116" y="261" width="134" height=" 62" target="*Pos_09" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 10 掲示板     x="618" y="210" width=" 65" height=" 91" target="*Pos_10" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 11 ドア       x="785" y="230" width="116" height="185" target="*Pos_11" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 12 右側の窓   x="783" y="143" width="176" height=" 76" target="*Pos_12" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 13 左側の窓   x=" 12" y=" 55" width=" 45" height="305" target="*Pos_13" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 14 カーテン   x=" 60" y=" 89" width=" 15" height="270" target="*Pos_14" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 15 ロッカー   x="121" y="327" width="128" height=" 98" target="*Pos_15" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 16 蛍光灯     x="190" y="  2" width="656" height=" 74" target="*Pos_16" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 17 机         x="  4" y="426" width="943" height="203" target="*Pos_17" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]
[clickable 18 スイッチ   x="739" y="266" width=" 28" height=" 48" target="*Pos_18" opacity="0" mouseopacity="50" border="1px:dashed:black" color="0xffffff"]

; [s] ゲームを停止します。
[s]

; ●
; ●以下、クリッカブルマップをクリックしたときに飛ぶラベル群です。
; ●

;-------------------------------------------------------
*Pos_01
[sm]
時計だ。[p]
現在時刻は……午前７時１３分。[p]
[jc]

;-------------------------------------------------------
*Pos_02
[sm]
スピーカーがちょこんと収まっている。[p]
うんともすんとも言わない。[p]
[jc]

;-------------------------------------------------------
*Pos_03
[sm]
きれいな黒板がある。[p]
昨日の掃除当番がまめな性格だったらしい。[p]
[jc]

;-------------------------------------------------------
*Pos_04
[sm]
黒板の粉受けがある。[p]
いまは塵ひとつ入っていない。[p]
[jc]

;-------------------------------------------------------
*Pos_05
[sm]
黒板消しがある。[p]
黒板と同じくらいきれいだ。[p]
[jc]

;-------------------------------------------------------
*Pos_06
[sm]
教卓がある。[p]
！？……教卓のなかに…………[wait time="1500"]誰もいない。[p]
[jc]

;-------------------------------------------------------
*Pos_07
[sm]
ブラウン管のテレビがある。[p]
この奥行きが懐かしい。[p]
[jc]

;-------------------------------------------------------
*Pos_08
[sm]
プロジェクタースクリーンが巻いてある。[p]
ビデオ学習の時間に使うのだ。[p]
[jc]

;-------------------------------------------------------
*Pos_09
[sm]
学級文庫だ。[p]
国語辞典と漢字辞典も並んでいる。[p]
[jc]

;-------------------------------------------------------
*Pos_10
[sm]
掲示板だ。[p]
なになに……。[p]
今週は清掃週間です! 日頃の感謝をこめて、[r]校内をすみずみまできれいにしましょう!![p]
だって。[p]
[jc]

;-------------------------------------------------------
*Pos_11
[sm]
ドアは閉まっている。[p]
……？[p]
開けようとしてもビクともしない。[p]
[jc]

;-------------------------------------------------------
*Pos_12
[sm]
小さな窓がある。[p]
……手は届きそうにない。[p]
[jc]

;-------------------------------------------------------
*Pos_13
[sm]
窓の外には青空が広がっている。[p]
[jc]

;-------------------------------------------------------
*Pos_14
[sm]
カーテンが開けられている。[p]
[jc]

;-------------------------------------------------------
*Pos_15
[sm]
木製のロッカーがある。[p]
中には画用紙やマジックなどの文具が詰まっている。[p]
[jc]

;-------------------------------------------------------
*Pos_16
[sm]
蛍光灯があるが、電気はついていない。[p]
[jc]

;-------------------------------------------------------
*Pos_17
[sm]
椅子と机が並んでいる。[p]
[jc]

;-------------------------------------------------------
*Pos_18
[sm]
電気を点けるスイッチのようだ。[p]
いまはオフになっている。[p]
[jc]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

[cm]
[position frame="window0/_frame.png"]
[sm]
[chara_show name="akane"]
もういいかな？[p]
[chara_mod name="akane" face="happy"]
面白いタグでしょー!![p]
[jump storage="select.ks"]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]