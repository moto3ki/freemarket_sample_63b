class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def paid_money
    self.pay_flg = 1
  end
end
