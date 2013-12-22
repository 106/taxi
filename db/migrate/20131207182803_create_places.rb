class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city, default: 'Donetsk'
      t.string :street
      t.string :house
      t.integer :order_id

      t.timestamps
    end
  end
end
