class Seed < ActiveRecord::Base
	
	has_many :donations, :dependent => :destroy
	has_many :dispensals, :dependent => :destroy

	validates :family, :presence => true
	validates :variety, :presence => true
	validates_length_of :description, :in => 1..255, :allow_blank => true
	
	def pounds
		return "#{self.quantity / 16} lbs, #{self.quantity % 16} oz"
	end
	def ounces
		return "#{self.quantity} oz"
	end
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
 
	def humanize
		"#{self.variety} #{self.family}"
	end

	def name
		self.humanize
	end

	def self.family_list
		#list all unique families
		@families = []
		Seed.all.each do |seed|
			@families << seed.family
			@families = @families.uniq
		end
		return @families
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
