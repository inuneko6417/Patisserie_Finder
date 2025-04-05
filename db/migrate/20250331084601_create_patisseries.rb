class CreatePatisseries < ActiveRecord::Migration[7.2]
  def change
    create_table :patisseries do |t|
      t.string :name
      t.string :address
      t.string :nearest_station
      t.boolean :eat_in
      t.boolean :takeout
      t.string :business_hours
      t.string :closed_on
      t.string :phone_number
      t.string :web_and_sns
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
