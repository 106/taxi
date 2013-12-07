class Feedback < ActiveRecord::Base
	belongs_to :taxi
	belongs_to :user
end
