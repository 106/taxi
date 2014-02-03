class AddCarColorToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :car_color, :string
  end
end
