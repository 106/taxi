class Place < ActiveRecord::Base
	belongs_to :order

	def get_address
		"Ukraine,#{formated(self.city)},#{formated(self.street)},#{formated(self.house)}"
	end

	private

	def formated str
		Russian.translit(str).split.join('+')
	end

end
