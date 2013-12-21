class AddPorchToPlace < ActiveRecord::Migration
  def change
    add_column :places, :porch, :integer
  end
end
