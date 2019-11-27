class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true, null: false
      t.string     :name, null: false
      t.text       :explain, null: false
      t.integer    :status, null: false
      t.integer    :condition, null: false
      t.integer    :delivery_charge, null: false
      t.integer    :delivery_method, null: false
      t.string     :from_area, null: false
      t.integer    :delivery_period, null: false
      t.integer    :price, null: false
      t.integer    :like_cnt, null: false
      t.timestamps
    end
    add_index :items, :name
    add_index :items, :status
    add_index :items, :condition
    add_index :items, :delivery_period
    add_index :items, :price
  end
end
