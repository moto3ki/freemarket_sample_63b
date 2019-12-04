# カテゴリー親要素
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
baby_kids = Category.create(name: "ベイビー・キッズ")

# カテゴリー子要素
lady_1 = lady.children.create(name: "トップス")
lady_2 = lady.children.create(name: "ジャケット/アウター")
man_1 = man.children.create(name: "トップス")
man_2 = man.children.create(name: "ジャケット/アウター")
baby_kids_1 = baby_kids.children.create(name: "ベビー服(女の子用) ~95cm")
baby_kids_2 = baby_kids.children.create(name: "ベビー服(男の子用) ~95cm")


# カテゴリー孫要素
lady_1.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"},
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "シャツ/ブラウス(半袖/袖なし)"}
])
lady_2.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"}
])
man_1.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"},
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "シャツ"}
])
man_2.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"}
])
baby_kids_1.children.create([
  {name: "トップス"},
  {name: "アウター"},
  {name: "パンツ"}
])
baby_kids_2.children.create([
  {name: "トップス"},
  {name: "アウター"},
  {name: "パンツ"}
])

