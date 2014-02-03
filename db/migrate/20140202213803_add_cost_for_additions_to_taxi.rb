class AddCostForAdditionsToTaxi < ActiveRecord::Migration
  def change
    add_column :taxis, :animals_price, :float, default: 0
    add_column :taxis, :air_conditioning_price, :float, default: 0
    add_column :taxis, :vip_price, :float, default: 1
    add_column :taxis, :minivan_price, :float, default: 0
    add_column :taxis, :out_of_town_price, :float, default: 0
    add_column :taxis, :check_price, :float, default: 0
  end
end
