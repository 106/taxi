class AddMinDistanceToTaxi < ActiveRecord::Migration
  def change
    add_column :taxis, :min_distance, :float
  end
end
