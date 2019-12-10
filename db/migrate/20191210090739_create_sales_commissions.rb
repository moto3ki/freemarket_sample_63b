class CreateSalesCommissions < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_commissions do |t|
      t.integer :rate, null: false
      t.date    :adapt_date, null: false
      t.timestamps
    end
  end
end
