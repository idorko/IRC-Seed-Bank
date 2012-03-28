class Donation < ActiveRecord::Base
	belongs_to :donor
	belongs_to :seed
	before_destroy :update_seeds
	def pounds
		return "#{self.quantity / 16} lbs, #{self.quantity % 16} oz"
	end

	def ounces
		return "#{self.quantity} oz"
	end

	def update_seeds
		self.quantity = 0
		self.save
		self.seed.update_quantity
	end
	
	def date
		self.updated_at.strftime("%m/%d/%Y")
	end
end
