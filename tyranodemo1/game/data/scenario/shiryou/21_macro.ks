; [reset_all] 独自マクロ。ゲーム画面をすべてリセットして、ゲーム起動時の状態に戻します。(詳細は「macro.ks」をご参照ください)
[reset_all]

サブルーチンとマクロの資料集。[p]






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～サブルーチンを呼ぶ～[p]


[call target=*Sub_1]
[call target=*Sub_1]
[call target=*Sub_1]
[er]
[jump target=*Next]


*Sub_1
ここはサブルーチン用のラベル「*Sub_1」です。[l][r]
[return]


*Next






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～マクロを使う～[p]


[macro name=my_p]
  [l]
  [er]
[endmacro]


マクロ「my_p」を使ってみる。[my_p]






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～マクロにパラメータを渡す～[my_p]


[macro name=strong]
  [font edge=%iro]
[endmacro]


[strong iro=0x999900]マクロ「strong」にパラメータ「iro=0x999900」を渡してみる。[my_p]






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～マクロにパラメータを渡す＋デフォルト値を設定する～[my_p]


[macro name=strong]
  [font edge=%iro|0x0000FF]
[endmacro]


[strong iro=0x999900]マクロ「strong」にパラメータ「iro=0x999900」を渡してみる。[l][r]
[strong             ]マクロ「strong」にパラメータを渡さなかったときはこうなる。[my_p]






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～マクロに渡されたパラメータを内部のタグに全渡しする～[my_p]


[macro name=strong]
  [font * ]
[endmacro]


[strong size=50 bold=bold edge=0x999900]マクロ「strong」に渡されたパラメータをマクロ内部のタグ「font」に全渡しする。[my_p]






; ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ===

～マクロに渡されたパラメータを内部のタグに全渡しする＋一部を上書きする～[my_p]


[macro name=strong]
  [font * color=0xFFFFFF edge=0x999900]
[endmacro]


[strong size=25 color=0x000000 edge=0x0000FF]マクロ「strong」に渡されたパラメータをマクロ内部のタグ「font」に全渡しするが、「color」パラメータと「edge」パラメータは上書きを受ける。[my_p]









[jump storage="select.ks"]