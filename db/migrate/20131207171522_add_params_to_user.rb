class AddParamsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :points, :integer
  end
end
