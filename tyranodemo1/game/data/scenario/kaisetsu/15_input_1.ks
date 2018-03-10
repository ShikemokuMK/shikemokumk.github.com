; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 15_input_1.ks =========================================
;
; プレイヤーに自由に文字を入力してもらう方法を説明します。
;
; ★登場する主なタグ。
; [edit]   … フリーレイヤーに「入力欄」を出します。
; [commit] … フリーレイヤーの「入力欄」の入力内容を、[edit]で指定していた変数のなかにコピーします。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

アドベンチャーゲームを作る上で――[p]
【プレイヤーに自由に文字を入力してもらいたいシーン】というのがあるかもしれない。[p][akn/hap]
たとえば、主人公の名前を決めるとか、主人公の好物を決めるとか。[p][akn/def]
そういうシーンでは、［edit］と［commit］が使えます。[p]
このタグを使ったサンプルをいくつか見せてみるね。[p][akn/def]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

まず、主人公の名前を入力してもらったうえで、それをメッセージとして出す方法のサンプル。[p]
よし!!  じゃあ、ここにあなたの名前を書いてね。[p]

; ------------------------------------------------------
*Part1_Edit

[layopt layer="message0" visible="false"]
[image layer="1" storage="15_input_A.png" x="0" y="0"]

; [edit] 入力欄を出します。
[edit name="f.player_name" left="380" top="350" width="260" height="40" size="30" maxchars="8" initial="山田花子"]

[button graphic="config/arrow_next.png" target="*Part1_Commit" x="440" y="430"]
[s]

; ------------------------------------------------------
*Part1_Commit

; [commit] このタグによって[edit]の中身が変数 f.player_name に移ります。
[commit]

; [cm] フリーレイヤーを解放します。入力欄はフリーレイヤーに出ていますので、これで入力欄が消えます。
[cm]

[freeimage layer="1"]
[layopt layer="message0" visible="true"]
「

; [emb] 変数 f.player_name の中身を確認してみます。
[emb exp="f.player_name"]

」さんっていうんだ？[l][r]
[link target="*Part1_OK"  ]【１】そうだ[endlink]／
[link target="*Part1_Edit"]【２】チガウ[endlink]
[s]

; ------------------------------------------------------
*Part1_OK

[cm]
[akn/hap]
はい!! これであなたも晴れてティラノ部員です。[p]
これからよろしくね、[emb exp="f.player_name"]さん。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[akn/def]
入力欄は複数出すこともできるので、たとえば、苗字と名前を分けることもできる。[p]

; ------------------------------------------------------
*Part2_Edit

[layopt layer="message0" visible="false"]
[image layer="1" storage="15_input_A.png" x="0" y="0"]

; [edit]x2 入力欄を2個出します。
[edit name="f.player_fname" left="380" top="350" width="120" height="40" size="30" maxchars="4" initial="山田"]
[edit name="f.player_name"  left="510" top="350" width="120" height="40" size="30" maxchars="4" initial="花子"]

[button graphic="config/arrow_next.png" target="*Part2_Commit" x="440" y="430"]
[s]

; ------------------------------------------------------
*Part2_Commit

[commit]
[cm]
[freeimage layer="1"]
[layopt layer="message0" visible="true"]
「[emb exp="f.player_fname"]　[emb exp="f.player_name"]」さんっていうんだ？[l][r]
[link target="*Part2_OK"  ]【１】そうだ[endlink]／
[link target="*Part2_Edit"]【２】チガウ[endlink]
[s]

; ------------------------------------------------------
*Part2_OK

[cm]

[akn/hap]
なるほどね……。[p][akn/def]
名前と苗字、どっちが好き？[l][r]

[link target="*Part2_Fname"]【１】苗字でーす[endlink]／
[link target="*Part2_Name" ]【２】名前かな…[endlink]
[s]

; ------------------------------------------------------
*Part2_Fname

; 苗字がすき。

; [eval] 変数 f.name_type に数値 0 を入れます。
[eval exp="f.name_type = 0"]
[jump target="*Part2_End"]

; ------------------------------------------------------
*Part2_Name

; 名前がすき。

; [eval] 変数 f.name_type に数値 1 を入れます。
[eval exp="f.name_type = 1"]
[jump target="*Part2_End"]

; ------------------------------------------------------
*Part2_End

[cm]

; [macro]～[endmacro]
; 主人公の名前を [emb] で表示するだけのマクロ [花子] を定義します。
[macro name="花子"]

  ; [if]-[else]-[endif] 変数 f.name_type の中身によって分岐します。
  [if exp="f.name_type == 0"]
    [emb exp="f.player_fname"]
  [else]
    [emb exp="f.player_name"]
  [endif]

[endmacro]

[akn/hap]
そっか。[p]
じゃああなたのこと、私は「[花子]さん」って呼ぼうかな。[p][akn/def]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; ------------------------------------------------------
*Part3_Edit

……ところで。[p]
[花子]さんは、好きな恐竜とかいるの？[p]
……いるでしょ？？　好きな恐竜。[p]
よかったら、教えてよ～。[p]

[layopt layer=message0 visible=false]
[image layer=1 storage=15_input_B.png x=0 y=0]
[edit name="f.like_dragon" left="310" top="300" width="330" height="60" size="40" initial="ティラノサウルス"]
[button graphic="config/arrow_next.png" target="*Part3_Commit" x="660" y="295"]
[s]

; ------------------------------------------------------
*Part3_Commit

[commit]
[cm]
[freeimage layer=1]
[layopt layer=message0 visible=true]
「[emb exp="f.like_dragon"]」が好きなんだ？[p]

; [if]-[elsif]-[elsif]-[else]-[endif]
; f.like_dragon の内容によって分岐します。

[if exp="f.like_dragon == 'ティラノサウルス'"]
  [akn/hap]
  ねー!! やっぱりティラノサウルスだよねーっ!![p]

[elsif exp="f.like_dragon == 'プテラノドン'"]
  [akn/hap]
  プテラノかー!! やっぱり空飛ぶのはカッコイイもんね!![p]

[elsif exp="f.like_dragon == 'プレシオサウルス'"]
  [akn/hap]
  プレシオ!! 代表的な首長竜だね。[p]
  厳密には恐竜じゃなくて爬虫類だけど、カッコ良さでは変わらない!![p]

[else]
  [akn/dok]
  私とはちょっと趣味が違うかも。。。[p]

[endif]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

[akn/def]
…………。[p]
これが、プレイヤーに文字を自由入力してもらう方法です。[p][akn/def]
ではでは～。[p]

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]