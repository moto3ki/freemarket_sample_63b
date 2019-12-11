class SalesManagement < ApplicationRecord

  def add_sales(price)
    self.sales += price
  end
  
end
