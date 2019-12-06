class ChangeConstraintColumnsToRealAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :real_addresses, :post_code, true
    change_column_null :real_addresses, :prefectures, true
    change_column_null :real_addresses, :city, true
    change_column_null :real_addresses, :address, true
    change_column_null :real_addresses, :building_name, true
  end
end
