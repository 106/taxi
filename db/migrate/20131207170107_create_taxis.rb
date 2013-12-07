class CreateTaxis < ActiveRecord::Migration
  def change
    create_table :taxis do |t|
      t.string :name
      t.string :phone
      t.string :website
      t.float :default_price
      t.float :price_for_km
      t.float :rank
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
