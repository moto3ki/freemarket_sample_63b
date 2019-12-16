class Notice < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def purchased_item_to_buyer(user, item)
    self.user_id = user.id
    self.item_id = item.id
    self.read_flg = 0
    self.title   = "購入が完了しました"
    self.content = "「#{item.name}」を購入しました。発送までしばらくお待ちください。"
    self.date    = Date.today
    self.type_no = 1
  end

  def rated_and_paid_to_seller(user, item)
    self.user_id = user.id
    self.item_id = item.id
    self.read_flg = 0
    self.title   = "購入者から評価されました"
    self.content = "購入者から評価されました。入金が行われたためご確認ください。"
    self.type_no = 2
    self.date    = Date.today
  end

  def already_read
    self.read_flg = 1
  end
end
