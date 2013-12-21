class Order < ActiveRecord::Base
  belongs_to :driver
  belongs_to :taxi
  belongs_to :user
  has_many :places

	state_machine :state, initial: :pending do

	  state :pending, :calculated, :created, :in_progress, :closed, :canceled
	  
	  event :params_calculated do
	    transition pending: :calculated
	  end

	  event :taxi_was_choosen do
      transition calculated: :created
    end

    event :driver_was_choosen do
    	transition created: :in_progress
    end

    event :close do
    	transition in_progress: :closed
    end

    event :cancel do
    	transition [:created, :in_progress] => :canceled
    end

  end

  def get_distance
    response = HTTParty.get(URI.encode(url_to_google))
    response["routes"].first['legs'].first["distance"]['value']  	
  end

  def url_to_google
    host = 'http://maps.googleapis.com/maps/api/directions/json?'
    start, *waypoints, finish = self.places
    host << "origin=#{start.get_address}&destination=#{finish.get_address}&sensor=false"
    
  end
  
end

