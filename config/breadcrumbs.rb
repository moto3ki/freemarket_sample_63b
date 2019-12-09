crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :selling_items do
  link "出品した商品 - 出品中", selling_items_users_path
  parent :mypage
end

crumb :sold_items do
  link "出品した商品 - 売却済み", sold_items_users_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :credit_cards do
  link "支払い方法", new_credit_card_path
  parent :mypage
end

crumb :real_address do
  link "本人情報の登録", new_user_real_address_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end