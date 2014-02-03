class Taxi < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :feedbacks
	has_many :orders
	has_many :drivers

	def cost_for_distance(distance)
		costed_distance = distance - self.min_distance
		costed_distance = 0 if costed_distance < 0
		price = (costed_distance * price_for_km + default_price)
    price_with_additional(price).ceil + 1
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

  def price_with_additional price
    (price + self.animals_price + out_of_town_price) * vip_price + check_price + self.minivan_price + air_conditioning_price
  end

end
