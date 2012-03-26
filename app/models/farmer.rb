class Farmer < ActiveRecord::Base

	has_many :dispensals, :dependent => :destroy

end
