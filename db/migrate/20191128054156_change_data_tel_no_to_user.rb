class ChangeDataTelNoToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tel_no, :string
  end
end
