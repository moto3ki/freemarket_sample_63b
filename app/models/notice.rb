class Notice < ApplicationRecord

  def purchased_item_notice(user, item)
    self.user_id = user.id
    self.item_id = item.id
    self.read_flg = 0
    self.title   = "購入が完了しました"
    self.content = "商品が届いたら評価してください。"
    self.date    = Date.today
    self.save
  end

end
