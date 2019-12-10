class CreateSalesManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_managements do |t|
      t.integer :sales,  default: 0
      t.integer :profit, default: 0
      t.timestamps
    end
  end
end
