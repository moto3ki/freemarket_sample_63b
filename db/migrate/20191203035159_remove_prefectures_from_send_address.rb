class RemovePrefecturesFromSendAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :send_addresses, :prefectures, :string
  end
end
