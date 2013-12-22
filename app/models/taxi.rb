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
		(costed_distance * price_for_km + default_price)
	end
end
