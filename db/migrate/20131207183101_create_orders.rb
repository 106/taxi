class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :taxi_id
      t.integer :user_id
      t.float :cost
      t.float :distance
      t.integer :driver_id
      t.string :user_phone

      t.timestamps
    end
  end
end
