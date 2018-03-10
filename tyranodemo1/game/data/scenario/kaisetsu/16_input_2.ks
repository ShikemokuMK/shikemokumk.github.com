; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 16_input_2.ks =========================================
;
; 固定された入力方法をプレイヤーに提供する方法を紹介します。
;
; ★登場する主なタグ。
; [iscript] … JavaScriptを挿入します。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

前節では、ゲーム画面上に入力欄を作って……[p]
プレイヤーに自由に入力してもらう、という方法を説明しました。[p]
しかしそこからさらに踏み込んで、入力装置自体を作ってしまうこともできるよ。[p]
スクリーンキーボードとか、ソフトウェアキーボードとかいわれるやつだね。[p]
実際に、数字だけを入力できるソフトウェアキーボードを作ってみました。[l]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; [image][image][ptext] 前景レイヤー1番に黒背景、白枠、入力欄などを作成します。
; このとき、黒背景には name=black を指定しておきます。そうすることで、のちに [anim] で操作できるようになります。
[image layer="1" x="  0" y=" 0" width="960" height="640" storage="color/black.png" name="black"]
[image layer="1" x="375" y="90" width="215" height=" 55" storage="color/white.png" ]
[ptext layer="1" x="375" y="90" name="ptext" overwrite="true" text="" color="0x666666" size="42" width="215" align="right"]

; [anim] 黒背景を透かします。
[anim name="black" opacity="100" time="0"]

; [eval] ゲーム変数 f.input に '' を入れています。
[eval exp=" f.input = '' "]

; ※ 余談 ※
; プレイヤーの入力値は f.input というゲーム変数に入れていくことにしているので、その前準備をしているということです。
; '' というのは「文字列ということは確かなんだけど、でも中身は何もない」という状態です。
; こういうのを「空の文字列」とか言うことがあります。

; [button]x12 入力用のボタン12個を出します。何回でも押せてほしいので、fixボタンにしています。
; また、数字用のボタンに関しては、exp パラメータを利用して、
; 「それを押した瞬間一時変数 tf.num に特定の文字列が入る」ようなボタンにしています。
[button graphic="../fgimage/num/1.png"    x="366" y="160" exp=" tf.num = '1' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/2.png"    x="444" y="160" exp=" tf.num = '2' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/3.png"    x="522" y="160" exp=" tf.num = '3' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/4.png"    x="366" y="238" exp=" tf.num = '4' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/5.png"    x="444" y="238" exp=" tf.num = '5' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/6.png"    x="522" y="238" exp=" tf.num = '6' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/7.png"    x="366" y="316" exp=" tf.num = '7' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/8.png"    x="444" y="316" exp=" tf.num = '8' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/9.png"    x="522" y="316" exp=" tf.num = '9' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/0.png"    x="444" y="394" exp=" tf.num = '0' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/back.png" x="366" y="394"                      name="fix_phone" fix="true" target="*Sub_Back" ]
[button graphic="../fgimage/num/ok.png"   x="522" y="394"                      name="fix_phone"            target="*OK"       ]

; [s] 停止。
[s]

; ------------------------------------------------------
*Sub_Input

; 数字ボタンを押したときに飛んでくるラベルです。
; fixボタンで飛んでくるラベルなので、サブルーチンラベルですね。
; ちなみに「このラベルにはいったいどのボタンを押すことでやってきたのか？」という情報は、
; 一時変数 tf.num を見ればわかるようになっています。

; [iscript]～[endscript] もし入力済みの数字が8文字未満であれば、いま押した数字を末尾に追加します。
[iscript]
if (f.input.length < 8) {
f.input = f.input + tf.num
}
[endscript]

; ★ JavaScriptについて補足①
; 
; 次のように書くと、『条件を満たしていれば処理を実行しろ』という意味になります。
; 
;     if (条件) {
;         処理
;     }

; ★ JavaScriptについて補足②
;
; 変数 f.input に入っているのは文字列です。
; 実は文字列には隠された特殊な能力がありまして、それは何かというと、
; 『変数名の後ろに「.length」を付けると、その変数に入っている文字列の字数が得られる』
; というものです。
; つまり、
; 
;     f.input.length
;
; というのは、f.input という変数に入っている文字列の字数を意味しています。


; [ptext] 文字オブジェクトの内容を f.input で上書きします。
[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]

; [return] 帰ります。
[return]

; ------------------------------------------------------
*Sub_Back

; 1文字削除するラベルです。これもサブルーチンラベルです。

; [iscript] f.input の末尾1文字を削除します。
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
[endscript]

; ★ JavaScriptについて補足③
;
; 文字列が入っている変数名の後ろに「.substr(a, b)」を付けると、
; 「a 番目から b 文字分の文字列」を得ることができます。
; なお、先頭は1番目ではなく0番目という扱いです。数字は0から始まります。

[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

; ------------------------------------------------------
*OK

; 決定するラベル。実はここに飛んでくるためのボタンはfixボタンではないので、
; このラベルはサブルーチンラベルではありません。（ゆえに[return]の必要がない、というか、できない。）

; [cm][freeimage][clearfix] フリーレイヤーの解放、前景レイヤー1番の解放、および
; fixレイヤーにあるname=fix_phoneオブジェクトの解放を行います。
[cm]
[freeimage layer="1"]
[clearfix name="fix_phone"]

[akn/hap]
あなたが入力したのは「[emb exp="f.input"]」だね。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[akn/def]
……。[p]
とまあ、これが一例です。[p]
これの何がよいかというと、開発者目線だと「入力内容を制限できる」というところが大きい。[p]
さっきのソフトウェアキーボードだと、絶対に、数字しか入力できないでしょ。[p]
特定の文字しか入れてほしくない場合は、こういうのが便利……かもね。[p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]