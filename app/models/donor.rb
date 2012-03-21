class Donor < ActiveRecord::Base

	has_and_belongs_to_many :seeds, :join_table => 'donors_seeds'

end
