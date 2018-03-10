
; == macro.ks ==============================================

; マクロを定義してリターンするだけのシナリオファイルです。
; first.ksからサブルーチンとして呼び出されます。
; 最後に[return]必須。
;
;
; マクロって何さ、という方は公式ページの説明をご一読くださいませ。
; http://tyrano.jp/usage/tech/macro
;
;
; ＝定義しているマクロ一覧＝
; 
; ├表情変更マクロ
; │├あかね
; ││├[akn/def]
; ││├[akn/hap]
; ││├[akn/sad]
; ││├[akn/dok]
; ││├[akn/ang]
; │├やまと
; │　├[ymt/def]
; │　├[ymt/hap]
; │　├[ymt/sad]
; │　├[ymt/thh]
; │　├[ymt/ang]
; │
; ├画面破壊/再構築マクロ
; │├[destroy]
; │├[reset_all]
; │├[set_message_window]
; │├[set_default_view]
; │
; ├目次表示マクロ
; 　├[index_reset]
; 　└[list_item]
;
; ==========================================================




; ----------------------------------------------------------
; 表情変更用マクロ
; ----------------------------------------------------------

; ----------------------------------------------------------
[macro name="akn/def"]
[chara_ptext name="akane"]
[chara_mod   name="akane" face="default"]
[endmacro]

; ----------------------------------------------------------
[macro name="akn/hap"]
[chara_ptext name="akane"]
[chara_mod   name="akane" face="happy"]
[endmacro]

; ----------------------------------------------------------
[macro name="akn/sad"]
[chara_ptext name="akane"]
[chara_mod   name="akane" face="sad"]
[endmacro]

; ----------------------------------------------------------
[macro name="akn/dok"]
[chara_ptext name="akane"]
[chara_mod   name="akane" face="doki"]
[endmacro]

; ----------------------------------------------------------
[macro name="akn/ang"]
[chara_ptext name="akane"]
[chara_mod   name="akane" face="angry"]
[endmacro]

; ----------------------------------------------------------
[macro name="ymt/def"]
[chara_ptext name="yamato"]
[chara_mod   name="yamato" face="default"]
[endmacro]

; ----------------------------------------------------------
[macro name="ymt/hap"]
[chara_ptext name="yamato"]
[chara_mod   name="yamato" face="happy"]
[endmacro]

; ----------------------------------------------------------
[macro name="ymt/sad"]
[chara_ptext name="yamato"]
[chara_mod   name="yamato" face="sad"]
[endmacro]

; ----------------------------------------------------------
[macro name="ymt/thh"]
[chara_ptext name="yamato"]
[chara_mod   name="yamato" face="tohoho"]
[endmacro]

; ----------------------------------------------------------
[macro name="ymt/ang"]
[chara_ptext name="yamato"]
[chara_mod   name="yamato" face="angry"]
[endmacro]








; ----------------------------------------------------------
; 画面の破壊/再構築系マクロ
; ----------------------------------------------------------



; ----------------------------------------------------------
; [destroy]
; すべてのレイヤーの画像やテキスト、ボタンなどを破壊し、
; ゲーム画面を更地に戻します。
[macro name="destroy"]
; メニューボタンを隠す
[hidemenubutton]
; メッセージの削除およびフリーレイヤーの解放
; (フリーレイヤー＝ボタンやHTMLなどが挿入されるレイヤー)
[cm]
; fixレイヤーの解放
[clearfix]
; 合成レイヤーの解放
[free_layermode time="0"]
; フィルターの解放
[free_filter]
; レイヤーの解放
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]
[freeimage layer="base" page="back"]
[freeimage layer="0"    page="back"]
[freeimage layer="1"    page="back"]
[freeimage layer="2"    page="back"]
; メッセージウィンドウの非表示
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]
[endmacro]

[macro name="reset_all"]
[destroy]
[showmenubutton]
[position width="928" height="608" left="16" top="16" color="0x000000" opacity="128" margint="8" marginr="8" marginb="8" marginl="8" frame="none"]
[deffont size="24" face="メイリオ"]
[resetfont]
[free name="chara_name_area" layer="message0"]
[layopt layer="base" visible="true"]
[layopt layer="0" visible="false"]
[layopt layer="1" visible="false"]
[layopt layer="2" visible="false"]
[layopt layer="message0" visible="true"]
[layopt layer="message1" visible="false"]
[endmacro]

; ----------------------------------------------------------
; [set_default_view]
; 画面をマスク→デストロイした後に
; 教室の背景＋あかねの立ち絵＋メッセージウィンドウを表示して
; マスクオフします。
; chara="off"を指定すると、キャラクターを表示しません。
[macro name="set_default_view"]

; [mask]～[mask_off]　マスクしている間に、画面の破壊と再構築を行います。
[mask color="white" time="400"]

; [destroy] 独自マクロ。画面にあるもの、画面にある効果、すべてを破壊します。
[destroy]

; [set_message_window] 独自マクロ。メッセージウィンドウをセットしなおします。
[set_message_window]

; [layopt] メッセージウィンドウを表示します。
[layopt layer="message0" visible="true"]

; [bg][chara_show][wait] 解説画面用の背景、キャラを表示してから、ちょっと待機します。
[bg         time="  0" storage="room.jpg"]
[chara_show time="  0" name="akane" face="default"]
[wait       time="100"]

[mask_off time="400"]


[endmacro]



; ----------------------------------------------------------
; [set_message_window]
[macro name="set_message_window"]

; [position]
; メッセージレイヤーのウィンドウの位置や画像、内余白などを調整します。
[position left="0" top="440" width="960" height="200" frame="window0/_frame.png"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; [free] chara_name_areaという名前の文字オブジェクトががすでにメッセージレイヤー0番に存在していた場合、
; それを削除します。(存在していなければこのタグでは何も起こりません。)
[free  name="chara_name_area"  layer="message0"]

; [clearfix] fixボタンを消します。
[clearfix]

; ※ 補足 ※
; 上の[free][clearfix]はリセットのため。
; すでにptextやfixボタンが出ている状態でこのマクロを使ったときに二重にオブジェクトが生じないように、
; メッセージウィンドウの設定のリセットを行うことを想定して入れたタグです。

; [ptext][chara_config]
; 新規にchara_name_areaという名前のptextオブジェクトをメッセージレイヤー0番に出して、
; それが発言者欄用のptextであることをティラノスクリプトに教えてあげます。
[ptext name="chara_name_area"  layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="36" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; [deffont][resetfont]
; フォントのデフォルト設定を行います。
; サイズは40px、フォントはロゴたいぷゴシック、文字色は白、縁取り色は黒です。
[deffont size="40" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

; ※ 補足 ※
; ロゴたいぷゴシックをティラノスクリプト上で使えるようにするために、
; data/othersフォルダにフォントファイルを配置し、
; data/others/font.cssファイルでそれを使うための設定を行い、
; それを[loadcss]で読み込んでいます。

; [button]
; ロールボタンを出していきます。
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

[endmacro]














; ----------------------------------------------------------
; 目次表示用マクロ
; ----------------------------------------------------------



; ----------------------------------------------------------
; [index_reset]
; 一時変数 tf.index に 0 を代入するだけのマクロ。
; tf.index は、目次の選択肢を表示するマクロで利用する、選択肢の番号のようなものです。
; 一番上の選択肢を表示するときが tf.index == 0 で、
; 順次 1, 2, 3 … と、選択肢を表示するたびに増えていきます。
[macro name="index_reset"]
[eval exp="tf.index = 0"]
[endmacro]



; ----------------------------------------------------------
; [list_item text1="XXX" text2="XXX" storage="XXX" shiryou="XXX"]
; 選択肢要素を表示します。
; その際、選択肢番号である変数 tf.index を利用して位置を決定する工夫をしています。
[macro name="list_item"]

; [eval]
; 一時変数 tf.image に、「参照すべき画像のパス」をぶち込みます。
; f.current_page_index には、現在のページ番号、すなわち 1～4 の整数が入っているはずなので、
; 結局この処理で、tf.image には、'color/col1.png'、'color/col2.png'……などの文字列がぶち込まれることになります。
[eval exp="tf.image = 'color/col' + f.current_page_index + '.png'"]

; [if]～[endif]
; 資料集があるかないかで分岐します。
[if exp="mp.shiryou == 'yes'"]

; 資料集があるなら。

; [image]
; 選択肢の背景となる色付きの四角形を表示します。
[image layer="0" storage="& tf.image"      x="  0" y="& tf.index * 95 +  5 " width="810" height="90"]

; storage 属性などの値の頭についている「&」は、
;「後に続く文字をJavaScriptの式として評価せよ」という合図です。
; storage 属性の場合で言えば、後に続く「tf.image」がJavaScriptの式として評価されますので、
; 変数 tf.image の中身が storage 属性に入ることになります。
; ※ もし「&」を省いてしまうと、単に「tf.image」という文字そのものを指定したことになります。

; [ptext]
; 文字を表示します。
[ptext layer="0" text="% text1"            x=" 20" y="& tf.index * 95 +  9 " bold="bold"   size="40"]
[ptext layer="0" text="% text2"            x=" 20" y="& tf.index * 95 + 56 "               size="22"]
; text 属性の頭についている「%」は、
;「マクロに渡された同じ属性名の値を渡してね」という合図です。

; [clickable]
; クリックすることができる透明ボタンを作成します。
[clickable color="white" opacity="0"      x="  0" y="& tf.index * 95 +  5 " width="810" height="90" mouseopacity="50" storage="& 'kaisetsu/' + mp.storage" target="%target"]

; 資料集についても同様の処理を行います。
[image layer="0" storage="&tf.image"      x="815" y="& tf.index * 95 +  5 " width="145" height="90"]
[ptext layer="0" text="資料集"            x="841" y="& tf.index * 95 + 27 " bold="bold"   size="30"]
[clickable color="white" opacity="0"      x="815" y="& tf.index * 95 +  5 " width="145" height="90" mouseopacity="50" storage="& 'shiryou/' + mp.storage" target="%target"]

[else]

; 資料集がないなら資料集は描画しない。
;                                                                                  !!!
[image layer="0" storage="&tf.image"      x="  0" y="& tf.index * 95 +  5 " width="960" height="90"]
[ptext layer="0" text="%text1"            x=" 20" y="& tf.index * 95 +  9 " bold="bold"   size="40"]
[ptext layer="0" text="%text2"            x=" 20" y="& tf.index * 95 + 56 "               size="22"]
[clickable color="white" opacity="0"      x="  0" y="& tf.index * 95 +  5 " width="960" height="90" mouseopacity="50" storage="& 'kaisetsu/' + mp.storage" target="%target"]

[endif]

; [eval]
; 選択肢をひとつ表示したということで、
; 選択肢番号をひとつ増やします。
[eval exp="tf.index = tf.index + 1"]

[endmacro]



[return]