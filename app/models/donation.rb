class Donation < ActiveRecord::Base
	belongs_to :donor
	belongs_to :seed
	belongs_to :farmer
	before_destroy :update_seeds
	def pounds
		return "#{self.quantity.floor / 16} lbs, #{((self.quantity % 16)*1000).round.to_f / 1000} oz"
	end
	def ounces
		return "#{((self.quantity % 16)*1000).round.to_f / 1000} oz"
	end
	def update_seeds
		self.quantity = 0.0
		self.save
		self.seed.update_quantity
	end
	
	def date
		self.updated_at.strftime("%m/%d/%Y")
	end
end
