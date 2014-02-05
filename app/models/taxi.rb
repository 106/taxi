class Taxi < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
	has_many :drivers

	def cost_for_distance(order)
    distance = order.human_distance
		costed_distance = distance - self.min_distance
		costed_distance = 0 if costed_distance < 0
		price = (costed_distance * price_for_km + default_price)
    price_with_additional(price, order).ceil + 1
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

  def price_with_additional price, order
    (price = price + self.animals_price) if order.animals.present?
    (price = price + out_of_town_price) if order.out_of_town.present?
    (price = price * vip_price) if order.vip.present?
    (price = price + check_price) if order.check.present?
    (price = price +self.minivan_price) if order.minivan.present?
    (price = price + air_conditioning_price) if order.air_conditioning.present?
    price
  end

end
