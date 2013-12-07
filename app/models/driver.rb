class Driver < ActiveRecord::Base
	belongs_to :taxi
	has_many :orders
end
