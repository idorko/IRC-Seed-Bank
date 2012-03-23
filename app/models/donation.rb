class Donation < ActiveRecord::Base
	belongs_to :donor
	belongs_to :seed

	def pounds
		return "#{self.quantity / 16} lbs, #{self.quantity % 16} oz"
	end
	def ounces
		return "#{self.quantity} oz"
	end
end
