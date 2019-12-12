class AddTypeToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :type_no, :integer, null: false
  end
end
