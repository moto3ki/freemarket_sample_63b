class AddTodoNoToTodolists < ActiveRecord::Migration[5.2]
  def change
    add_column :todolists, :todo_no, :integer, null: false
    add_reference :todolists, :item, foreign_key: true
  end
end
