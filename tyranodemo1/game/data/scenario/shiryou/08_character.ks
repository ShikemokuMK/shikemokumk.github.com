; [reset_all] 独自マクロ。ゲーム画面をすべてリセットして、ゲーム起動時の状態に戻します。(詳細は「macro.ks」をご参照ください)
[reset_all]

[position width=920 height=211 top=371 left=20]
[position page=fore margint=45 marginl=10 marginr=20 marginb=10 vertical=false opacity="180" color="0x000000" ]
[bg storage="room.jpg" time=600]

[er]キャラクターオブジェクト資料集。[l]










[er]～キャラクターを定義する～[l]
[er]［chara_new］…キャラクターを定義する。[l]
[r ]［chara_face］…定義済みのキャラクターに表情を登録する。[l]


[chara_new  name="akane"  jname="あかね" storage="chara/akane/normal.png"  ]
[chara_face name="akane"   face="angry"  storage="chara/akane/angry.png"   ]
[chara_face name="akane"   face="doki"   storage="chara/akane/doki.png"    ]
[chara_face name="akane"   face="happy"  storage="chara/akane/happy.png"   ]
[chara_face name="akane"   face="sad"    storage="chara/akane/sad.png"     ]

; [chara_new][chara_face]x4 やまとを定義します。
[chara_new  name="yamato" jname="やまと" storage="chara/yamato/normal.png" ]
[chara_face name="yamato"  face="angry"  storage="chara/yamato/angry.png"  ]
[chara_face name="yamato"  face="happy"  storage="chara/yamato/happy.png"  ]
[chara_face name="yamato"  face="sad"    storage="chara/yamato/sad.png"    ]
[chara_face name="yamato"  face="tohoho" storage="chara/yamato/tohoho.png" ]

; [chara_new][chara_face]x2 マスコットの怪獣キャラクターを定義します。最初の名前は「？？？」。
[chara_new   name="tyrano" jname="？？？" storage="chara/mascot_1/normal.png" ]
[chara_face  name="tyrano"  face="happy"  storage="chara/mascot_1/happy.png"  ]
[chara_face  name="tyrano"  face="angry"  storage="chara/mascot_1/angry.png"  ]










[er]～キャラクターを出す～[l]
[er]［chara_show］…キャラクターを出す。[l]


[chara_show name="akane"]


[chara_hide name=akane time=0]
[er]登場時間を指定できる。[l]


[chara_show name=akane time=3000]


[chara_hide name=akane time=0]
[er]wait=false でアニメーションの完了を待たずに次に進む。[l]


[chara_show name=akane time=3000 wait=false]


[er]あああああああああああああああああああああああああああああああああああ[l]
[chara_hide name=akane time=0]
[er]位置を自分で指定できる。[l]


[chara_show name=akane left=100 top=100]


[chara_hide name=akane time=0]
[er]横幅や高さを指定できる。[l]


[chara_show name=akane width=300]


[chara_hide name=akane time=0]
[er]左右反転して表示。（前回登場時の幅・高さを引き継ぐ）[l]


[chara_show name=akane reflect=true]


[chara_hide name=akane time=0]
[er]登場時の表情を指定する。（前回登場時の幅・高さ・反転を引き継ぐ）[l]


[chara_show name=akane face=happy]


[chara_hide name=akane time=0]
[er]もとどおりに表示する。[l]


[chara_show name=akane width=400 reflect=false]











[er]～表情の変更～[l]
[er]［chara_mod］…表情を変更する。[l]


[chara_mod name=akane face=doki]


[er]face=default を指定するとデフォルトの表情になる。[l]


[chara_mod name=akane face=default]


[er]切り替え時間やアニメーションの完了待ちの有無を指定できる。[l]


[chara_mod name=akane face=happy time=2000 wait=false]


[er]ああああああああああああああああああああああああああああああああああああ[l]
[er]cross=false でクロスフェードを無効。背景が透けない切り替えになる。[l]


[chara_mod name=akane face=default cross=false]


[er]reflect=true で表情を切り替えるついでに左右反転。[l]


[chara_mod name=akane face=happy reflect=true]


[er]元に戻す。[l]


[chara_mod name=akane face=default reflect=false]










[er]～位置の変更～[l]
[er]［chara_move］…位置を変更する。[l]

[chara_move name=akane left=100]


[er]切り替え時間やアニメーションの完了待ちの有無を指定できる。[l]


[chara_move name=akane left=500 time=3000 wait=false]


[er]ああああああああああああああああああああああああああああああああああああ[l]
[er]「left="-=200"」「left="+=100"」などの記法で相対的な移動が可能。[l]


[chara_move name=akane left="-=200"]
[chara_move name=akane left="+=100"]


[er]大きさも変更可能。[l]


[chara_move name=akane width=600]


[er]「非表示→再表示」ではなく、滑らかなアニメーションで接続することも可能。[l]

[chara_move name=akane left=260 width=400 anim=true]


[er]その際のアニメーション具合（イージングという）を指定可能。[l]

[chara_move name=akane left=0   anim=true effect=linear]
[wait time=500]
[chara_move name=akane left=600 anim=true effect=easeOutBack]
[wait time=500]
[chara_move name=akane left=260   anim=true effect=easeOutBounce]












[er]～キャラクターの名前欄を出す～[l]
[er]［ptext name=XXX］…文字オブジェクトを出す。[l]
[r ]［chara_config ptext=XXX］…名前欄となる文字オブジェクトを指定する。[l]


[ptext         name="chara_name_area" layer="message0" color=0xFFFFFF size=26 x=30 y=381 bold="bold" edge="" shadow="" text="【ここを名前欄として使うよ～】"]
[chara_config ptext="chara_name_area"]


[er]……文字オブジェクトを出した。[l]
[r ]［chara_ptext］…設定した文字オブジェクトに名前を入れる。[l]


[chara_ptext name=akane]


[er]名前を入れながら表情を変えることもできる。[l]


[chara_ptext name=akane face=happy]


[er]名前を消す。[l]


[chara_ptext]


[er]［chara_ptext］タグには、特別な代替記法がある。[l]
[r ]たとえば［chara_ptext name=akane］は、#akane と書いても同様の効果がある。[l]


#akane


[er]この特殊な記法で、名前を消す。[l]


#


[er]この特殊な記法で、名前を出しつつ表情を変えることもできる。[l]


#akane:default








[er]～キャラクターを消す～[l]
[er]［chara_hide］…特定のレイヤーにいる特定のキャラクターを退場させる。[l]
[r ]［chara_hide_all］…特定のレイヤーにいるすべてのキャラクターを退場させる。[l]


[chara_hide name=akane]









[er]～複数のキャラクターを扱う～[l]
[er]［chara_show］…自動配置を有効にしたキャラクターを出すと、同じレイヤーにいるキャラクターの位置が自動で調整される。[l]


[chara_show name=akane]
[chara_show name=yamato]


[er]位置調整は、新規登場キャラクターが「左」に来るように行われる。[l]
[er]ちなみに、自動配置が有効でないキャラクターを出した場合は、調整は行われない。[l]


[chara_show name=tyrano left=10 top=10]


[er]［chara_hide］…退場させるときに、位置調整を行うかどうかを指定できる。[l]
[r ]位置調整をせずに消す例。[l]


[chara_hide name=tyrano pos_mode=false]
[chara_hide name=yamato pos_mode=false]
[chara_hide name=akane pos_mode=false]


[chara_show name=akane]
[chara_show name=yamato]
[chara_show name=tyrano]
[er]位置調整をしながら消す例。[l]


[chara_hide name=tyrano]
[chara_hide name=yamato]
[chara_hide name=akane]


[er]wait=falseを指定することで、複数のキャラクターを「同時に」出したり消したりできる。[l]


[chara_show name=akane wait=false]
[chara_show name=yamato wait=false]
[chara_show name=tyrano]


[er]ただしその場合、自動位置調整アニメーションが連続して行われる。これを回避するには工夫が必要。[l]
[chara_hide_all time=0]
[er]位置を直接指定することで、自動配置をさせない例。[l]


[chara_show name=akane wait=false left=520 top=40]
[chara_show name=yamato wait=false left=200 top=0]
[chara_show name=tyrano           left=90 top=200]









[chara_hide_all time=1000]
[er]～キャラクター関係のコンフィグを変更する～[l]
[er]［chara_config］…キャラクター関係のコンフィグを変更する。[l]

[er]自動位置調整機能を切ることができる。（もともとは有効）[l]


[chara_config pos_mode=false]


[chara_show name=yamato]
[chara_show name=akane]
[chara_hide_all]
[r ]……有効に戻す。[l]


[chara_config pos_mode=true]


[er]自動位置調整にかける時間を指定できる。[l]


[chara_config pos_change_time=100]


[chara_show name=yamato]
[chara_show name=akane]
[chara_show name=tyrano]
[er]表情の変更（［chara_mod］タグ使用）時にかける時間のデフォルト値を設定できる。[l]


[chara_config time=1200]


[chara_mod name=akane face=happy]


[chara_config time=0]


[chara_mod name=akane face=sad]
[er]キャラクター退場時の表情を記憶しておいて、次回登場時に反映させるようにできる。（もともとは無効）[l]


[chara_config memory=true]


[chara_hide name=akane]
[chara_show name=akane]
[r ]……無効に戻す。[l]


[chara_config memory=false]


[chara_hide name=akane]
[chara_show name=akane]
[er]発言しているキャラクターの自動強調機能を有効にできる。（もともとは無効）[l]
[er]「ぼかし」に差をつけて強調する例。「ぼかしの強さ」も指定可能。[l]


[chara_config talk_focus=blur blur_value=2]


#akane
[er]あかねがしゃべる。[l]
#yamato
[er]やまとがしゃべる。[l]
#tyrano
[er]マスコットがしゃべる。[l]
#
[er]「輝度」に差をつけて強調する例。その「輝度」も指定可能。[l]


[chara_config talk_focus=brightness brightness_value=60]


#akane
[er]あかねがしゃべる。[l]
#yamato
[er]やまとがしゃべる。[l]
#tyrano
[er]マスコットがしゃべる。[l]
#
[er]さらに、アニメーションで自動強調させることもできる。[l]
[r ]「浮かぶ」アニメーションで強調する例。「浮かぶ距離」「浮かぶ時間」も指定可能。[l]


[chara_config talk_anim=up talk_anim_value=20 talk_anim_time=200]


#akane
[er]あかねがしゃべる。[l]
#yamato
[er]やまとがしゃべる。[l]
#tyrano
[er]マスコットがしゃべる。[l]
#
[er]「沈む」アニメーションで強調する例。「沈む距離」「沈む時間」も指定可能。[l]


[chara_config talk_anim=down]


#akane
[er]あかねがしゃべる。[l]
#yamato
[er]やまとがしゃべる。[l]
#tyrano
[er]マスコットがしゃべる。[l]
#
[er]自動強調機能を切る。[l]


[chara_config talk_anim=none talk_focus=none]


#akane
[er]あかねがしゃべる。[l]
#yamato
[er]やまとがしゃべる。[l]
#tyrano
[er]マスコットがしゃべる。[l]
#
[chara_hide name=tyrano pos_mode=false]
[chara_hide name=yamato]
#akane:happy
[er]以上、資料集でした。[l]


[chara_config pos_change_time=600 time=600]
[jump storage="select.ks"]