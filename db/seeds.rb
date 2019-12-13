require 'date'

# カテゴリー親要素
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
book_music_game = Category.create(name: "本・音楽・ゲーム")
appliance_smartphone_camera = Category.create(name: "家電・スマホ・カメラ")
toy_hobby_goods = Category.create(name: "おもちゃ・ホビー・グッズ")
others = Category.create(name: "その他")

# カテゴリー子要素
lady_1 = lady.children.create(name: "トップス")
lady_2 = lady.children.create(name: "ジャケット/アウター")
lady_3 = lady.children.create(name: "パンツ")
lady_4 = lady.children.create(name: "スカート")
lady_5 = lady.children.create(name: "ワンピース")

man_1 = man.children.create(name: "トップス")
man_2 = man.children.create(name: "ジャケット/アウター")
man_3 = man.children.create(name: "小物")
man_4 = man.children.create(name: "靴")
man_5 = man.children.create(name: "帽子")

book_music_game_1 = book_music_game.children.create(name: "本")
book_music_game_2 = book_music_game.children.create(name: "漫画")
book_music_game_3 = book_music_game.children.create(name: "雑誌")
book_music_game_4 = book_music_game.children.create(name: "CD")
book_music_game_5 = book_music_game.children.create(name: "DVD/ブルーレイ")
book_music_game_6 = book_music_game.children.create(name: "テレビゲーム")

appliance_smartphone_camera_1 = appliance_smartphone_camera.children.create(name: "スマートフォン/携帯電話")
appliance_smartphone_camera_2 = appliance_smartphone_camera.children.create(name: "スマホアクセサリー")
appliance_smartphone_camera_3 = appliance_smartphone_camera.children.create(name: "PC/タブレット")
appliance_smartphone_camera_4 = appliance_smartphone_camera.children.create(name: "オーディオ機器")
appliance_smartphone_camera_5 = appliance_smartphone_camera.children.create(name: "生活家電")

toy_hobby_goods_1 = toy_hobby_goods.children.create(name: "おもちゃ")
toy_hobby_goods_2 = toy_hobby_goods.children.create(name: "タレントグッズ")
toy_hobby_goods_3 = toy_hobby_goods.children.create(name: "コミック/アニメグッズ")
toy_hobby_goods_4 = toy_hobby_goods.children.create(name: "楽器/器材")
toy_hobby_goods_5 = toy_hobby_goods.children.create(name: "コレクション")
toy_hobby_goods_6 = toy_hobby_goods.children.create(name: "その他")

others_1 = others.children.create(name: "まとめ売り")
others_2 = others.children.create(name: "ペット用品")
others_3 = others.children.create(name: "食品")
others_4 = others.children.create(name: "飲料/酒")
others_5 = others.children.create(name: "日用品/生活雑貨/旅行")
others_6 = others.children.create(name: "文房具/事務用品")

# カテゴリー孫要素
lady_1.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"},
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "シャツ/ブラウス(半袖/袖なし)"},
  {name: "シャツ/ブラウス(七分/長袖)"},
  {name: "ポロシャツ"},
  {name: "キャミソール"},
  {name: "その他"}
])
lady_2.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"},
  {name: "レザージャケット"},
  {name: "ダウンジャケット"},
  {name: "ライダースジャケット"},
  {name: "その他"}
])
lady_3.children.create([
  {name: "デニム/ジーンズ"},
  {name: "ショートパンツ"},
  {name: "カジュアルパンツ"},
  {name: "チノパン"},
  {name: "ワークパンツ/カーゴパンツ"},
  {name: "クロップドパンツ"},
  {name: "その他"}
])
lady_4.children.create([
  {name: "ミニスカート"},
  {name: "ひざ丈スカート"},
  {name: "ロングスカート"},
  {name: "チノパン"},
  {name: "キュロット"},
  {name: "その他"}
])
lady_5.children.create([
  {name: "ミニワンピース"},
  {name: "ひざ丈ワンピース"},
  {name: "ロングワンピース"},
  {name: "その他"}
])

man_1.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"},
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "シャツ"},
  {name: "ポロシャツ"},
  {name: "タンクトップ"},
  {name: "ニット/セーター"},
  {name: "その他"}
])
man_2.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"},
  {name: "レザージャケット"},
  {name: "ダウンジャケット"},
  {name: "ライダースジャケット"},
  {name: "その他"}
])
man_3.children.create([
  {name: "長財布"},
  {name: "折り財布"},
  {name: "マネークリップ"},
  {name: "コインケース/小銭入れ"},
  {name: "名刺入れ/定期入れ"},
  {name: "キーケース"},
  {name: "その他"}
])
man_4.children.create([
  {name: "スニーカー"},
  {name: "サンダル"},
  {name: "ブーツ"},
  {name: "モカシン"},
  {name: "ドレス/ビジネス"},
  {name: "長靴/レインシューズ"},
  {name: "その他"}
])
man_5.children.create([
  {name: "キャップ"},
  {name: "ハット"},
  {name: "ニットキャップ/ビーニー"},
  {name: "ハンチング/ベレー帽"},
  {name: "キャスケット"},
  {name: "サンバイザー"},
  {name: "その他"}
])

book_music_game_1.children.create([
  {name: "文学/小説"},
  {name: "人文/社会"},
  {name: "趣味/スポーツ/実用"},
  {name: "参考書"},
  {name: "ビジネス/経済"},
  {name: "コンピュータ/IT"},
  {name: "その他"}
])
book_music_game_2.children.create([
  {name: "全巻セット"},
  {name: "少年漫画"},
  {name: "少女漫画"},
  {name: "青年漫画"},
  {name: "女性漫画"},
  {name: "その他"}
])
book_music_game_3.children.create([
  {name: "アート/エンタメ/ホビー"},
  {name: "ファッション"},
  {name: "ニュース/総合"},
  {name: "趣味/スポーツ"},
  {name: "その他"}
])
book_music_game_4.children.create([
  {name: "邦楽"},
  {name: "洋楽"},
  {name: "アニメ"},
  {name: "クラシック"},
  {name: "K-POP/アジア"},
  {name: "キッズ/ファミリー"},
  {name: "その他"}
])
book_music_game_5.children.create([
  {name: "外国映画"},
  {name: "日本映画"},
  {name: "アニメ"},
  {name: "TVドラマ"},
  {name: "ミュージック"},
  {name: "お笑い/バラエティ"},
  {name: "その他"}
])
book_music_game_6.children.create([
  {name: "家庭用ゲーム本体"},
  {name: "家庭用ゲームソフト"},
  {name: "携帯用ゲーム本体"},
  {name: "携帯用ゲームソフト"},
  {name: "PCゲーム"},
  {name: "その他"}
])

appliance_smartphone_camera_1.children.create([
  {name: "スマートフォン本体"},
  {name: "バッテリー/充電器"},
  {name: "携帯電話本体"},
  {name: "PHS本体"},
  {name: "その他"}
])
appliance_smartphone_camera_2.children.create([
  {name: "Android用ケース"},
  {name: "iPhone用ケース"},
  {name: "カバー"},
  {name: "イヤホンジャック"},
  {name: "ストラップ"},
  {name: "フィルム"},
  {name: "自撮り棒"},
  {name: "その他"}
])
appliance_smartphone_camera_3.children.create([
  {name: "デスクトップ型PC"},
  {name: "ディスプレイ"},
  {name: "電子ブックリーダー"},
  {name: "PC周辺機器"},
  {name: "PCパーツ"},
  {name: "その他"}
])
appliance_smartphone_camera_4.children.create([
  {name: "ポータブルプレーヤー"},
  {name: "イヤフォン"},
  {name: "ヘッドフォン"},
  {name: "アンプ"},
  {name: "スピーカー"},
  {name: "ケーブル/シールド"},
  {name: "ラジオ"},
  {name: "その他"}
])
appliance_smartphone_camera_5.children.create([
  {name: "冷蔵庫"},
  {name: "洗濯機"},
  {name: "炊飯器"},
  {name: "電子レンジ/オーブン"},
  {name: "調理機器"},
  {name: "アイロン"},
  {name: "掃除機"},
  {name: "その他"}
])

toy_hobby_goods_1.children.create([
  {name: "キャラクターグッズ"},
  {name: "ぬいぐるみ"},
  {name: "小物/アクセサリー"},
  {name: "模型/プラモデル"},
  {name: "ミニカー"},
  {name: "トイラジコン"},
  {name: "プラモデル"},
  {name: "鉄道模型"},
  {name: "その他"}
])
toy_hobby_goods_2.children.create([
  {name: "アイドル"},
  {name: "ミュージシャン"},
  {name: "タレント/お笑い芸人"},
  {name: "スポーツ選手"},
  {name: "その他"}
])
toy_hobby_goods_3.children.create([
  {name: "ストラップ"},
  {name: "キーホルダー"},
  {name: "バッジ"},
  {name: "カード"},
  {name: "クリアファイル"},
  {name: "ポスター"},
  {name: "タオル"},
  {name: "その他"}
])
toy_hobby_goods_4.children.create([
  {name: "エレキギター"},
  {name: "アコースティックギター"},
  {name: "ベース"},
  {name: "エフェクター"},
  {name: "アンプ"},
  {name: "弦楽器"},
  {name: "管楽器"},
  {name: "鍵盤楽器"},
  {name: "DJ機器"},
  {name: "その他"}
])
toy_hobby_goods_5.children.create([
  {name: "武具"},
  {name: "使用済切手/官製はがき"},
  {name: "旧貨幣/金貨/銀貨/記念硬貨"},
  {name: "印刷物"},
  {name: "ノベルティグッズ"},
  {name: "その他"}
])
toy_hobby_goods_6.children.create([
  {name: "トランプ/UNO"},
  {name: "カルタ/百人一首"},
  {name: "ダーツ"},
  {name: "ビリヤード"},
  {name: "麻雀"},
  {name: "パズル/ジグソーパズル"},
  {name: "囲碁/将棋"},
  {name: "オセロ/チェス"},
  {name: "その他"}
])

others_1.children.create([
  {name: "すべて"}
])
others_2.children.create([
  {name: "ペットフード"},
  {name: "犬用品"},
  {name: "猫用品"},
  {name: "魚用品/水草"},
  {name: "小動物用品"},
  {name: "爬虫類/両生類用品"},
  {name: "かご/おり"},
  {name: "鳥用品"},
  {name: "虫類用品"},
  {name: "その他"}
])
others_3.children.create([
  {name: "菓子"},
  {name: "米"},
  {name: "野菜"},
  {name: "果物"},
  {name: "調味料"},
  {name: "魚介類(加工食品)"},
  {name: "肉類(加工食品)"},
  {name: "その他"}
])
others_4.children.create([
  {name: "コーヒー"},
  {name: "ソフトドリンク"},
  {name: "ミネラルウォーター"},
  {name: "茶"},
  {name: "ウイスキー"},
  {name: "ワイン"},
  {name: "ビール、発泡酒"},
  {name: "焼酎"},
  {name: "日本酒"},
  {name: "その他"}
])
others_5.children.create([
  {name: "タオル/バス用品"},
  {name: "日用品/生活雑貨"},
  {name: "洗剤/柔軟剤"},
  {name: "旅行用品"},
  {name: "防災関連グッズ"},
  {name: "その他"}
])
others_6.children.create([
  {name: "筆記具"},
  {name: "ノート/メモ帳"},
  {name: "テープ/マスキングテープ"},
  {name: "カレンダー/スケジュール"},
  {name: "アルバム/スクラップ"},
  {name: "ファイル/バインダー"},
  {name: "はさみ/カッター"},
  {name: "カードホルダー/名刺管理"},
  {name: "その他"}
])


# sales_commisionsテーブル初期値
SalesCommission.create(rate: 10, adapt_date: Date.today)

# sales_managementsテーブル初期値
SalesManagement.create(sales: 0, profit: 0)