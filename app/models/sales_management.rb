class SalesManagement < ApplicationRecord

  def add_sales(price)
    self.sales += price
  end

  def pay_money_add_profit(pay_money, fee)
    self.sales -= pay_money
    self.sales += fee
  end
  
end
