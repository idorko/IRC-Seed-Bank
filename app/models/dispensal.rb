class Dispensal < ActiveRecord::Base
	belongs_to :seed
	belongs_to :farmer

	def pounds
		return "#{self.quantity / 16} lbs, #{self.quantity % 16} oz"
	end
	def ounces
		return "#{self.quantity} oz"
	end
end
