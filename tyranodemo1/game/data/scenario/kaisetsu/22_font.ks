; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 22_font.ks ============================================
;
; フォントファイルについての説明を行います。
;
; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

フォントの話をしておこうか。[p][akn/def]

; ★フォントとは、文字のデザインのまとまりのこと。

フォントというのは、文字を表示するためのデザインのまとまりのことで、例を挙げると、[p]
Windowsを使っている人なら「メイリオ」「ＭＳ ゴシック」あたりがなじみ深いでしょう。[p]
さて、ティラノスクリプトではもちろん、文字の表示に使うフォントを指定できるんだけど、[p][akn/dok]

; ★あなたの環境で使えるフォントが、ユーザーの環境でも使えるとは限らない。

フォントを指定する際には注意が必要だよ!![p]
なぜなら、あなたの環境で使えるフォントがプレイヤーの環境で使えるとは限らないから。[p]
たとえば、Windowsでは基本的に「メイリオ」が使えるけど、Macでは使えない……ふつうはね。[p]
なぜ使えないかというと、Macには「メイリオ」がインストールされていないから。[p][akn/def]

; ★プレイヤーの環境で使えないフォントを指定するとどうなるか？

……。[p]
プレイヤーの環境で使えないフォントを指定するとどうなるか、実際に試してみよう。[p]



; [font] 存在しないフォントをfaceパラメータに指定してみます。
[font face="ティラノフォント"]



〔存在しないフォントを指定するとこうなります。〕[p][resetfont]
どうなったかな。[p]
あんまりカッコよくないかも。。。[p]
というわけで、こういう現象に対する対策をいくつか示すわ。[p][akn/hap]

; ★対策１：複数指定する。

ひとつめは、フォントを複数指定する方法。[p][akn/def]
フォントをカンマ区切りで複数指定すると、使用可能なフォントをデバイスが選んでくれるので、[p]
あらゆる環境を網羅しちゃうくらいにフォントをたくさん指定しておけば、[p]
まあ、どれかひとつくらいは使えるのがあるでしょう……という作戦。[p]



; [font] 存在しないフォントをfaceパラメータに指定してみますが、
; 同時にカンマ区切りで存在するフォントも指定してみます。
[font face="ティラノフォント, メイリオ"]



〔実際に複数指定してみると、こうなる。〕[p][resetfont]
どう?　さっきと違うフォントになったかな。[p][akn/hap]

; ★対策２：独自フォントを使う。

ふたつめは、ゲームパッケージにフォントを同梱して、それを指定する方法。[p][akn/def]
このサンプルテクニック集でも使っている方法だね。やり方は……[p]
①フォントファイルをパッケージに入れて、[p]
②CSSファイルでWebフォントの設定をして、[p]
③そのCSSファイルを［loadcss]タグで読み込み、[p]
あとは、④設定したフォント名をコンフィグファイルや［font］タグなどで指定する。[p]
で、オッケー!![p][akn/dok]

; 独自フォントは複数の形式を用意することが望ましい。

……。[p]
この方法をとればプレイヤーの環境によらず同じ見た目のテキストを提供できる……と思いきや、[p]
これにも注意点はあるの。[p][akn/def]
というのも、ひとくちにフォントファイルといってもいろんな形式があってね。[p]

[image layer="1" storage="color/col1.png" x="40" y=" 40" width="160" height="70"]
[image layer="1" storage="color/col2.png" x="40" y="120" width="160" height="70"]
[image layer="1" storage="color/col3.png" x="40" y="200" width="160" height="70"]
[image layer="1" storage="color/col4.png" x="40" y="280" width="160" height="70"]
[image layer="1" storage="color/col5.png" x="40" y="360" width="160" height="70"]
[ptext layer="1" x=" 40" y=" 40" width="160" align="center" color="white" size="50" edge="black" text="TTF"]
[ptext layer="1" x=" 40" y="120" width="160" align="center" color="white" size="50" edge="black" text="OTF"]
[ptext layer="1" x=" 40" y="200" width="160" align="center" color="white" size="50" edge="black" text="EOT"]
[ptext layer="1" x=" 40" y="280" width="160" align="center" color="white" size="50" edge="black" text="WOFF"]
[ptext layer="1" x=" 40" y="360" width="160" align="center" color="white" size="50" edge="black" text="SVG"]

ざっと挙げると、これだけある。[p]
ちなみに、それぞれなんの略かというと、[p]

[image layer="2" storage="color/col1.png" x="240" y=" 40" width="660" height="70"]
[image layer="2" storage="color/col2.png" x="240" y="120" width="660" height="70"]
[image layer="2" storage="color/col3.png" x="240" y="200" width="660" height="70"]
[image layer="2" storage="color/col4.png" x="240" y="280" width="660" height="70"]
[image layer="2" storage="color/col5.png" x="240" y="360" width="660" height="70"]
[ptext layer="2" x="260" y=" 40"  color="white" size="50" edge="black" text="True&ensp;Type&ensp;Font"]
[ptext layer="2" x="260" y="120"  color="white" size="50" edge="black" text="Open&ensp;Type&ensp;Font"]
[ptext layer="2" x="260" y="200"  color="white" size="50" edge="black" text="Embedded&ensp;Open&ensp;Type"]
[ptext layer="2" x="260" y="280"  color="white" size="50" edge="black" text="Web&ensp;Open&ensp;Font&ensp;Format"]
[ptext layer="2" x="260" y="360"  color="white" size="50" edge="black" text="Scalable&ensp;Vector&ensp;Graphics"]

こんな感じです。[p]
……もちろん、覚える必要はまったくないから、安心してね。[p]

[freeimage layer="2" time="1000"][akn/sad]

で、プレイヤーの環境によっては特定の形式が使えない、ということがある。[p]
化石みたいな古ーいブラウザでは、「EOT」形式しか使えなかったりね。[p][akn/def]
これを解決するためには、やっぱり複数指定作戦しかなくて……。[p]
いろんな形式のフォントファイルを用意して、複数指定しておくのがいいかな。[p]
詳しい話を知りたい人は、「Webフォント」とかでググってみよう!![p]

; たとえば、次のようなWebサイトが参考になる。
; ･CSS3のWebフォントを使ってみよう
; https://thinkit.co.jp/story/2011/08/18/2233

ある形式のフォントファイルを別の形式に変換（コンバート）するWebサービスもあるよ。[p]

[freeimage layer="1" time="1000"]

以上、フォントのお話でした～。[p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]



★余談：フォント名に空白が含まれるフォントを指定する。

ティラノスクリプトでは、タグのパラメータに空白を含めることができません。
含めることができない、というか、含めても最終的に解釈される際に空白がカットされてしまいます。
そのため、「ＭＳ ゴシック」のように名称に空白の含まれるフォントを指定しようとすると、うまくいきません。
その場合、次のように[iscript]で変数を介すとよいです。

[iscript]
tf.face = 'ＭＳ ゴシック, メイリオ, 游ゴシック'
[endscript]
[font face="& tf.face"]