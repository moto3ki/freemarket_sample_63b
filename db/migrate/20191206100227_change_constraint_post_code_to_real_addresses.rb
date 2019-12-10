class ChangeConstraintPostCodeToRealAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_default :real_addresses, :post_code, nil
  end
end
