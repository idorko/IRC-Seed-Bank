class FarmersDonations < ActiveRecord::Migration
  def change
		add_column :donations, :farmer_id, :integer
			
	end
end
