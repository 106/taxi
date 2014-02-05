class StaticPagesController < ApplicationController

	def about
    @feedback = Feedback.new
	end

	def partners
		@taxis = Taxi.all
	end

end
