class RemoveUniqueConstraintFromUsersEmail < ActiveRecord::Migration[7.2]
  def change
    remove_index :users, :email, unique: true
    add_index :users, :email
  end
end
