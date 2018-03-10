; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 21_macro.ks ===========================================
;
; サブルーチンとマクロについての説明を行います。
;
; ★登場する主なタグ。
; [call]     … 特定のシナリオファイル・ラベルにジャンプします。[return]で元の場所に戻ります。
; [return]   … [call]が発動した位置に戻ります。
; [macro]    … マクロの定義を始めます。
; [endmacro] … マクロの定義を終わります。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

サブルーチンとマクロの話をしよう。[p]
この節は、実際にシナリオファイルを開いて見てほしいな。[p]
場所は「data/scenario/kaisetsu/21_macro.ks」だよ。[p]
……。[p]
サブルーチンとマクロはどちらも「複雑な処理を簡潔に記述するための機能」です。[p]
もう少し詳しく言うと……。[p]
「一連の複雑な処理に名前をつけておいて、その一連の処理を名前だけで使えるようにする機能」[p]
……です。[p][akn/dok]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

…………。[p]
要領を得ないと思うので、具体例を出そう。[p][akn/def]
仮に、次のようなエフェクトを出すスクリプトを書いたとする。[p]



; [image][anim][wa][free] 画像OBJ出す→アニメ→アニメ待機→消す。
[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
[wa]
[free  name=macro_effect layer=0]



これは［image］［anim］［wa］［free］という一連のスクリプトでできているエフェクトだよ。[p]
さて、



[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
[wa]
[free  name=macro_effect layer=0]



このエフェクトを出したい部分にいちいち



[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
[wa]
[free  name=macro_effect layer=0]



スクリプトをコピペしてもいいんだけど……。[p][akn/dok]
見るからに冗長でしょ？……やってることは全部同じなのに。[p][akn/hap]
こういうときに活用できるのが、サブルーチンやマクロ。[p][akn/def]
たとえばサブルーチンなら、シナリオの下のほうあるいは別のシナリオファイルに、[p]
一連の処理を書いておく。[l]そのとき、ラベルと［return］タグを忘れないこと。[p]
あとは、その一連の処理を呼び出したいところに［call］タグを置けば、



; [call] サブルーチン用のラベル「*Sub_Effect」にジャンプ。[return]で帰ってきます。
[call target=*Sub_Effect]



[er]このように、一発でエフェクトが出せる。[p]
マクロの場合は［macro］～［endmacro］タグで一連の処理を定義してから、[p]



; [macro]～[endmacro] 独自マクロ[eff]を定義します。
[macro name=eff]
  [image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
  [anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
  [wa]
  [free  name=macro_effect layer=0]
[endmacro]



そのとき付けた名前をタグのように書けば、



; [eff] 上で定義した独自マクロ。
[eff]



[er]同じように、一発でエフェクトが出せる。[p]
……ね。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

さて、サブルーチンやマクロを使ったとき、エンジン内部では何が起こってるのかを説明しよう。[p]
[image layer=1 storage=21_macro_A.png x=0 y=0 time=600]
まず、こういうシナリオがある。[p]
[image layer=1 storage=21_macro_B.png x=0 y=0 time=600]
一方で、シナリオのすごーく下のほうにサブルーチン用のシナリオもある。[p]
さて。[p]
[image layer=1 storage=21_macro_D.png x=0 y=0 time=600]
このとき、スクリプトは矢印で示したように上から順々に読まれていくよね。[p]
そして、［call］タグにぶちあたる……。[p]
[image layer=1 storage=21_macro_C.png x=0 y=0 time=600 name=STACK]
［call］タグにぶちあたると、そこに、帰還用の目印となる「旗」が立つのだ。[p]
……旗というのはあくまで比喩表現だけどね。[p]
ちなみにこの旗のことを「スタック」という。[p]
[image layer=1 storage=21_macro_E.png x=0 y=0 time=600]
さて、旗を立てたら、スクリプトはサブルーチンラベルにジャンプする。[p]
[image layer=1 storage=21_macro_F.png x=0 y=0 time=600]
そこでふつうに下に向かってスクリプトが進行していき……。[p]
[image layer=1 storage=21_macro_G.png x=0 y=0 time=600]
［return］タグを踏んだら、立てておいた「旗」のところに戻っくる。[p]
[free layer=1 name=STACK time=600]
そして、要らなくなった「旗」は捨てちゃう。[p]
[image layer=1 storage=21_macro_H.png x=0 y=0 time=600]
そしたら、また下に向かって進む。[p]
……ということが、エンジン内部では起こっています。[p]
[freeimage layer=1 time=1000][akn/hap]
いまのはサブルーチンの話ですが、マクロのときも全く同じね。[p]
マクロで定義したタグにぶちあたると、そこに旗を立ててから［macro］のところにジャンプ。[p]
そしてそこで［endmacro］を踏んだら旗のところに戻ってくる。旗を捨てて、また下に進む。[p]
そういうことが起こっています。[p][akn/def]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

さて、お互いに似たような機能を持つ、マクロとサブルーチンですが……。[p][akn/ang]
機能的にはサブルーチンのほうがシンプルです。[p]
サブルーチンは本当に「行って帰ってくる」以上の機能はないの。[p]
だから説明することもこれ以上ないんだけど……[akn/def]その一方でマクロは高機能でね。[p]
マクロにパラメータを渡して、そのパラメータをマクロ内で使う、なんてことができたりする。[p]
ただしマクロはサブルーチンと違って、使う前に定義しておく必要があるので、注意してね。[p]

マクロにパラメータを渡す例を見せよう!![p]
time=%timeに着目してね。[p]
こうすると、マクロ［eff2］に渡したtimeパラメータを［anim］に流用できるわけ。[p]
いくよ。[l]



[macro name=eff2]
  [image               name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
  ; [anim] このタグの time=%time に着目しよう。このように書くと、
  ; マクロ [eff2] が [eff2 time=555] のように呼び出されたとき、555がそのまま [anim] に渡るようになります。
  [anim  time=%time    name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
  [wa]
  [free                name=macro_effect layer=0]
[endmacro]



[eff2 time=250]
[eff2 time=500]
[eff2 time=1000]
[eff2 time=2000]



[er]……このとおり。[p]
time属性を指定できるようにしたうえで、さらに「time属性が指定されなかったときの値」……[p]
いわゆる「デフォルト値」を設定することもできる。[p]



[macro name=eff3]
  [image                    name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
  [anim  time=%time|1500    name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
  [wa]
  [free                     name=macro_effect layer=0]
[endmacro]



[eff3 time=500]
[eff3]
[eff3 time=500]
[eff3]



time属性が指定されかったら1500ミリ秒待つ、というのが伝わるかな？[p]
また、これは高度なテクニックだけど……。[p]
マクロに渡されたパラメータに、JavaScript式でアクセスすることもできる。[p]
たとえば……マクロに渡されたtimeパラメータにアクセスするには、「mp.time」とすればいい。[p]
これと「&」記号を使えば、



[macro name=eff4]
  [image                    name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
  ; [anim] time=&mp.time のように書くと、time=%time と書いた場合と全く同じ挙動になります。
  [anim  time=&mp.time      name=macro_effect left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
  [wa]
  [free                     name=macro_effect layer=0]
[endmacro]



[eff4 time=250]
[eff4 time=500]
[eff4 time=1000]
[eff4 time=2000]



このように、やはりマクロにパラメータを渡せるようにできる。[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

……。[p]
いま見てもらったとおり、サブルーチンやマクロを使えば、記述がとても簡潔になる。[p][akn/hap]
何より、仕様変更に対応しやすい。[p][akn/def]



; [macro]～[endmacro] 独自マクロ [strong] を定義します。
[macro name=strong]
  [font edge=blue]
[endmacro]



たとえば、文字を強調するために［strong］マクロを定義したとしよう。[p]
[strong]このマクロを使うと、文字がこのように青色の縁取りで強調される。[p][akn/ang]
[resetfont]しかしあるとき、あなたは気まぐれに「やっぱり黄色にしよう」と思うかもしれない。[p][akn/dok]
そのとき、もしマクロを使わずに直に［font］タグで強調していると、修正が大変!![p]
シナリオファイルに散らばっている［font］タグを総ざらいしていかなきゃいけないでしょ。[p][akn/def]
でも［strong］マクロを使っていれば、修正するのは［strong］マクロの定義内容だけで済むの。[p]
定義内容を変えれば、［strong］マクロを使っているところが全部変わるからね。[p][akn/hap]

サブルーチンとマクロにはいろんな利点があるので、ぜひ積極的に使ってみてー!![p]



;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]



;-------------------------------------------------------
*Sub_Effect

[image name=macro_effect layer=0 left=430 top=270 width=100 height=100 storage=color/white.png]
[anim  name=macro_effect time=1000 left="-=100" top="-=100" width="+=200" height="+=200" opacity=0]
[wa]
[free  name=macro_effect layer=0]

[return]