class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :city_id
      t.string :address
      t.integer :order_id

      t.timestamps
    end
  end
end
