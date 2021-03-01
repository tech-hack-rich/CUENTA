class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.references :account, null:false, foreign_key: true
      t.integer    :amount,  null:false
      t.date       :date,    null:false
      t.timestamps
    end
  end
end
