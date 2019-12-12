class AddSendFlgToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :send_flg, :integer, default: 0
  end
end
