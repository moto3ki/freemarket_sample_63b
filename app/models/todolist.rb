class Todolist < ApplicationRecord

  def buyer_todo(user)
    self.user_id = user.id
    self.status  = 0
    self.title   = "購入が完了しました"
    self.content = "商品が届いたら評価してください。"
    self.date    = Date.today
    self.save
  end

  def seller_todo(item)
    self.user_id = item.user_id
    self.status  = 0
    self.title   = "商品が購入されました"
    self.content = "商品を発送してください。"
    self.date    = Date.today
    self.save
  end

end
