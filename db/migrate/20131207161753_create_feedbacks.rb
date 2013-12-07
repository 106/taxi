class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :taxi_id
      t.integer :rank
      t.text :comment

      t.timestamps
    end
  end
end
