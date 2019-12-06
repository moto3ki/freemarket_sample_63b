class ChangeDataPostCodeToRealAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :real_addresses, :post_code, :integer, default: 0
  end
end
