class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :number
      t.string :car
      t.string :car_naumber
      t.integer :taxi_id

      t.timestamps
    end
  end
end
