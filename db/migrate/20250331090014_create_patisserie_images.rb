class CreatePatisserieImages < ActiveRecord::Migration[7.2]
  def change
    create_table :patisserie_images do |t|
      t.references :patisserie, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
