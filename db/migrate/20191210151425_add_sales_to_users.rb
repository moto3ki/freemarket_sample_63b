class AddSalesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sales, :integer, default: 0
  end
end
