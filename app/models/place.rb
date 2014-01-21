class Place < ActiveRecord::Base
	belongs_to :order
	belongs_to :city

	validates :city_id, presence: true
	validates :street, presence: true
	validates :house, presence: true

	before_save :set_cords

	def get_address
		"Ukraine,#{formated(self.region)},#{formated(self.city.name)},#{formated(self.street)},#{formated(self.house)}"
	end

	private

	def formated str
		Russian.translit(str).split.join('+')
		# str.split.join('+')
	end

	def set_cords
		response = HTTParty.get(URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{get_address}&sensor=false"))
		self.latitude = response["results"].first['geometry']['location']['lat']
		self.longitude = response["results"].first['geometry']['location']['lng']
	end

end


# Digest::SHA1.hexdigest()
