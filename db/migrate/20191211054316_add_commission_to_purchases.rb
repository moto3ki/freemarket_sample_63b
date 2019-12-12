class AddCommissionToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :fee, :integer, dafault: 0
  end
end
