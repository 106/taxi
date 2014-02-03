class Order < ActiveRecord::Base
  belongs_to :driver
  belongs_to :taxi
  belongs_to :user
  has_many :places

  validates :user_phone, presence: true, :on => :update, if: :phone_required?
  validate :at_least_one_address, on: :update

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

  def human_distance
    self.distance.present? ? (self.distance/1000.00).round(2) : 0
  end

  def from
    self.places.first
  end

  def additional
    { vip: self.vip,
      animals: self.animals,
      air_conditioning: self.air_conditioning,
      minivan: self.minivan,
      out_of_town: self.out_of_town,
      check: self.check
    }.select {|k, v| !!v}.keys
  end

  private

  def phone_required?
    self.state_was == "calculated"
  end

  def at_least_one_address
    errors.add(:order, I18n.t('order.errors.one_address')) if self.places.empty?
  end

end
