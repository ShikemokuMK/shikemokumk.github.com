; [reset_all] 独自マクロ。ゲーム画面をすべてリセットして、ゲーム起動時の状態に戻します。(詳細は「macro.ks」をご参照ください)
[reset_all]

変数の資料集。[p]





; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
～いろんなモノを変数に入れて取り出してみる～[p]
; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

●「数値」「文字列」「真偽」を入れてみる。[r][r]

[iscript]
f.xxx = 100
f.aaa = 'あかね'
f.bbb = true
f.ccc = false
[endscript]

……入れた。[p]
●中身をメッセージとして取り出す。[r][r]
……f.xxx、f.aaa、f.bbb、f.cccの中身は、[r]

[emb exp=f.xxx]、
[emb exp=f.aaa]、
[emb exp=f.bbb]、
[emb exp=f.ccc][p]






; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
～数値の演算をしてみる～[p]
; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●10を足す。[r][r]

[iscript]
f.xxx = f.xxx + 10
[endscript]

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●別の書き方で10を足す。[r][r]

[iscript]
f.xxx += 10
[endscript]

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●2倍する。[r][r]

[iscript]
f.xxx *= 2
[endscript]

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●2×11÷7を計算して、入れる。[r][r]

[iscript]
f.xxx = 2 * 11 / 7
[endscript]

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●5＋5を3で割った余りを計算して、入れる。[r][r]

[iscript]
f.xxx = (5 + 5) % 3
[endscript]

……いま、f.xxxの中身は[emb exp=f.xxx]。[p]
●変数「f.yyy」に「100」を入れて、[r]「f.yyy」と「f.xxx」を足し合わせ、[r]その結果を変数「f.zzz」に入れる。[r][r]

[iscript]
f.yyy = 100
f.zzz = f.xxx + f.yyy
[endscript]

……いま、f.zzzの中身は[emb exp=f.zzz]。[p]






; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
～いろんな演算をしてみる～[p]
; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

●数値の「1」と数値の「1」を足す。[r][r]

[iscript]
f.xxx = 1 + 1
[endscript]

……結果は[emb exp=f.xxx]。[p]
●文字列の「1」と文字列の「1」を足す。[r][r]

[iscript]
f.xxx = '1' + '1'
[endscript]

……結果は[emb exp=f.xxx]。[p]
●文字列の「1」と数値の「1」を足す。[r][r]

[iscript]
f.xxx = '1' + 1
[endscript]

……結果は[emb exp=f.xxx]。[l][r]
つまり、文字列と数値を足すと、文字列のルールが優先される。[p]






; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
～変数をタグのパラメータとして取り出す～[p]
; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

●いま、f.zzzの中身は[emb exp=f.zzz]。これを［image］タグの幅と高さのパラメータに使ってみる。[r][r]

[layopt layer=0 visible=true]
[image width=&f.zzz        height=&f.zzz          storage=color/red.png left=0 top=0 layer=0]

……幅と高さが[emb exp=f.zzz]ピクセルの画像が出た。[p]
●単にパラメータとして取り出すだけでなく、ついでに計算もしてみる。f.zzzを3倍した数を幅と高さに指定する。[r][r]

[image width="& f.zzz * 3" height="& f.zzz * 3"   storage=color/red.png left=0 top=0 layer=0]

……幅と高さが[emb exp=f.zzz*3]ピクセルの画像が出た。[p]

[freeimage layer=0]





; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
～変数を比較する～[p]
; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

●変数を比較して、真偽を取り出してみる。[r][r]

[iscript]
f.x = 100
f.y = 'あかね'
f.z = false

f.a = (f.x >  100)
f.b = (f.x <= 100)
f.c = (f.y == 'あかね')
f.d = (f.y != 'やまと' && f.z)
f.e = (f.y != 'やまと' || f.z)
[endscript]

f.xは100より大きいか……[emb exp=f.a]。[r]
f.xは100以下か……[emb exp=f.b]。[r]
f.yは「あかね」に等しいか……[emb exp=f.c]。[p]
f.yは「やまと」ではない、かつ、f.zは真か……[emb exp=f.d]。[r]
f.yは「やまと」ではない、または、f.zは真か……[emb exp=f.e]。[p]

●変数を比較して、シナリオを分岐してみる。（［jump］タグ＋condパラメータを利用する場合）[r][r]

[jump target=*Happy  cond="f.x >= 100 && f.z"]
[jump target=*Good   cond="f.x >= 100"       ]
[jump target=*Normal cond="f.x >=   0"       ]
[jump target=*Bad                            ]

*Happy

……おめでとう、ハッピーエンドです。[p][jump target=*Next]

*Good

……グッドエンドです。[p][jump target=*Next]

*Normal

……ノーマルエンドです。[p][jump target=*Next]

*Bad

……むむむ、バッドエンドです。[p][jump target=*Next]

*Next

●変数を比較して、シナリオを分岐してみる。（［if］タグを利用する場合）[r][r]

[if    exp="f.x >= 100 && f.z"]……おめでとう、ハッピーエンドです。[p]
[elsif exp="f.x >=  50"       ]……グッドエンドです。[p]
[elsif exp="f.x >=   0"       ]……ノーマルエンドです。[p]
[else                         ]……むむむ、バッドエンドです。[p]
[endif]






[jump storage="select.ks"]