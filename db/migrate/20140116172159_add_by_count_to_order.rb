class AddByCountToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :by_count, :boolean
  end
end
