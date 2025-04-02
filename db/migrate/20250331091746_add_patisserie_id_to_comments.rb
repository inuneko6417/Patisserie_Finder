class AddPatisserieIdToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :patisserie_id, :bigint
    add_index :comments, :patisserie_id
    add_foreign_key :comments, :patisseries, column: :patisserie_id
  end
end
