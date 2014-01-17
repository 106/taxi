class AddTypesToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :animals, :boolean
  	add_column :orders, :air_conditioning, :boolean
  	add_column :orders, :vip, :boolean
    add_column :orders, :minivan, :boolean
    add_column :orders, :out_of_town, :boolean
  end
end
