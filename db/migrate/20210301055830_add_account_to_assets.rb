class AddAccountToAssets < ActiveRecord::Migration[6.0]
  def change
    add_reference :assets, :account, null: false, foreign_key: true
  end
end
