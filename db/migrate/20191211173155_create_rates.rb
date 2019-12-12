class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, null: false, foreign_key: true
      t.integer    :good,   default: 0
      t.integer    :normal, default: 0
      t.integer    :bad,    default: 0
      t.timestamps
    end
  end
end
