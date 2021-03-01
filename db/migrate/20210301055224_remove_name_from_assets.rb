class RemoveNameFromAssets < ActiveRecord::Migration[6.0]
  def change
    remove_reference :assets, :user, null: false, foreign_key: true
  end
end
