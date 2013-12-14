class Order < ActiveRecord::Base
	belongs_to :driver
	belongs_to :taxi
	belongs_to :user
	has_many :places

	accepts_nested_attributes_for :places
end

