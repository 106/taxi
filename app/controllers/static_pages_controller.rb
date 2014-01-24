class StaticPagesController < ApplicationController

	def about
	end

	def partners
		@taxis = Taxi.all
	end

end
