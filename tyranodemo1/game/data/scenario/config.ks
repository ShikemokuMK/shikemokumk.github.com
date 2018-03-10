; ティラノスクリプト標準テーマプラグイン







;===============================================================================
; いまある画面を破壊しつくしてから、
; コンフィグ画面作成の最低限の準備を行います。
;===============================================================================

*start

; [layopt]
; メッセージレイヤーを不可視にします。
[layopt layer="message0" visible="false"]

; [clearfix]
; fixレイヤーを解放します。
[clearfix]

; [free_layermode][reset_camera]
; 画面効果を無効化します。
[free_layermode time="0"]
[reset_camera time="0"]

; [iscript]～[endscript]
; ベースレイヤ、レイヤ０、１、２……を解放します。
[iscript]
$('.layer_camera').empty();
[endscript]

; [hidemenubutton]
; メニューボタンを隠します。
[hidemenubutton]

; [layopt]
; レイヤ１を表示します。
[layopt layer="1" visible="true"]

; [cm]
; メッセージのクリアとフリーレイヤーの解放を行います。
[cm]

; [bg]
; 背景を表示します。
[bg storage="../../tyrano/images/system/bg_config.jpg" time="100"]

; 画面右上の「Back」ボタンを出します。
[button graphic="config/c_btn_back.png" fix="true" enterimg="config/c_btn_back2.png" target="*backtitle" x="840" y="20"]

; [iscript]～[endscript]
; ティラノスクリプトのエンジン本体から、
; 設定にかかわる部分の値をぶっこ抜いて、
; 整数の数値に変換したうえで各一時変数にコピーします。
[iscript]

tf.current_bgm_vol    = parseInt(TG.config.defaultBgmVolume)
tf.current_se_vol     = parseInt(TG.config.defaultSeVolume)
tf.current_ch_speed   = parseInt(TG.config.chSpeed)
tf.current_auto_speed = parseInt(TG.config.autoSpeed)
tf.text_skip = 'ON'
if(TG.config.unReadTextSkip != 'true') {
tf.text_skip ='OFF'
}

[endscript]

; [jump]
; ぴょーん。
[jump target="*config_page"]







;===============================================================================
; fixボタンを出しまくります。合計44個
;===============================================================================

*config_page

;c_btn.png は 4×4px の完全透明な画像です。width.heightを使って拡大しています
;一部のスマホブラウザでは音量変更に対応していないのでご留意ください

;---------------------------------------------------------------------------
;▼BGM音量変更用fixボタン×11
;---------------------------------------------------------------------------

[macro name="bgm_volume_button"]
[button name="& 'bgmvol, bgmvol_' + mp.volume " fix="true" target="*vol_bgm_change" graphic="config/c_btn.png" width="35" height="35" x="& mp.index * 40 + 300 " y="170" exp="& 'tf.current_bgm_vol = ' + mp.volume"]
[endmacro]
[bgm_volume_button index=" 0" volume=" 10"]
[bgm_volume_button index=" 1" volume=" 20"]
[bgm_volume_button index=" 2" volume=" 30"]
[bgm_volume_button index=" 3" volume=" 40"]
[bgm_volume_button index=" 4" volume=" 50"]
[bgm_volume_button index=" 5" volume=" 60"]
[bgm_volume_button index=" 6" volume=" 70"]
[bgm_volume_button index=" 7" volume=" 80"]
[bgm_volume_button index=" 8" volume=" 90"]
[bgm_volume_button index=" 9" volume="100"]
[bgm_volume_button index="12" volume="  0"]


;---------------------------------------------------------------------------
;▼SE音量変更用fixボタン×11
;---------------------------------------------------------------------------

[macro name="se_volume_button"]
[button name="& 'sevol, sevol_' + mp.volume" fix="true" target="*vol_se_change" graphic="config/c_btn.png" width="35" height="35" x="& mp.index * 40 + 300" y="220" exp="& 'tf.current_se_vol = ' + mp.volume "]
[endmacro]
[se_volume_button index=" 0" volume=" 10"]
[se_volume_button index=" 1" volume=" 20"]
[se_volume_button index=" 2" volume=" 30"]
[se_volume_button index=" 3" volume=" 40"]
[se_volume_button index=" 4" volume=" 50"]
[se_volume_button index=" 5" volume=" 60"]
[se_volume_button index=" 6" volume=" 70"]
[se_volume_button index=" 7" volume=" 80"]
[se_volume_button index=" 8" volume=" 90"]
[se_volume_button index=" 9" volume="100"]
[se_volume_button index="12" volume="  0"]

;---------------------------------------------------------------------------
;▼テキスト速度変更用fixボタン×10
;---------------------------------------------------------------------------

[macro name="ch_speed_button"]
[button name="& 'ch, ch_' + mp.speed " fix="true" target="*ch_speed_change" exp="& 'tf.set_ch_speed = ' + mp.speed" graphic="config/c_btn.png" width="35" height="35" x="& mp.index * 40 + 300 " y="290"]
[endmacro]
[ch_speed_button index="0" speed="100"]
[ch_speed_button index="1" speed=" 80"]
[ch_speed_button index="2" speed=" 50"]
[ch_speed_button index="3" speed=" 40"]
[ch_speed_button index="4" speed=" 30"]
[ch_speed_button index="5" speed=" 25"]
[ch_speed_button index="6" speed=" 20"]
[ch_speed_button index="7" speed=" 11"]
[ch_speed_button index="8" speed="  8"]
[ch_speed_button index="9" speed="  5"]

;---------------------------------------------------------------------------
;▼オート速度変更用fixボタン×10
;---------------------------------------------------------------------------

[macro name="auto_speed_button"]
[button fix="true" name="& 'auto, auto_' + mp.speed " target="*auto_speed_change" exp="& 'tf.set_auto_speed = ' + mp.speed " graphic="config/c_btn.png" width="35" height="35" x="& mp.index * 40 + 300" y="340"]
[endmacro]
[auto_speed_button index="0" speed="5000"]
[auto_speed_button index="1" speed="4500"]
[auto_speed_button index="2" speed="4000"]
[auto_speed_button index="3" speed="3500"]
[auto_speed_button index="4" speed="3000"]
[auto_speed_button index="5" speed="2500"]
[auto_speed_button index="6" speed="2000"]
[auto_speed_button index="7" speed="1300"]
[auto_speed_button index="8" speed=" 800"]
[auto_speed_button index="9" speed=" 500"]

;---------------------------------------------------------------------------
;▼未読スキップ変更用fixボタン×2
;---------------------------------------------------------------------------

; 未読スキップ-OFF
[button name="unread_off" fix="true" target="*skip_off" graphic="config/c_btn.png" width=125 height=35 x=300 y=420]
; 未読スキップ-ON
[button name="unread_on" fix="true" target="*skip_on" graphic="config/c_btn.png" width=125 height=35 x=435 y=420]







;===============================================================================
; 画面の調整。
;===============================================================================

;---------------------------------------------------------------------------
;▼現在の設定値に対応するボタンを光らせます。
;---------------------------------------------------------------------------
; BGM音量・SE音量・テキスト速度・オート速度・未読スキップの順
; $(.name).attr('src','画像ファイルの場所');
;※画像差し替え版を使用するときは c_set.gif を c_set.png に書き換えてね
[iscript]
$('.bgmvol_' + tf.current_bgm_vol   ).attr('src', 'data/image/config/c_set.png');
$('.sevol_'  + tf.current_se_vol    ).attr('src', 'data/image/config/c_set.png');
$('.ch_'     + tf.current_ch_speed  ).attr('src', 'data/image/config/c_set.png');
$('.auto_'   + tf.current_auto_speed).attr('src', 'data/image/config/c_set.png');
if (tf.text_skip == 'OFF') {
$('.unread_off').attr('src','data/image/config/c_uts_off.png');
}
else {
$('.unread_on').attr('src','data/image/config/c_uts_on.png');
}
[endscript]


;---------------------------------------------------------------------------
;▼画面の構築が終了したので、ゲームを停止します。
;---------------------------------------------------------------------------

[s]
















;-------------------------------------------------------------------------------
; タイトルに戻る
;-------------------------------------------------------------------------------
*backtitle

[if exp=" $('.message1_fore').css('display') == 'none' "]
[cm]
[layopt layer=message1 visible=false]
[freeimage layer=1]
[clearfix]
[awakegame]
[endif]
[return]








;===============================================================================
;★ボタンクリック時の処理
;===============================================================================

;---------------------------------------------------------------------------
;▼BGM音量
;---------------------------------------------------------------------------
*vol_bgm_change

[iscript]
$('.bgmvol').attr('src','data/image/config/c_btn.png');
$('.bgmvol_'+tf.current_bgm_vol).attr('src','data/image/config/c_set.png');
[endscript]
[bgmopt volume="&tf.current_bgm_vol"]
[return]

;---------------------------------------------------------------------------
;▼SE音量
;---------------------------------------------------------------------------
*vol_se_change

[iscript]
$('.sevol').attr('src','data/image/config/c_btn.png');
$('.sevol_'+tf.current_se_vol).attr('src','data/image/config/c_set.png');
[endscript]
[seopt volume="&tf.current_se_vol"]
[return]

;----------------------------------------------------------------------------
;▼テキスト速度
;---------------------------------------------------------------------------
*ch_speed_change

[iscript]
$('.ch').attr('src','data/image/config/c_btn.png');
$('.ch_'+tf.set_ch_speed).attr('src','data/image/config/c_set.png');
[endscript]
[configdelay speed="&tf.set_ch_speed"]

; テキスト速度サンプル
[position layer=message1 left=40 top=490 width=880 height=110 page=fore visible=true opacity=0]
[layopt layer=message1 visible=true]
[current layer=message1]
[font color="0x454D51" edge="0xffffff"]
このスピードで表示されます。
[iscript]
tf.system.backlog.pop(); // 上の「このスピードで表示されます」のテキストを履歴から削除
[endscript]
[wait time="1500"]
[er]
[layopt layer=message1 visible=false]
[return]

;---------------------------------------------------------------------------
;▼オート速度
;---------------------------------------------------------------------------
*auto_speed_change

[iscript]
$('.auto').attr('src','data/image/config/c_btn.png');
$('.auto_'+tf.set_auto_speed).attr('src','data/image/config/c_set.png');
[endscript]
[autoconfig speed="&tf.set_auto_speed"]
[return]

;---------------------------------------------------------------------------
;▼スキップ処理-OFF
;---------------------------------------------------------------------------
*skip_off

[iscript]
$('.unread_off').attr('src','data/image/config/c_uts_off.png');
$('.unread_on').attr('src','data/image/config/c_btn.png');
tf.text_skip='OFF';
[endscript]
[config_record_label skip=false]
[return]

;---------------------------------------------------------------------------
;▼スキップ処理-ON
;---------------------------------------------------------------------------
*skip_on

[iscript]
$('.unread_off').attr('src','data/image/config/c_btn.png');
$('.unread_on').attr('src','data/image/config/c_uts_on.png');
tf.text_skip='ON';
[endscript]
[config_record_label skip=true]
[return]