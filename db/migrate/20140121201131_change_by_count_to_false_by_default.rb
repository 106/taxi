class ChangeByCountToFalseByDefault < ActiveRecord::Migration
  def change
  	change_column :orders, :by_count, :boolean, default: false
  end
end
