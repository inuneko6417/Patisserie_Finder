class AddDescriptionToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :description, :string
  end
end
