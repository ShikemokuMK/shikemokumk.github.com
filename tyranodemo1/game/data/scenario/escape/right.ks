
; == right.ks ==============================================

; 部屋右手。

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]


;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/right.png]
[trans layer=0 time=400 method=fadeInRight]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 タンス x=201 y=381 width=188 height=233 target=*Pos_1]
[mc 2 金庫   x=247 y=306 width=107 height=91  target=*Pos_2]
[button storage=escape/left.ks graphic=escape/button_left.png x=30  y=300]
[return]

;-------------------------------------------------------
*Pos_1
[jump storage=escape/chest.ks]

;-------------------------------------------------------
*Pos_2
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  ; 鍵を選択中ではない
  [if exp="f.select_item != 'key'"]
    [sm]
    丈夫そうな金庫がある。[l][er]
    ちょっとやそっとの衝撃ではビクともしまい。[l][er]
    [hm]
  ; 鍵を選択中
  [else]
    [use item=key]
    [sm]
    鍵が刺さった。[l][er]
    ……。[l][er]
    紙片を手に入れた。[l][er]
    [hm]
    [get item=rpaper]
    [eval exp="f.develops[f.current_scenario] = 1"]
  [endif]
; 発展度１～
[elsif exp="f.develops[f.current_scenario] >= 1"]
  [sm]
  もう、何もない。[l][er]
  [hm]
[endif]
[scm][s]