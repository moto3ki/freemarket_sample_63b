class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|
      t.references :user, null: false, foreign_key: true
      t.integer    :status, default: 0
      t.string     :title, null: false
      t.text       :content
      t.date       :date
      t.timestamps
    end
  end
end
