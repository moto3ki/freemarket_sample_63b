class ChangeConstraintBuildingNameToRealAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_default :real_addresses, :building_name, nil
  end
end
