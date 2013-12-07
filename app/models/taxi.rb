class Taxi < ActiveRecord::Base
	has_many :feedbacks
	has_many :orders
	has_many :drivers
end
