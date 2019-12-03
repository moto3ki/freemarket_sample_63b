class AddPrefectureIdToSendAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :send_addresses, :prefecture_id, :integer, foreign_key: true, null: false
  end
end
