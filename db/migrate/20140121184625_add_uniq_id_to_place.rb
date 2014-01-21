class AddUniqIdToPlace < ActiveRecord::Migration
  def change
    add_column :places, :uniq_id, :string
  end
end
