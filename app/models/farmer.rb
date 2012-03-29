class Farmer < ActiveRecord::Base

	has_many :dispensals, :dependent => :destroy
	has_many :donations, :dependent => :destroy

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

end
