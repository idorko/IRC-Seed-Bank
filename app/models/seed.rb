class Seed < ActiveRecord::Base
	
	has_many :donations
	has_many :dispensals

	validates :family, :presence => true
	validates :variety, :presence => true
	

	def update_quantity
		#get total quantity of seeds in bank based on 
		#donations and dispensals
		total = 0
		donations.each do |donation|
			total += donation.quantity
		end
		dispensals.each do |dispensal|
			total -= dispensal.quantity
		end
		update_attributes(:quantity => total)
	end
 
	def self.search(variety, family)
		#find seeds based on variety and family 
		#or get all seeds
		if variety or family
			if !variety.empty? and !family.empty?
				find(:all, :conditions => ["variety = ? and family = ?", variety, family])
			elsif !variety.empty? and family.empty?
				find(:all, :conditions => ["variety = ?", variety])
			elsif !family.empty?
				find(:all, :conditions => ["family = ?", family])		
			end
		else
			find(:all)
		end 
	end
end
