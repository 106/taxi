class Place < ActiveRecord::Base
	belongs_to :order
	belongs_to :city

	validates :city_id, presence: true
	validates :street, presence: true
	validates :house, presence: true
	validates :uniq_id, presence: true, uniqueness: true

	before_save :set_cords

	def get_address
		"#{formated('Ukraine')},+#{formated(self.city.name)},+#{formated(self.street)},+#{formated(self.house)}"
	end

	def human_address
		addr = "#{self.street}, #{self.house}"
		addr << ", #{self.porch}п." if self.porch.present?
	end

	private

	def formated str
		Russian.translit(str).split.join('+')
		# str.split.join('+')
	end

	def set_cords
		response = HTTParty.get(URI.encode("http://geocode-maps.yandex.ru/1.x/?geocode=#{get_address}&format=json"))
		self.longitude, self.latitude = response["response"]["GeoObjectCollection"]["featureMember"].first["GeoObject"]["Point"]["pos"].split
	end

end
