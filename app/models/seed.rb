class Seed < ActiveRecord::Base
	
	has_and_belongs_to_many :donors, :join_table => 'donors_seeds'

	validates :family, :presence => true
	validates :variety, :presence => true
	
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
