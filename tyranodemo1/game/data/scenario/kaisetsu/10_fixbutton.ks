; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 10_fixbutton.ks =======================================
;
; 固定ボタン（フィックスボタン、fixボタン）オブジェクトの説明をします。
;
; ★登場する主なタグ。
; [button fix=true] … 固定ボタンを出します。固定ボタンはフィックスレイヤーに出ます。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

固定ボタンオブジェクトについて説明しよう!![l][er]
固定ボタンというのは、文字通り画面上にずっと「固定」されるボタンのこと。[l][er]
……ちなみに「固定」は英語で「フィックス」と訳せるので、フィックスボタンともいうよ。[l][er][akn/hap]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

さっそく出してみよう。[l][er]



; [button] 固定ボタンを出します。
[button fix="true" target="*Sub_Return" x="145" y="195" graphic="09_button_A1.png" auto_next=no]



どん!![l][er]
これは「押すと音が鳴る」だけのボタンです。[l][er]
シナリオを読んでいる最中でも押すことができるうえに、何回押しても消えることはないよ。[l][er]
試しにポチポチ押してみるといいと思う。[l][er][akn/def]


……さて、これはふつうの画像ボタンと同様に［button］タグを使って出すものなんだけど、[l][er][akn/hap]
そのときfixパラメータにtrueを指定する、というところに特殊性があるわ。[l][er]
そうして出した固定ボタンは、ふつうのボタンが配置される「フリーレイヤー」ではなく、[l][er]
固定ボタンのためだけの場所に配置されるの。[l][er][akn/def]
その場所を「固定レイヤー」とか「フィックスレイヤー」とか言う。[l][er][akn/dok]

……。[l][er]
……なんか難しい話になってきたって？[l][er]
まあ、難しいと思ったところは、とりあえず気にしないでおこう。[l][er][akn/def]
[jump target="*Part2"]

; ------------------------------------------------------
*Sub_Return

[playse storage="09_button_3.ogg"]
[return]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

固定ボタンが押されたときには何が起こっているのかというと……。[l][er]
「押された瞬間に［call］タグが発動している」と思ってもらえばよいです。[l][er]
［call］タグが何かは知ってる？[l][er]
「指定のラベルに飛び、［return］にぶつかった時点で元の場所に戻ってくる」タグです。[l][er]
これに関連して……固定ボタンは「［return］後に次のタグに進むかどうか」を指定できます。[l][er]
言い換えると、ボタンを押しながらシナリオを進められるかどうかを指定できるってこと。[l][er]



; [button] 固定ボタンを出します。auto_next=yesで押しながらメッセージを進められるボタン。
[button fix="true" target="*Sub_Return" x="675" y="195" graphic="09_button_B1.png" auto_next=yes]



ほい。[l][er]
右側に、押しながらシナリオを進められる固定ボタンを出してみました。[l][er]
それ以外は左側のボタンと同じだよ。[l][er]
ぽちぽち押してみて、違いを確かめてみよう。[l][er][akn/dok]

……。[l][er]
…………。[l][er]
………………。[l][er]
どう？　わかる？？[l][er][akn/def]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

……いま出している固定ボタンは音が鳴るだけで実用性はないかもしれないけれど……。[l][er]
固定ボタンを使えば、たとえば、いつでも見れるヘルプ画面なんかが作れたりする。[l][er]



; [button] 固定ヘルプボタンを出します。
[button fix="true" target="*Sub_Show" x="30" y="30" graphic="10_fixbutton_A.png" auto_next=false]



ほい。[l][er]
左上の「i」ボタンを押すと、ティラノスクリプトの情報が見られます。[l][er][akn/hap]
このへんのスクリプトには、ちょっとした工夫があるんだー。[l][er][akn/def]
[jump target="*Part4"]

; ------------------------------------------------------
*Sub_Show

; [button] ヘルプ画像を《固定ボタンとして》出します。固定ボタンとして出すのがポイント。
[button fix="true" target="*Sub_Hide" graphic="10_fixbutton_B.png" name="info" auto_next="false"]
; [anim]x2 [wa] フェードインアニメーション→その完了を待つ。
[anim name="info" time="  0" opacity="  0"]
[anim name="info" time="350" opacity="255"]
[wa]
[return]

; ------------------------------------------------------
*Sub_Hide

; [anim][wa] フェードアウトアニメーション→その完了を待つ。
[anim name="info" time="350" opacity="0"]
[wa]
; [clearfix] nameパラメータを指定することで特定の固定ボタンを解放できます。
[clearfix name="info"]
[return]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

さて、いったん固定ボタンを全部解放するよ。[l][er]



; [clearfix] 固定ボタンをすべて解放します。
[clearfix]



解放しました。[l][er][akn/dok]
……おや。[l][er]
画面下に出ていたセーブとかロードとかのボタンも消えたね。[l][er][akn/def]
そう……実は、画面下に出ていたボタンも一種の固定ボタンだったのです。[l][er]
あれは「ロールボタン」といいます。「ロール」＝「役割」という意味だ。[l][er]
ロールボタンはすごく簡単に出すことができるよ。[l][er][akn/hap]
roleパラメータに「save」や「load」などの所定のキーワードを指定する……だけ!![l][er][akn/def]
バリエーションも豊富なんだよね。[l][er]



; [button]x12 ロールボタンをいっぱい出します。
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



ばばーん。[l][er]
これらは全部固定ボタンであり、ロールボタンでもあります。[l][er]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

このほか、変わった使い方として……。[p]
「私の位置をコントロールするボタン」を出してみよう。[l][er]



[button fix="true" target="*Sub_Left"  x=" 30" y="30" graphic="10_fixbutton_C.png" auto_next=false]
[button fix="true" target="*Sub_Right" x="130" y="30" graphic="10_fixbutton_D.png" auto_next=false]



はいっ。[l][er]
「←」ボタンを押すと私が左に、「→」ボタンを押すと私が右に動くよ。[l][er]
使いどころは正直わからないけど……まあ、こういうこともできるのだ。[l][er][akn/dok]
[jump target="*Part6"]

; ------------------------------------------------------
*Sub_Left

[chara_move name="akane" left="-=160" anim="true" time="300"]
[return]

; ------------------------------------------------------
*Sub_Right

[chara_move name="akane" left="+=160" anim="true" time="300"]
[return]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------


固定ボタンはねぇ……。[l][er]
ふつうのノベルゲームなら、ロールボタンくらいにしか使わないかもしれないけど、[l][er]
ちょっと複雑なギミックを入れたクリックゲームとかを作ろうと思ったら、[l][er]
たぶん使わなきゃいけないときが来るんじゃないかなぁ……と思うんだよね。[l][er][akn/def]
使いこなせると表現の幅がぐぐっと広がるので、余裕がある人はいろいろ試してみよう。[l][er]
……以上、固定ボタンの説明でした。[l][er]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]