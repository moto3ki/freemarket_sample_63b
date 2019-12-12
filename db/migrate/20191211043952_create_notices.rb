class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, foreign_key: true
      t.integer    :read_flg, default: 0
      t.string     :title, null: false
      t.text       :content
      t.date       :date
      t.timestamps
    end
  end
end
