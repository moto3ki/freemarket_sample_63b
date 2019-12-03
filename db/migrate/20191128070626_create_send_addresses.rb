class CreateSendAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :send_addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.string  :kanji_last_name,    null: false
      t.string  :kanji_first_name,   null: false
      t.string  :kana_last_name,     null: false
      t.string  :kana_first_name,    null: false
      t.string  :post_code,          null: false
      t.string  :prefectures,        null: false
      t.string  :city,               null: false
      t.string  :address,            null: false
      t.string  :building_name
      t.string  :tel_no
      t.timestamps
    end
  end
end
