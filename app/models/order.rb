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
  	self.params_calculated
  end
  
end

