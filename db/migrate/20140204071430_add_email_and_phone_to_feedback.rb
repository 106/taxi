class AddEmailAndPhoneToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :email, :string
    add_column :feedbacks, :phone, :string
  end
end
