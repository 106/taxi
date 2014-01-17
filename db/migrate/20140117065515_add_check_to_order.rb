class AddCheckToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :check, :boolean
  end
end
