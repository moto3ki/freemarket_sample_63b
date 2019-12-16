class CreateSalesHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint     :notice_todolist_id, null: false
      t.integer    :notice_todolist_status, null: false
      t.integer    :price, null: false, default: 0
      t.timestamps
    end
  end
end
