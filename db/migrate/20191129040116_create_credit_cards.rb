class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer  :user_id,               null: false, foreign_key: true
      t.string  :customer_id,               null: false, foreign_key: true
      t.string  :card_id,               null: false, foreign_key: true

      t.timestamps  null: false
    end
  end
end
