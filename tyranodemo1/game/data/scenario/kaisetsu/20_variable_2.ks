; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]

; [akn/def] 独自マクロ。キャラ名欄に「あかね」と入れつつ、あかねの表情を変えます。定義は「macro.ks」で。
[akn/def]



; == 20_variable_2.ks ======================================
;
; 好感度やフラグによってシナリオを分岐させてみます。
;
; ★登場する主なタグ。
; [iscript] … JavaScriptを実行します。

; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

; [iscript]～[endscript] 変数の初期化処理です。
; 変数 f.flag の中には真偽値 false を、
; 変数 f.favo_akane に中には数値 0 を入れます。
[iscript]
f.flag = false
f.favo_akane = 0
[endscript]






; ==========================================================
*P1

プレイヤーの選択によって好感度やフラグの状態を管理して、シナリオを分岐させてみよう!![p]
じゃあ、ちょっとした小芝居をしましょうか。[p][akn/hap]
私は……ノベルゲーム開発サークルの会長です。[p][akn/dok]
キミは……このサークルに興味がある新入生。[p]
今日あなたは私に話を聞くためにここに訪れました。[p]
――コンコン、ガチャ。[p][akn/def]
「おや、キミが話を聞きにやってきた人？」[p]
「初めまして、私がサークルの会長だよ。あかねって言います」[p]
[glink color=blue size=30  x=210 width=400 y=150 target=*P1A text=「こちらこそ初めまして」]
[glink color=blue size=30  x=210 width=400 y=250 target=*P1B text=「何だ、その口の利き方は」]
[s]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P1A

; [iscript]～[endscript] あかねの好感度+100。変数f.favo_akaneの中身を100増やします。
[iscript]
f.favo_akane += 100
[endscript]

[akn/hap]
「うんうん、あいさつができて感心だね」[p]
[jump target=*P2]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P1B

; [iscript]～[endscript] あかねの好感度-200。変数f.favo_akaneの中身を200減らします。
[iscript]
f.favo_akane -= 200
[endscript]

[akn/dok]
「えっ、ごめんなさい」[p]
「そんなこと言われるなんて思わなかったわ……」[p]
[jump target=*P2]






; ==========================================================
*P2
[akn/def]
「じゃあ、サークルの話をしようか」[p]
「キミはさ、ゲームの開発に興味……ある？」[l]
[glink color=blue size=30  x=210 width=400 y=150 target=*P2A text=「興味あります」]
[glink color=blue size=30  x=210 width=400 y=250 target=*P2B text=「ありません」]
[s]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P2A

; [iscript]～[endscript] あかねの好感度+100。変数f.favo_akaneの中身を100増やします。
; また、フラグが立ったということで、変数f.flagに真偽値trueを入れます。（最初はfalseが入っていた）
[iscript]
f.favo_akane += 100
f.flag = true
[endscript]

「へえ、あるんだ！」[p]
「そうだよね!! だからここに来たんだものね」[p]
[jump target=*P3]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P2B

[akn/sad]
「そうなの??……まあ、いっか」[p]
「そういう人もいるよね」[p]
[jump target=*P3]






; ==========================================================
*P3

[akn/def]
「じゃあキミは、ノベルゲームって好き？[l]　ちなみに、私は好きなんだけど……」
[glink color=blue size=30  x=210 width=400 y=100 target=*P3A text=「好きです」]
[glink color=blue size=30  x=210 width=400 y=200 target=*P3B text=「大嫌いです」]
[glink color=blue size=30  x=210 width=400 y=300 target=*P3C text=「やったことがありません」]
[s]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P3A

; [iscript]～[endscript] あかねの好感度+100。変数f.favo_akaneの中身を100増やします。
[iscript]
f.favo_akane += 100
[endscript]

[akn/hap]
「ホント？ うれしいなー」[p]
[jump target=*P4]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P3B

; [iscript]～[endscript] あかねの好感度-100。変数f.favo_akaneの中身を100減らします。
[iscript]
f.favo_akane -= 100
[endscript]

[akn/dok]
「うそ……」[p]
「まあ、好みは人それぞれか」[p]
[jump target=*P4]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P3C

; [iscript]～[endscript] あかねの好感度+100。変数f.favo_akaneの中身を100増やします。
[iscript]
f.favo_akane += 100
[endscript]

「そっか」[p]
「じゃあ、これからフレッシュな気持ちでいっぱい経験すればいいよ!!」[p]
[jump target=*P4]






; ==========================================================
*P4

「…………」[p]

; [jump]x4 ここでエンディングが分岐。
; condパラメータに着目しよう。
; condというのは「条件」という意味で、
; condパラメータの内容が真（true）のときだけそのタグが実行されます。
[jump target=*P4A cond="f.favo_akane >=  200 && f.flag"]
[jump target=*P4B cond="f.favo_akane >=  200"]
[jump target=*P4C cond="f.favo_akane >=    0"]
[jump target=*P4D]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P4A

[akn/ang]
……よし、決めたっ!![p]
[akn/hap]
キミっ!![p]
私といっしょにノベルゲームを開発しようっ!!!![p]
～エンド１～[p]
条件：好感度200以上、かつ、ゲーム開発への興味フラグが立っている。[p]
[jump target=*End]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P4B

「さて、それじゃあキミには、私が作ったゲームを遊んでもらおうかな」[p]
「きっと楽しんでもらえると思うから!!」[p]
～エンド２～[p]
条件：エンド１の条件を満たしていないが、好感度は200以上。[p]
[jump target=*End]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P4C

[akn/dok]
「話はこんなところで終わりにしよっか」[p]
「他のサークルも回るんでしょ？　お疲れ様ー」[p]
～エンド３～[p]
条件：エンド１～２の条件を満たしていないが、好感度は0以上。[p]
[jump target=*End]

; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---
*P4D

[akn/sad]
「……君とは楽しく活動できなそうだね」[p]
「お互い時間を有益に使うためにも、キミには、他のサークルに行くことをお勧めします」[p]
～エンド４～[p]
条件：エンド１～３のいずれの条件も満たしていない。[p]
[jump target=*End]






;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]