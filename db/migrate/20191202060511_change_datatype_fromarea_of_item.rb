class ChangeDatatypeFromareaOfItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :from_area, :integer
  end
end
