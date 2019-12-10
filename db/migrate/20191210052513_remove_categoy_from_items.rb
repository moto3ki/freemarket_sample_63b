class RemoveCategoyFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :categoy_id, :integer
  end
end
