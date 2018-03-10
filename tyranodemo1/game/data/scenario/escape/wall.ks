
; == left.ks ===============================================

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
[image layer=0 page=back x=0 y=0 storage=escape/wall.png]
[macro name=dial_new]
[chara_new   name=%name        storage=escape/0.png]
 [chara_face name=%name face=0 storage=escape/0.png]
 [chara_face name=%name face=1 storage=escape/1.png]
 [chara_face name=%name face=2 storage=escape/2.png]
 [chara_face name=%name face=3 storage=escape/3.png]
 [chara_face name=%name face=4 storage=escape/4.png]
 [chara_face name=%name face=5 storage=escape/5.png]
 [chara_face name=%name face=6 storage=escape/6.png]
 [chara_face name=%name face=7 storage=escape/7.png]
 [chara_face name=%name face=8 storage=escape/8.png]
 [chara_face name=%name face=9 storage=escape/9.png]
[endmacro]
[dial_new name=dial_1]
[dial_new name=dial_2]
[dial_new name=dial_3]
[dial_new name=dial_4]
[trans layer=0 time=400 method=zoomIn]
[wt]
[chara_show name=dial_1 face=&f.dials[1] time=300 left=&150*0+120 top=180 wait=false]
[chara_show name=dial_2 face=&f.dials[2] time=300 left=&150*1+120 top=180 wait=false]
[chara_show name=dial_3 face=&f.dials[3] time=300 left=&150*2+120 top=180 wait=false]
[chara_show name=dial_4 face=&f.dials[4] time=300 left=&150*3+120 top=180 wait=false]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[button 1 ダイアル① x=&150*0+120 y=180 width=115 height=270 target=*Dial_Change graphic=../fgimage/escape/empty.png exp="tf.ope = 1" cond="f.develops[f.current_scenario] == 0"]
[button 2 ダイアル② x=&150*1+120 y=180 width=115 height=270 target=*Dial_Change graphic=../fgimage/escape/empty.png exp="tf.ope = 2" cond="f.develops[f.current_scenario] == 0"]
[button 3 ダイアル③ x=&150*2+120 y=180 width=115 height=270 target=*Dial_Change graphic=../fgimage/escape/empty.png exp="tf.ope = 3" cond="f.develops[f.current_scenario] == 0"]
[button 4 ダイアル④ x=&150*3+120 y=180 width=115 height=270 target=*Dial_Change graphic=../fgimage/escape/empty.png exp="tf.ope = 4" cond="f.develops[f.current_scenario] == 0"]
[button target=*Back graphic=escape/button_down.png x=30  y=550]
[return]

;-------------------------------------------------------
*Dial_Change

[cm]
[iscript]
f.dials[tf.ope] = (f.dials[tf.ope] + 1) % 10
tf.name   = 'dial_' + tf.ope
tf.face   = ''      + f.dials[tf.ope]
tf.result = ''      + f.dials[1] + f.dials[2] + f.dials[3] + f.dials[4]
tf.answer = '4527'
[endscript]
[chara_mod name=&tf.name face=&tf.face time=0]
[jump target=*Dial_OK cond="tf.result == tf.answer"]
[scm][s]

;-------------------------------------------------------
*Dial_OK
[sm]
ガチャ。[l][er]
……後ろで扉の開く音がした。[l][er]
[hm]
[eval exp="f.develops[f.current_scenario] = 1"]
[scm][s]

;-------------------------------------------------------
*Back
[jump storage=escape/left.ks cond="f.develops[f.current_scenario] != 1"]
[jump storage=escape/_end.ks]