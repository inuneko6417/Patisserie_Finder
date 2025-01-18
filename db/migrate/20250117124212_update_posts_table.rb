class UpdatePostsTable < ActiveRecord::Migration[7.2]
  def change
    rename_column :posts, :content, :body
    add_column :posts, :image_url, :string
  end
end
