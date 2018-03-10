
; == chest.ks ==============================================

; たんす。

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sv]
[sb]
[scm]
[s]


;-------------------------------------------------------
*Sub_Set_Variable

[iscript]
f.is_open_chest_top = false
f.is_open_chest_bottom = false
[endscript]
[return]

;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0   y=0 storage=escape/chest.png]
[image layer=0 page=back x=960 y=0 storage=escape/chest_bottom.png name=layerbottom]
[image layer=0 page=back x=960 y=0 storage=escape/chest_paper.png  name=layerlpaper   cond="f.develops[f.current_scenario] == 0"]
[image layer=0 page=back x=960 y=0 storage=escape/chest_top.png    name=layertop]
[trans layer=0 time=400 method=fadeInDown]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 下の引き出し       x=125 y=411 width=495 height=152 target=*Pos_1]
[mc 2 下の引き出し（開） x=73  y=411 width=612 height=210 target=*Pos_2 cond="f.is_open_chest_bottom"]
[mc 3 紙片               x=285 y=433 width=151 height=97  target=*Pos_3 cond="f.is_open_chest_bottom && f.develops[f.current_scenario] == 0"]
[mc 4 上の引き出し       x=111 y=156 width=529 height=134 target=*Pos_4]
[mc 5 上の引き出し（開） x=56  y=155 width=629 height=266 target=*Pos_5 cond="f.is_open_chest_top"]
[button storage=escape/right.ks graphic=escape/button_down.png x=30  y=550]
[return]

;-------------------------------------------------------
*Pos_1
[eval exp="f.is_open_chest_bottom = true"]
[anim name=layerbottom left=0 time=0]
[anim name=layerlpaper  left=0 time=0]
[scm][s]

;-------------------------------------------------------
*Pos_2
[eval exp="f.is_open_chest_bottom = false"]
[anim name=layerbottom left=960 time=0]
[anim name=layerlpaper  left=960 time=0]
[scm][s]

;-------------------------------------------------------
*Pos_3
[sm]
紙片を見つけた。[l][er]
[get item=lpaper]
[eval exp="f.develops[f.current_scenario] = 1"]
[hm][scm][s]

;-------------------------------------------------------
*Pos_4
[eval exp="f.is_open_chest_top = true"]
[anim name=layertop left=0 time=0]
[scm][s]

;-------------------------------------------------------
*Pos_5
[eval exp="f.is_open_chest_top = false"]
[anim name=layertop left=960 time=0]
[scm][s]