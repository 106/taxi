class AddRegionToPlace < ActiveRecord::Migration
  def change
    add_column :places, :region, :string, default: 'Donetsk'
  end
end
