class Todolist < ApplicationRecord
  
  belongs_to :user
  belongs_to :item

  def buyer_todo(user, item)
    self.user_id = user.id
    self.status  = 0
    self.todo_no = 1
    self.title   = "購入が完了しました"
    self.content = "商品が届いたら評価してください。"
    self.date    = Date.today
    self.item_id = item.id
    self.save
  end

  def seller_todo(item)
    self.user_id = item.user_id
    self.status  = 0
    self.todo_no = 2
    self.title   = "商品が購入されました"
    self.content = "商品を発送してください。"
    self.date    = Date.today
    self.item_id = item.id
    self.save
  end

end
