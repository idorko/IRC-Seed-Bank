class Relations < ActiveRecord::Migration
  def change
		create_table :donors_seeds, :id => false do |t|
			t.references :donor, :seed
		end
	end
end
