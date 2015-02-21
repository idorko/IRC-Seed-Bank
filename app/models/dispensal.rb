class Dispensal < ActiveRecord::Base
	belongs_to :seed
	belongs_to :farmer
	before_destroy :update_seeds
	def pounds
		if(self.quantity < 1)
			return "#{(self.quantity * 28.3495).round.to_f} g"
		else
			return "#{self.quantity.floor / 16} lbs, #{((self.quantity % 16)*1000).round.to_f / 1000} oz"
		end
	end
	def ounces
		if(self.quantity < 1)
			return "#{(self.quantity * 28.3495).round.to_f} g"
		else
			return "#{((self.quantity % 16)*1000).round.to_f / 1000} oz"
		end
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
