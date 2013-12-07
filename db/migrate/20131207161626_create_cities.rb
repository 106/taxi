class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :taxi_id

      t.timestamps
    end
  end
end
