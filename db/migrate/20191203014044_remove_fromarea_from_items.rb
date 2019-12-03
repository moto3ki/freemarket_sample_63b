class RemoveFromareaFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :from_area, :integer
    add_column :items, :prefecture_id, :integer, foreign_key: true, null: false
  end
end
