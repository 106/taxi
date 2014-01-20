class City < ActiveRecord::Base

	has_many :streets
	has_many :places

end
