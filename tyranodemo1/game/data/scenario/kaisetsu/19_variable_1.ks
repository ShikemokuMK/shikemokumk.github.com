; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 19_variable_1.ks ======================================
;
; 変数についての知識を身に着けます。
;
; ★登場する主なタグ。
; [iscript] … このタグから[endscript]までの間の記述をJavaScriptとして実行します。
; [eval] … expパラメータの内容をJavaScriptとして実行します。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

; ●
; ●変数を使えばフラグや好感度による分岐を実現できる。
; ●

ちょっとだけレベルアップしたテクニックとして「変数」を紹介しよう!![p][akn/hap]
変数が使えれば、複雑な機能を実装できるようになるわ。[p]
たとえば「好感度やフラグによるシナリオ分岐」をしたり、[p]
「プレイヤーに入力してもらった文字を主人公の名前として表示」したり、[p]
そういうことができるようになる。[p]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; ●
; ●変数とは「何かを入れておく箱」のことだ。
; ●

[chara_move name=akane left="+=200"][akn/def]

……変数を使うためには、変数とは何かを知っておく必要があるね。[p]

[image layer=1 storage=19_variable_A.png x=100 y=190 zindex=10 name=boxF time=1000 wait=false]
[image layer=1 storage=19_variable_B.png x=100 y=190 zindex=20 name=boxF time=1000]

変数というのは、「何かを入れておく箱」です。[p]
たとえば好感度、たとえば主人公の名前……そういうのをしまっておく箱のこと。[p][akn/hap]
まずここをおさえよう!!　変数イコール箱なのだ。[p][akn/def]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; ●
; ●変数にモノを入れるには「JavaScript」を使う。「JavaScript」を使うには［eval］または［iscript］を使う。
; ●

そして変数にモノを入れる操作は「JavaScript」の文によって行うよ。[p]
JavaScriptというのは、ティラノスクリプトを動かしている大元のプログラムのことだ。[p]
そのJavaScriptを実行するタグが［eval］［iscript］の二つ。[p]
さっそく変数に物を入れてみよう。[p]



; [iscript]～[endscript] 変数 f.xxx に数値 100 を入れます。
[iscript]
f.xxx = 100
[endscript]



[image layer=1 storage=19_variable_G.png x=480 y=320 time=1000 name=javascript]

いま「f.xxx = 100」というJavaScript文を実行したよ。[p]

[image layer=1 storage=19_variable_C.png x=100 y=190 zindex=30 name=boxF time=1000]
[image layer=1 storage=19_variable_F.png x=100 y=0 zindex=15 name=boxF,itemF time=1000]
[anim name=itemF time=1000 top=190][wa]

……これによって「f.xxx」という名前の変数に「100」が入ることになる。[p][wa]
JavaScriptの「□=●」という文は、「□に●を入れてください」という意味になるのだ。[p]
けっして「□と●は等しい」という意味ではないので、よくよく注意してね。[p][akn/dok]

[free layer=1 name=javascript time=1000]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; ●
; ●変数に入っているモノをメッセージとして取り出すには［emb］タグを使う。
; ●

次に、変数の中身を確認してみよう。[p][akn/def]
変数の中身をメッセージとして取り出すタグが［emb］タグ。[p]
使ってみるよ？[p][anim name=itemF time=1000 top=0]
変数「f.xxx」の中身は……「



; [emb] 変数 f.xxx の中身をメッセージとして取り出します。
[emb exp=f.xxx]



」です。[p][wa][akn/hap]
さっき100を入れたんだから、入ってるのは当然100だね。[p][akn/def][freeimage layer=1 time=1000]
……。[p]
これで「変数に物を入れる方法」「それをメッセージとして取り出す方法」がわかりました。[p]
だがしかし!!　これだけでは変数を使いこなすことはできない!![p]
変数を使いこなすためには、もうちょっと知識を増やしておいてほしいな。[p]



;-----------------------------------------------------------
*Part3_Select
;-----------------------------------------------------------

[glink target="*Hensu_Shurui"  text="「変数の種類」について聞く  " x="50" y=" 50"]
[glink target="*Nakami_Shurui" text="「中身の種類」について聞く  " x="50" y="150"]
[glink target="*Enzan"         text="「数値の演算」について聞く  " x="50" y="250"]
[glink target="*Hikaku"        text="「比較と条件」について聞く  " x="50" y="350"]
[glink target="*Entity"        text="「エンティティ」について聞く" x="50" y="450"]
[glink target="*End"           text="終わる"                       x="190" y="550"]
[s]



;-----------------------------------------------------------
*Hensu_Shurui
;-----------------------------------------------------------

[image layer=1 storage=19_variable_A.png x=100 y=190 zindex=10 name=boxF time=1000 wait=false]
[image layer=1 storage=19_variable_B.png x=100 y=190 zindex=20 name=boxF time=1000 wait=false]
[image layer=1 storage=19_variable_C.png x=100 y=190 zindex=20 name=boxF time=1000]

さっきの例では「f.xxx」という名前の箱――変数を使いました。[p]
この「エフ・ドット・エックス・エックス・エックス」ってなんやねん!!　という話ですが、[p]
後ろの「xxx」は自分の好きなようにつけられる名前で、[p]
その前の「f.」は「変数の種類」を表しているよ。[p]

[image layer=1 storage=19_variable_D.png x=000 y=0 zindex=20 name=boxSF time=1000]
[image layer=1 storage=19_variable_E.png x=270 y=0 zindex=20 name=boxTF time=1000]

変数の種類は全部で3種類あるの。[p]
「sf.」が「システム変数」、「f.」が「ゲーム変数」、「tf.」が「一時変数」。[p]

[anim name=boxF  opacity=064 time=600]
[anim name=boxSF opacity=255 time=600]
[anim name=boxTF opacity=064 time=600]
[wa]

「システム変数」というのは、そのゲーム全体でただ一つしか存在しない変数。[p]
どのセーブデータでも共通・共有の値となるもので、たとえばコンフィグ設定なんかが該当する。[p]

[anim name=boxF  opacity=255 time=600]
[anim name=boxSF opacity=064 time=600]
[anim name=boxTF opacity=064 time=600]
[wa]

「ゲーム変数」はセーブデータ毎に別個に存在する変数で、ふつうはこれを使えばよいです。[p]

[anim name=boxF  opacity=064 time=600]
[anim name=boxSF opacity=064 time=600]
[anim name=boxTF opacity=255 time=600]
[wa]

「一時変数」は一時的に使うためだけの変数。[p]
本当に一時的にしか保存されないので、クリックをまたいで使うのはやめたほうがよいでしょう。[p]

[freeimage layer=1 time=1000]

ちなみに変数の名前……さっき「xxx」とした部分は、基本的には好きにつけられるけれど、[p]
いくつかルールがあります。[p]

ルール①．変数の名前に使えるのは「半角英数字」「全角文字」「_」（アンダーバー）。[p]
……ただし全角文字については動作しない環境もありうるので、推奨は半角英数＋アンダーバー。[p]
正しい例としては、「f.akane_love」「f.playerName」「f.lucky7」など。[p]

ルール②．アンダーバー以外の「半角記号」や「空白」を使うのはダメ。[p]
……たとえば「f.x/y」「f.x y」などは使えない。[p]

ルール③．先頭に数字をもってくるのはダメ。[p]
……たとえば「f.2xx」はダメ。[p]
まとめると、こうだ。[p]

[image layer=1 storage=color/white.png x=0 y=130 width=960 height=250 name=bg]
[anim  name=bg opacity=100 time=0]
[ptext layer=1 color=black edge=white text=使える…半角英数/全角文字/アンダーバー x=30 y=160 size=40]
[ptext layer=1 color=black edge=white text=使えない…アンダーバー以外の半角記号/空白 x=30 y=230 size=40]
[ptext layer=1 color=black edge=white text=例外…数字で始まる名前はダメ x=30 y=300 size=40]

じゃん。[p]
……以上、変数の種類と名前のルールについて説明したよ。[p]

[freeimage layer=1 time=1000]
[jump target="*Part3_Select"]



;-----------------------------------------------------------
*Nakami_Shurui
;-----------------------------------------------------------

変数にはいろいろな中身……モノを入れることができます。[p]

[image layer=1 storage=19_variable_F.png x=50 y=-80 time=600 name=typeA]

さっきは「f.xxx」という名前の変数に「100」を入れたよね？[p]

[ptext layer=1 color=black edge=white text=数値   x=340 y=060 size=50 name=typeA]

「100」はいわゆる「数値」という種類のモノなんだ。[p]
……。[p]
そりゃそうか。[p]
でも、モノには「数値」以外にもいろんな種類があって……。[p]

[image layer=1 storage=19_variable_H.png x=50 y=070 time=600 wait=false name=typeB]
[ptext layer=1 color=black edge=white text=文字列 x=340 y=210 size=50 time=600 name=typeB]

[image layer=1 storage=19_variable_I.png x=50 y=220 time=600 wait=false name=typeC]
[ptext layer=1 color=black edge=white text=真偽   x=340 y=360 size=50 time=600 name=typeC]

よく使うものだと「文字列」「真偽」がある。[p]
……他にも「配列」とか「オブジェクト」とかがあるけど、そっちはレベルが高い。[p]
基本的には「数値」「文字列」「真偽」の三つをおさえておけばいいのかな、と思うよ。[p]

[anim name=typeA opacity=255 time=600]
[anim name=typeB opacity=064 time=600]
[anim name=typeC opacity=064 time=600]
[wa]

好感度のように「増えたり減ったりするモノ」は「数値」で管理するといいでしょう。[p]
「0」「999」「-100」「3.14」などは全部数値です。[p]

[anim name=typeA opacity=064 time=600]
[anim name=typeB opacity=255 time=600]
[anim name=typeC opacity=064 time=600]
[wa]

「主人公の名前」などは「文字列」で管理するといいでしょう。[p]
JavaScriptにおいて文字列を扱うときは、対象を「'」で囲む必要があります。[p]
「'」はシングルクォーテーションという半角記号ね。[p]
たとえば変数「f.xxx」に「太郎」という文字列を入れたいときは、こう書く。[p]
f.xxx = '太郎'[p]

[anim name=typeA opacity=064 time=600]
[anim name=typeB opacity=064 time=600]
[anim name=typeC opacity=255 time=600]
[wa]

最後に……。[p]
フラグが立っているかどうか、といった「二通りしかないもの」は「真偽」で管理しよう。[p]
「真」は英語で「true」、「偽」は英語で「false」。[p]
というわけで、変数「f.xxx」に「真」を入れたいときは「f.xxx = true」。[p]
変数「f.xxx」に「偽」を入れたいときは、「f.xxx = false」と書きます。[p]

[anim name=typeA opacity=255 time=600]
[anim name=typeB opacity=255 time=600]
[anim name=typeC opacity=255 time=600]
[wa]

……。[p]
変数はこの3種類で管理すると、ゲーム開発がしやすくなると思います。[p]

[freeimage layer=1 time=1000]
[jump target="*Part3_Select"]



;-----------------------------------------------------------
*Enzan
;-----------------------------------------------------------

変数を足したり引いたりするには、演算という機能を使おう。[p]
たとえば「f.xxxの中身の数値を10増やしたい」というときには、こう書く。[p]

[image layer=1 storage=19_variable_J.png x=190 y=260 time=600 name=typeA]

f.xxx = f.xxx + 10[p]

……。[p]
さあ、もー、わけわかんないかもしれないね。[p]

[image layer=1 storage=19_variable_K.png x=190 y=260 time=600 name=typeA]

まず、イコールの右側を見よう。[p]
「f.xxx + 10」という式があるね。[p]
いま、f.xxxの中身は100だから……[l]

[image layer=1 storage=19_variable_L.png x=190 y=260 time=600 name=typeA]

「f.xxx + 10」の計算結果は「110」だ。[p]

[image layer=1 storage=19_variable_M.png x=190 y=260 time=600 name=typeA]

そして左側を思い出すと、「f.xxx = 110」という形になっているでしょ。[p]
だから「f.xxx」には「110」が入ることになる。[p]
……結局、「f.xxx」の中身は「100→110」と変化したわけだ!![p]

……。[p]
…………。[p]
まあ、理屈がわからなくても、使えればいいのだ。[p]

[image layer=1 storage=19_variable_J.png x=190 y=260 time=600 name=typeA]

ちなみに、「f.xxx = f.xxx + 10」という文は、別の書き方をすることもできる。[p]

[anim name=typeA top=150 time=600]
[image layer=1 storage=19_variable_N.png x=190 y=300 time=600 name=typeB wait=false]

f.xxx += 10[wa][p]

これは「+=」という特別な記号を使った書き方。[p]
この二つは全く同じ意味で、どちらもf.xxxの中身を10増やすことができる。[p]
……「+=」のほうがわかりやすいかな？[p]
でも、あくまで基本は「f.xxx = f.xxx + 10」です。[p]
どっちも覚えておくのがベストかな。[p]

[freeimage layer=1 time=1000]

「足し算」は「+」という記号によって行うことができますが、他にもいろんな計算ができます。[p]

[image layer=1 storage=19_variable_O.png x=50 y=30 time=600 name=typeB wait=false]

「ひき算」が「-」、「かけ算」が「*」、「わり算」が「/」、「あまり算」が「%」、です。[p]
「あまり算」というのはあまりを求める計算で、たとえば「10%3」は「10を3で割ったあまり」。[p]
……つまり、1だ。[p]
「べき乗」は「**」で、たとえば「f.xxxの3乗」は「f.xxx ** 3」で計算できるの。[p]
また「+=」と同様に、どの計算も「-=」「*=」「/=」「%=」「**=」という記法が使えるよ。[p]

[freeimage layer=1 time=1000]

……。[p]
ちなみに、先に計算してほしいところは、普通の算数と同じように「()」でくくればいいからね。[p]
以上、数値の演算についてでした。[p]

[jump target="*Part3_Select"]



;-----------------------------------------------------------
*Hikaku
;-----------------------------------------------------------

変数の中身について、いろんな条件をチェックしたい場面があるでしょ。[p]
――≪彼の好感度は100以上か？≫[p]
――≪料理スキルは50以上か？≫[p]
――≪フラグは立っているか？≫[p]
――≪入力したパスワードは正しいか？≫[p]
そういった条件が成立しているかどうかを調べるには、「比較」を行います。[p]
比較を行うことで、条件が成立しているかいないか、という「真偽」を得ることができるの。[p]
成立していれば真（true）、成立していなければ偽（false）。二つに一つね。[p]
比較を行う式は、次のとおり。[p]

[image layer=1 storage=19_variable_P.png x=50 y=30 time=600 name=typeB wait=false]

たとえば「f.xxxが3より大きい」という条件を調べるには、「f.xxx > 3」と書けばいい。[p]
「f.yyyが10ではない」という条件を調べるには、「f.yyy != 10」と書けばいい。[p]
……などなど。[p]
複数の条件を「かつ」や「または」でつなぐこともできる。[p]

[freeimage layer=1 time=1000]
[image layer=1 storage=19_variable_Q.png x=50 y=50 time=600 name=typeB wait=false]

「①かつ②」というのは「①と②のどちらも真」という意味で、[p]
「①または②」というのは「①と②の少なくともどちらかは真」という意味だ。[p]
「f.xxxが3より大きい、かつ、f.yyyが10ではない」を調べるにはどう書けばいいか？[p]
「f.xxx > 3 && f.yyy != 10」と書けばいいのだ。[p]

[freeimage layer=1 time=1000]
[jump target="*Part3_Select"]



;-----------------------------------------------------------
*Entity
;-----------------------------------------------------------

変数の中身は、メッセージとして取り出すだけが使い道じゃない!![p]
変数を「タグのパラメータ」として利用することもできるよ。[p]
この機能を「エンティティ」というの。[p]
[image layer=1 storage=19_variable_R.png x=50 y=250 time=600 name=typeB wait=false]
パラメータを指定するときに、先頭に「&」をつけて、そのあとに「変数の名前」を書く。[p]
こうすることで、「変数の中身」がパラメータとして渡されることになる。[p]
実際にやってみよう。[p]
いま、変数f.xxxには100が入っているね。[p]
これを、［bg］タグのtimeパラメータに使ってみる。[p]



; [bg] time="&f.xxx"に 着目しよう。
[bg storage="rouka.jpg" time="&f.xxx"]



どうかな。[p]
100ミリ秒だから一瞬だね。[p]
パラメータを渡すときに、ついでに演算をすることもできる。[p]
[image layer=1 storage=19_variable_S.png x=50 y=250 time=600 name=typeB wait=false]
たとえば「f.xxxの数値に1000足した値をパラメータとして渡す」ということができる。[p]



; [bg] time="&f.xxx + 1000" に着目しよう。
[bg storage="room.jpg" time="&f.xxx + 1000"]



……こんなふうに。[p]
種明かしをすると、パラメータの先頭に「&」を付けた場合、ティラノスクリプトは――[p]
そのあとに続く文字をJavaScriptの文として判断するようにできてるんだ。[p]
ちょっと凝ったことをやりたい人は覚えておきましょう!![p]
[freeimage layer=1 time=1000]
[jump target="*Part3_Select"]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]