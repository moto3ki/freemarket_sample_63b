class RemoveSendAdressFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :send_adress, :text
  end
end
