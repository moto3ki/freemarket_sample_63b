class AddPayPointToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :price, :integer, default: 0
    add_column :purchases, :profit, :integer, default: 0
    add_column :purchases, :pay_flg, :integer
  end
end
