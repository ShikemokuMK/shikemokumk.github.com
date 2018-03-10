; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 17_window_1.ks ========================================
;
; メッセージウィンドウのカスタマイズについて学びます。

; ★登場する主なタグ。
; [position]        … メッセージウィンドウの設定(背景色、背景画像、内余白/位置/大きさ/文字方向)を変更します。
; [button role=...] … ロールボタンを出します。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

; [akn/def] 独自マクロ。あかねの表情を変えます。似た名前のタグも同様に独自マクロです。
[akn/def]
ティラノスクリプトでは……。[p]
［position］タグを使ってメッセージウィンドウを簡単にカスタマイズすることができるよ。[p]
具体的には、背景となる色や画像を指定したり、位置や大きさを指定したり、[p]
上下左右の内余白を指定したり。そういうことができるの。[p]

[akn/hap]
じゃあ、シンプルなものから見ていこうね。[p]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; ★
; ★ロールボタンを削除します。
; ★

[akn/dok]
おっと……。[p]
その前に、ロールボタンを消しておこう。[p]
[akn/def]
ロールボタンというのは、いま画面下に出ているセーブやロードなどを行うボタンのこと。[p]
ロール＝役割という意味だね。[p]
これを消します。[p]

; [clearfix] fixレイヤーのオブジェクトをすべて取り除くタグです。
; セーブやロードなどを行える各種ロールボタンはfix(固定)レイヤーに表示されていますので、
; このタグによってそれらを一掃することができます。
[clearfix]

[akn/def]
消したよ。[p]



; ★
; ★キャラクターの名前欄を取り除きます。
; ★

キャラクターの名前欄も邪魔だから、消しちゃおう。[p]

; [free] 特定レイヤーから特定のnameのオブジェクトを削除するタグです。
; メッセージレイヤー0番からchara_name_areaオブジェクトを取り除きます。
[free name="chara_name_area" layer="message0"]

消しました。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; ★
; ★メッセージウィンドウを設定しなおします。
; ★

……よし、準備ができたので、メッセージウィンドウを設定し直すよ。[p]

; [position]x3 メッセージウィンドウの各種設定をしていきます。
; 1) 背景画像は無効。背景色は黒。不透明度は128(255で完全に不透明)。
; 2) 横幅は800px、高さは240px。位置は左から70px、上から380px。
; 3) 内余白は上-右-下-左の順に25-70-60-50px。
[position frame="none" color="0x000000" opacity="128"]
[position width="800" height="240" left="70" top="380"]
[position margint="25" marginr="25" marginb="25" marginl="25"]

; ※ 余談 ※
; [position]タグは1つにまとめることもできますが、
; あまり横長になると見にくいので、3つに分けています。
; なお、分けても効果は同じです。

; ※ 余談 ※
; layerパラメータを省略すると、メッセージレイヤー0番に対して設定を行います。

ほいっ!![p]
やや透けた黒色、というとってもシンプルなウィンドウになったね。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; ★
; ★メッセージウィンドウの設定をいろいろ変えていきます。
; ★

さらにいろいろ変えてみると、[l][r]

; ※ 注意 ※
; [position]タグを使うと、毎回《内余白の設定がリセット》されます。
; そのため、[position]タグでウィンドウの設定をあれこれ変えたいときは、
; 最後に内余白の設定を加えてください。
; （加えないと、想定外の動きをします。。。現状、仕様です）

[position opacity="255"]
 [position margint="25" marginr="25" marginb="25" marginl="25"]

不透明度を128から255にしたり、[l][r]

[position color="0x0000cc"]
 [position margint="25" marginr="25" marginb="25" marginl="25"]

背景色を黒から青にしたり、[l][r]

[position width="800" height="540" left="80" top="50"]
 [position margint="25" marginr="25" marginb="25" marginl="25"]

ウィンドウの位置や大きさ、内余白を変えたり、[l][r]

[position vertical="true"]
 [position margint="25" marginr="25" marginb="25" marginl="25"]

ウィンドウを縦書きにしてみたり。[p]
……ちょっと見づらいか。元に戻すよ～。[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

[position vertical="false"]
[position left="0" top="440" width="960" height="200"]
 [position margint="50" marginl="25" marginr="25" marginb="10"]

とりあえず位置や余白を最初の状態に戻したよ。[p]
よし、ここに背景画像を付けてみよう。[p]

[position frame="window0/_frame.png"]
 [position margint="50" marginl="25" marginr="25" marginb="10"]

じゃん。いい感じでしょ。[p]
さらに名前欄となる文字オブジェクトやロールボタンオブジェクトを置いてみよう。[p]
[ptext name="chara_name_area"  layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="36" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

[button name="role_button" role="skip"       graphic="window0/skip.png"   enterimg="window0/skip2.png"   x="& 0 * 80" y="615"]
[button name="role_button" role="auto"       graphic="window0/auto.png"   enterimg="window0/auto2.png"   x="& 1 * 80" y="615"]
[button name="role_button" role="save"       graphic="window0/save.png"   enterimg="window0/save2.png"   x="& 2 * 80" y="615"]
[button name="role_button" role="load"       graphic="window0/load.png"   enterimg="window0/load2.png"   x="& 3 * 80" y="615"]
[button name="role_button" role="quicksave"  graphic="window0/qsave.png"  enterimg="window0/qsave2.png"  x="& 4 * 80" y="615"]
[button name="role_button" role="quickload"  graphic="window0/qload.png"  enterimg="window0/qload2.png"  x="& 5 * 80" y="615"]
[button name="role_button" role="backlog"    graphic="window0/log.png"    enterimg="window0/log2.png"    x="& 6 * 80" y="615"]
[button name="role_button" role="window"     graphic="window0/close.png"  enterimg="window0/close2.png"  x="& 7 * 80" y="615"]
[button name="role_button" role="fullscreen" graphic="window0/screen.png" enterimg="window0/screen2.png" x="& 8 * 80" y="615"]
[button name="role_button" role="menu"       graphic="window0/menu.png"   enterimg="window0/menu2.png"   x="& 9 * 80" y="615"]
[button name="role_button" role="sleepgame"  graphic="window0/config.png" enterimg="window0/config2.png" x="&10 * 80" y="615" storage="config.ks"]
[button name="role_button" role="title"      graphic="window0/title.png"  enterimg="window0/title2.png"  x="&11 * 80" y="615"]

[akn/def]ででん。[p]
これでもとのウィンドウに戻りました。[p]



;-----------------------------------------------------------
*Part5.1
;-----------------------------------------------------------

; ★
; ★ウィンドウいろいろ。
; ★

[akn/hap]これであなたも自分だけのメッセージウィンドウが作れる!![p]
[akn/def]ね。[p]ということで、最後にいろんなメッセージウィンドウの例を出してみるよ。[p]

; [call] このシナリオファイルのずっと下のほうに、
; メッセージウィンドウ設定用の処理をまとめたサブルーチンラベルを書いてあります。
; そのラベルをこのタグで呼び出しています。
[call target="*Sub_Window_1"]

#あかね
スタンダードパッケージに入ってるやつ。[p]



;-----------------------------------------------------------
*Part5.2
;-----------------------------------------------------------

[call target="*Sub_Window_2"]

#【あかね】
｢黒-赤のグラデーションでダークな印象のウィンドウ｣[p]



;-----------------------------------------------------------
*Part5.3
;-----------------------------------------------------------

[call target="*Sub_Window_3"]

#あかね
｢名前欄と本文を横並びにして高さを抑えた、[r]帯のようなウィンドウ｣[p]



;-----------------------------------------------------------
*Part5.4
;-----------------------------------------------------------

[call target="*Sub_Window_4"]

#【あかね】
｢黒-透明のグラデーションで、どんな背景にもなじむウィンドウ｣[p]



;-----------------------------------------------------------
*Part5.5
;-----------------------------------------------------------

[call target="*Sub_Window_5"]

#【あかね】
｢シンプルなロールボタンを置いたウィンドウ｣[p]



;-----------------------------------------------------------
*Part5.6
;-----------------------------------------------------------

[call target="*Sub_Window_6"]

#akane
｢ルーズリーフとふせんのようなデザインでまとめたウィンドウ｣[p]
#akane:happy
｢いろいろ考えられるねー!!」[p]




;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [deffont] デフォルトの設定を戻しておきます。
[deffont size="40" color="0xffffff" edge="0x000000"]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "8";
[endscript]

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]



; ★
; ★以下はウィンドウ設定用のサブルーチンラベル群です。
; ★



; ----------------------------------------------------------
*Sub_Window_1
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position vertical="false"]
[position frame="window1/frame.png" opacity="230" ]
[position width="960" height="210" top="430" left="0"]
[position margint="45" marginr="70" marginb="60" marginl="50"]

; 名前欄
[ptext         name="chara_name_area" layer="message0" color="0xfafafa" size="24" x="40" y="435"]
[chara_config ptext="chara_name_area"]

; フォント
[deffont color="0x444444" edge="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "8";
[endscript]

; ロールボタン
[button name="role_button" role="skip"       graphic="window1/skip.png"   enterimg="window1/skip2.png"   x=" 35" y="610"]
[button name="role_button" role="auto"       graphic="window1/auto.png"   enterimg="window1/auto2.png"   x="110" y="610"]
[button name="role_button" role="save"       graphic="window1/save.png"   enterimg="window1/save2.png"   x="185" y="610"]
[button name="role_button" role="load"       graphic="window1/load.png"   enterimg="window1/load2.png"   x="260" y="610"]
[button name="role_button" role="quicksave"  graphic="window1/qsave.png"  enterimg="window1/qsave2.png"  x="335" y="610"]
[button name="role_button" role="quickload"  graphic="window1/qload.png"  enterimg="window1/qload2.png"  x="410" y="610"]
[button name="role_button" role="backlog"    graphic="window1/log.png"    enterimg="window1/log2.png"    x="485" y="610"]
[button name="role_button" role="window"     graphic="window1/close.png"  enterimg="window1/close2.png"  x="560" y="610"]
[button name="role_button" role="fullscreen" graphic="window1/screen.png" enterimg="window1/screen2.png" x="635" y="610"]
[button name="role_button" role="menu"       graphic="window1/menu.png"   enterimg="window1/menu2.png"   x="710" y="610"]
[button name="role_button" role="sleepgame"  graphic="window1/sleep.png"  enterimg="window1/sleep2.png"  x="785" y="610" storage="config.ks"]
[button name="role_button" role="title"      graphic="window1/title.png"  enterimg="window1/title2.png"  x="860" y="610"]

[return]



; ----------------------------------------------------------
*Sub_Window_2
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position left="0" top="480" width="960" height="160" frame="window2/_frame.png" opacity="200"]
[position marginl="218" margint="46" marginr="180"]

; 名前欄
[ptext name="chara_name_area" shadow="0x000000" layer="message0" color="0xffffff" size="20" x="217" y="510"]
[chara_config ptext="chara_name_area"]

; フォント
[deffont size="22" edge="none" shadow="0x000000" color="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "-14";
[endscript]

; ロールボタン
[button name="role_button" role="auto"      graphic="window2/auto.png"   enterimg="window2/auto2.png"   x="828" y="498" width="40" hint="オートモードを開始します。"  ]
[button name="role_button" role="skip"      graphic="window2/skip.png"   enterimg="window2/skip2.png"   x="872" y="498" width="40" hint="スキップモードを開始します。"]
[button name="role_button" role="backlog"   graphic="window2/back.png"   enterimg="window2/back2.png"   x="916" y="498" width="40" hint="バックログを開きます。"      ]
[button name="role_button" role="save"      graphic="window2/save.png"   enterimg="window2/save2.png"   x="828" y="542" width="40" hint="セーブ画面を開きます。"      ]
[button name="role_button" role="load"      graphic="window2/load.png"   enterimg="window2/load2.png"   x="872" y="542" width="40" hint="ロード画面を開きます。"      ]
[button name="role_button" role="sleepgame" graphic="window2/config.png" enterimg="window2/config2.png" x="916" y="542" width="40" hint="コンフィグ画面を開きます。" storage="config.ks"]
[button name="role_button" role="quicksave" graphic="window2/qsave.png"  enterimg="window2/qsave2.png"  x="828" y="584" width="40" hint="クイックセーブを行います。"  ]
[button name="role_button" role="quickload" graphic="window2/qload.png"  enterimg="window2/qload2.png"  x="872" y="584" width="40" hint="クイックロードを行います。"  ]
[button name="role_button" role="title"     graphic="window2/title.png"  enterimg="window2/title2.png"  x="916" y="584" width="40" hint="タイトル画面に戻ります。"    ]

[return]



; ----------------------------------------------------------
*Sub_Window_3
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position left="0" top="496" width="960" height="90" frame="window3/_frame.png" opacity="200"]
[position marginl="300" margint="1" marginr="100"]

; 名前欄
[ptext name="chara_name_area" shadow="0x000000" layer="message0" color="0xffffff" size="22" x="198" y="512" width="80" align="center"]
[chara_config ptext="chara_name_area"]

; フォント
[deffont size="22" edge="none" shadow="0x000000" color="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "-14";
[endscript]

; ロールボタン
[button name="role_button" role="window"    graphic="window3/close.png"  enterimg="window3/close2.png"  x="940" y="497" width="20" hint="メッセージウィンドウを閉じます。"]
[button name="role_button" role="auto"      graphic="window3/auto.png"   enterimg="window3/auto2.png"   x="556" y="594" width="40" hint="オートモードを開始します。"      ]
[button name="role_button" role="skip"      graphic="window3/skip.png"   enterimg="window3/skip2.png"   x="600" y="594" width="40" hint="スキップモードを開始します。"    ]
[button name="role_button" role="backlog"   graphic="window3/back.png"   enterimg="window3/back2.png"   x="644" y="594" width="40" hint="バックログを開きます。"          ]
[button name="role_button" role="save"      graphic="window3/save.png"   enterimg="window3/save2.png"   x="688" y="594" width="40" hint="セーブ画面を開きます。"          ]
[button name="role_button" role="load"      graphic="window3/load.png"   enterimg="window3/load2.png"   x="732" y="594" width="40" hint="ロード画面を開きます。"          ]
[button name="role_button" role="sleepgame" graphic="window3/config.png" enterimg="window3/config2.png" x="776" y="594" width="40" hint="コンフィグ画面を開きます。" storage="config.ks"]
[button name="role_button" role="quicksave" graphic="window3/qsave.png"  enterimg="window3/qsave2.png"  x="820" y="594" width="40" hint="クイックセーブを行います。"      ]
[button name="role_button" role="quickload" graphic="window3/qload.png"  enterimg="window3/qload2.png"  x="864" y="594" width="40" hint="クイックロードを行います。"      ]
[button name="role_button" role="title"     graphic="window3/title.png"  enterimg="window3/title2.png"  x="908" y="594" width="40" hint="タイトル画面に戻ります。"        ]

[return]



; ----------------------------------------------------------
*Sub_Window_4
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position left="0" top="340" width="960" height="300" frame="window4/_frame.png" opacity="200"]
[position marginl="210" margint="160" marginr="162"]

; 名前欄
[ptext name="chara_name_area" shadow="0x000000" layer="message0" color="0xffffff" size="24" x="208" y="482"]
[chara_config ptext="chara_name_area"]

; フォント
[deffont size="24" edge="none" shadow="0x000000" color="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "-8";
[endscript]

; ロールボタン
[showmenubutton]

[return]



; ----------------------------------------------------------
*Sub_Window_5
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position left="0" top="420" width="960" height="220" frame="window5/_frame.png" opacity="200"]
[position marginl="210" margint="60" marginr="40"]

; 名前欄
[ptext name="chara_name_area" shadow="0x000000" layer="message0" color="0xffffff" size="28" x="205" y="446"]
[chara_config ptext="chara_name_area"]

; フォント
[deffont size="28" edge="none" shadow="0x000000" color="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "-8";
[endscript]

; ロールボタン
[button name="role_button" role="sleepgame" graphic="window5/system.png"  enterimg="window5/system2.png" x="458" y="610" storage="config.ks"]
[button name="role_button" role="save"      graphic="window5/save.png"    enterimg="window5/save2.png"   x="537" y="610"]
[button name="role_button" role="load"      graphic="window5/load.png"    enterimg="window5/load2.png"   x="590" y="610"]
[button name="role_button" role="quicksave" graphic="window5/qsave.png"   enterimg="window5/qsave2.png"  x="648" y="610"]
[button name="role_button" role="quickload" graphic="window5/qload.png"   enterimg="window5/qload2.png"  x="719" y="610"]
[button name="role_button" role="backlog"   graphic="window5/log.png "    enterimg="window5/log2.png"    x="794" y="610"]
[button name="role_button" role="auto"      graphic="window5/auto.png"    enterimg="window5/auto2.png"   x="839" y="610"]
[button name="role_button" role="skip"      graphic="window5/skip.png"    enterimg="window5/skip2.png"   x="897" y="610"]

[return]



; ----------------------------------------------------------
*Sub_Window_6
; ----------------------------------------------------------

; メッセージボックス周りのリセット
[hidemenubutton]
[clearfix]
[free name="chara_name_area" layer="message0"]

; メッセージボックスのデザイン
[position left="0" top="420" width="960" height="220" frame="window6/_frame.png" opacity="255"]
[position marginl="50" margint="50" marginr="160"]

; 名前欄
[ptext name="chara_name_area" color="0xf36daa" layer="message0" size="28" x="56" y="440]
[chara_config ptext="chara_name_area"]

; フォント
[deffont size="28" color="0x444444" edge="none" shadow="0xffffff"]
[resetfont]
[iscript]
TYRANO.kag.config.defaultLineSpacing = "-3";
[endscript]

; ロールボタン
[button name="role_button" role="auto"    graphic="window6/auto.png"    enterimg="window6/auto2.png"   x="810" y="470"]
[button name="role_button" role="skip"    graphic="window6/skip.png"    enterimg="window6/skip2.png"   x="810" y="508"]
[button name="role_button" role="backlog" graphic="window6/back.png"    enterimg="window6/back2.png"   x="810" y="546"]
[button name="role_button" role="menu"    graphic="window6/menu.png"    enterimg="window6/menu2.png"   x="810" y="584"]

[return]