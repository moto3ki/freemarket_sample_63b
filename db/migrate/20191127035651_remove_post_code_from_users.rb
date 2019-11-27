class RemovePostCodeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_code, :integer
  end
end
