
; == room.ks ===============================================

; 小部屋。

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]



;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/room.png]
[image layer=0 page=back x=0 y=0 storage=escape/room_bomb.png   name=layerbomb  cond="f.develops[f.current_scenario] == 0 || f.develops[f.current_scenario] == 1"]
[image layer=0 page=back x=0 y=0 storage=escape/room_black.png  name=layerblack cond="f.develops[f.current_scenario] >= 3                          "]
[image layer=0 page=back x=0 y=0 storage=escape/room_box.png    name=layerbox   cond="f.develops[f.current_scenario] == 1 || f.develops[f.current_scenario] == 2"]
[trans layer=0 time=400 method=puffIn]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 くぼみ x=278 y=548 width=179 height=81  target=*Pos_1 cond="f.develops[f.current_scenario] == 0                          "]
[mc 2 手榴弾 x=327 y=6   width=116 height=117 target=*Pos_2 cond="f.develops[f.current_scenario] == 0 || f.develops[f.current_scenario] == 1"]
[mc 3 木の箱 x=277 y=434 width=180 height=192 target=*Pos_3 cond="f.develops[f.current_scenario] == 1 || f.develops[f.current_scenario] == 2"]
[mc 4 爆発跡 x=191 y=533 width=360 height=101 target=*Pos_4 cond="f.develops[f.current_scenario] >= 3                          "]
[button storage=escape/left.ks graphic=escape/button_down.png x=30  y=550]
[return]

;-------------------------------------------------------
*Pos_1
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  ; 箱を選択中ではない
  [if exp="f.select_item != 'box'"]
    [sm]
    なにやら床に窪みがある。[l][er]
    四角いものがフィットしそうだが……。[l][er]
    [hm]
  ; 箱を選択中ではない
  [else]
    [use item=box]
    [image layer=0 x=0 y=0 storage=escape/room_box.png name=layerbox]
    [eval exp="f.develops[f.current_scenario] = 1"]
  [endif]
; 発展度１～
[elsif exp="f.develops[f.current_scenario] >= 1"]
  [ERROR!!]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_2
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  [sm]
  天井に手榴弾が吊るしてある。[l][er]
  手さえ届けば取れそうだ。[l][er]
  [hm]
; 発展度１
[elsif exp="f.develops[f.current_scenario] == 1"]
  [get item=bomb]
  [eval exp="f.develops[f.current_scenario] = 2"]
; 発展度２～
[elsif exp="f.develops[f.current_scenario] >= 2"]
  [sm]
  天井に手榴弾が吊るしてあったが、いまは何もない。[l][er]
  [hm]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_3
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  [ERROR!!]
; 発展度１～２
[elsif exp="f.develops[f.current_scenario] <= 2"]
  ; 手榴弾を選択中ではない
  [if exp="f.select_item != 'bomb'"]
    [sm]
    手榴弾を取るために設置した木の箱。[l][er]
    投げたり蹴ったりした程度では壊れそうにない。[l][er]
    [hm]
  ; 手榴弾を選択中
  [else]
    [sm]
    手榴弾で木の箱を壊してみよう。[l][er]
    ……。[l][er]
    [mask time=500]
    [use item=bomb]
    [free name=layerbox layer=0]
    [image layer=0 x=0 y=0 storage=escape/room_black.png]
    [cursor storage=default]
    [eval exp="f.develops[f.current_scenario] = 3"]
    [mask_off time=500]
    木の箱を壊した。[l][er]
    [hm]
   [endif]
; 発展度３～
[elsif exp="f.develops[f.current_scenario] >= 3"]
  [ERROR!!]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_4
; 発展度～２
[if exp="f.develops[f.current_scenario] <= 2"]
  [ERROR!!]
; 発展度３
[elsif exp="f.develops[f.current_scenario] == 3"]
  [sm]
  ここで手榴弾を爆発させた。[l][er]
  おや？　何かある……。[l][er]
  小さな鍵を手に入れた。[l][er]
  [get item=key]
  [eval exp="f.develops[f.current_scenario] = 4"]
  [hm]
; 発展度４～
[elsif exp="f.develops[f.current_scenario] >= 4"]
  [sm]
  もう何もない。[l][er]
  [hm]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_5
[eval exp="f.chest_top_is_open = false"]
[anim name=chest_top left=960 time=0]
[scm][s]