
; == title.ks ==============================================

; あいさつ画面を作成するシナリオファイルです。

; ==========================================================



; [jump] もうあいさつを見たなら、さっさと目次画面にジャンプしてしまいます。
; (condパラメータに注目してください。
;  condはconditionの略で、条件の意。この条件が満たされたときのみ、タグが発動します。
;  この場合なら、システム変数 sf.title_moumita の中身が 1 に等しいときのみ、
;  タグが実行されます。)
[jump cond=" sf.title_moumita == 1 " storage="select.ks"]



; ----------------------------------------------------------
*Start
; ----------------------------------------------------------


; [bg] 背景を表示します。
; 時間は700ミリ秒、使用する画像はrouka.jpg。
[bg time="700" storage="rouka.jpg"]

; [chara_show] キャラクターを表示します。
[chara_show name="akane" time="700"]

; [layopt] メッセージレイヤー0番を可視状態にします。
[layopt layer="message0" visible="true"]

; [set_message_window] メッセージウィンドウをセットします。
; これは独自マクロです(定義しているシナリオファイルはmacro.ks)。
; メッセージウィンドウ関連の処理をマクロにまとめてあります。
[set_message_window]

; #？？？ 発言者欄に「？？？」と出します。
#？？？

; [delay] 文字送りスピードを変更します。1文字あたり200ミリ秒に。
[delay speed="200"]



・・・・・・・・・。[p]



; [resetdelay] 文字送りスピードをデフォルトに戻します。
[resetdelay]

; [chara_mod] 表情を変更します。akaneをhappyに。
[chara_mod name="akane" face="happy" time="700"]



こんにちは!![p]



; [chara_mod] 表情を変更します。akaneをhappyに。
[chara_mod name="akane" face="default" time="700"]



私は、あかね。[l]
このゲームの案内人だよ。[p]



; #akane:default 名前欄と表情の同時変更を同時に変更します。
; 名前欄にakaneを入れ、さらにakaneの表情をdefaultにします。
; これは、[chara_ptext name="akane"][chara_mod name="akane" face="default"]を省略した
; 特殊な文法です。
#akane:default
そして、このゲームは……。[p]



#akane:happy



ノベルゲームエンジン・ティラノスクリプトの[r]テクニックサンプル集１だよー!![p]



#akane:default



基礎的なテクニックをいっぱい載せているので、ぜひ参考にしてね。[p]
じゃあ、目次にゴー!![p]



; [eval]
; あいさつをもう見たということで、
; システム変数sf.title_moumitaに1をぶち込みます。
[eval exp=" sf.title_moumita = 1 "]

; [jump]
; 目次画面に移ります。
[jump storage="select.ks"]