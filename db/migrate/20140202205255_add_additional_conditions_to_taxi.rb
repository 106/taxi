class AddAdditionalConditionsToTaxi < ActiveRecord::Migration
  def change
    add_column :taxis, :animals, :boolean
    add_column :taxis, :air_conditioning, :boolean
    add_column :taxis, :vip, :boolean
    add_column :taxis, :minivan, :boolean
    add_column :taxis, :out_of_town, :boolean
    add_column :taxis, :check, :boolean
  end
end
