class AddImageUrlsToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :image_url_1, :string
    add_column :posts, :image_url_2, :string
    add_column :posts, :image_url_3, :string
  end
end
