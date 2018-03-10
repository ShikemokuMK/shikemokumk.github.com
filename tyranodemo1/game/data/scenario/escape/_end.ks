
; == _end.ks ===============================================

; 部屋左手。

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]

;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/left.png]
[image layer=0 page=back x=0 y=0 storage=escape/left_box.png name=layerbox cond="f.develops['escape/left.ks'] == 0"]
[chara_show    page=back name=master left=170 time=0]
[trans layer=0 time=400 method=fadeIn]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 ドア           x=55  y=255 width=114 height=381 target=*Pos_1]
[mc 2 ゲームマスター x=189 y=6   width=454 height=631 target=*Pos_2]
[return]

;-------------------------------------------------------
*Pos_1
[sm]
[chara_mod name=master face=ase]
#master
いやいや!!  無視しないでくれたまえ!![l][er]
#
[hm]
[scm][s]

;-------------------------------------------------------
*Pos_2
; 手榴弾を選択中ではない
[if exp="f.select_item != 'bomb'"]
  [chara_mod name=master face=happy]
  [sm]
  #master
  ゲームクリアおめでとう。[l][er]
  キミは私が見込んだとおりの頭脳の持ち主だね。[l][er]
  よし、ここから出してあげよう……。[l][er]
  #
  NORMAL END[l][er]
  [hm]
  [jump target=*End]
; 手榴弾を選択中
[else]
  [chara_mod name=master face=happy]
  [sm]
  #master
  ゲームクリアおめ――[l][er]
  #master:ase
  !!????　な、なぜそれを持っているのだ!!!![l][er]
  それはもう使っているはず……!![l][er]
  待て、待ちたまえっ……!!![l][er]
  [use item=bomb]
  #
  手榴弾のピンを抜いた。[l][er]
  [freeimage layer=0 time=1000]
  #master
  うおおおぉぁぁああああ!!!![l][er]
  #
  ANOTHER END[l][er]
  [hm]
  [jump target=*End]
[endif]
[scm][s]

;-------------------------------------------------------
*End
[mask time=500]
[wait time=500]
[destroy]
[mask_off time=0]
[mtext  layer=0 x=0 y=260 text=Thank&ensp;you&ensp;for&ensp;playing! width=960 align=center size=60 color=white in_effect=bounce]
; textパラメータ中に「&ensp;」とあるが、これは半角スペースの意。この部分が全角スペースに変換される。
[wait time=500]
[jump storage=select.ks]