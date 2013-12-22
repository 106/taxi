class Order < ActiveRecord::Base
  belongs_to :driver
  belongs_to :taxi
  belongs_to :user
  has_many :places

  COLORS = ['green', 'red', 'purple', 'yellow', 'blue', 'orange', 'black', 'white', 'brown']
  LETTERS = ("A".."Z").to_a

  validates :user_phone, presence: true, :on => :update

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
    p response
    response["routes"].first['legs'].map {|l| l["distance"]['value']}.reduce(:+) 
  end

  def url_to_google #TODO Rewrite this in Ruby style
    host = 'http://maps.googleapis.com/maps/api/directions/json?'
    start, *waypoints, finish = self.places
    host << "origin=#{start.get_address}&destination=#{finish.get_address}"
    host << "&waypoints=#{formated(waypoints)}" if self.places.count > 2
    host << '&sensor=false'
  end

  def formated points
    points.map {|p| p.get_address}.join('|')
  end

  def route
    link = "http://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap"
    points = self.places.reduce('') {|res, place|
      index = self.places.index(place)
      res << "&markers=color:#{COLORS[index]}%7Clabel:#{LETTERS[index]}%7C#{place.latitude},#{place.longitude}"
    }
    link << points << "&sensor=false"
  end

  
end

