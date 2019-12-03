class CreateRealAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :real_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :post_code, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.timestamps
    end
  end
end
