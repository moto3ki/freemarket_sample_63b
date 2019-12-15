crumb :root do
  link "メルカリ", root_path
end

crumb :category_list do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category_title do
  @category = Category.find(params[:id])
  link @category.name, category_path
  parent :category_list
end

crumb :user_page do
  user = User.find(params[:id])
  link user.nickname, user_path
  parent :root
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :notices do
  link "お知らせ", notices_users_path
  parent :mypage
end

crumb :todolists do
  link "やることリスト", todolists_users_path
  parent :mypage
end

crumb :sell_items do
  link "出品した商品 - 出品中", sell_items_users_path
  parent :mypage
end

crumb :selling_items do
  link "出品した商品 - 取引中", selling_items_users_path
  parent :mypage
end

crumb :sold_items do
  link "出品した商品 - 売却済み", sold_items_users_path
  parent :mypage
end

crumb :buying_items do
  link "購入した商品 - 取引中", buying_items_users_path
  parent :mypage
end

crumb :bought_items do
  link "購入した商品 - 過去の取引", bought_items_users_path
  parent :mypage
end

crumb :sold_score do
  link "売上・振込申請", sold_score_users_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :change_address do
  link "発送元・お届け先住所変更", new_user_send_address_path
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

crumb :send_address do
  link "配送元・お届け先住所の登録", new_user_send_address_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end