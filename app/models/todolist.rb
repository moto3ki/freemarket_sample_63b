class Todolist < ApplicationRecord
  
  belongs_to :user
  belongs_to :item

  def send_item_todo(buyer, item)
    self.user_id = item.user_id
    self.status  = 0
    self.todo_no = 1
    self.title   = "商品が購入されました"
    self.content = "#{item.user.nickname}さんが#{item.name}を購入しました。発送してください。"
    self.date    = Date.today
    self.item_id = item.id
  end

  def evaluate_todo(purchase)
    self.user_id = purchase.user_id
    self.status  = 0
    self.todo_no = 2
    self.title   = "商品が発送されました"
    self.content = "商品が発送されました。商品が到着したら、出品者の評価をしてください。"
    self.date    = Date.today
    self.item_id = purchase.item_id
  end

  def complete_todo
    self.status = 1
  end
end
