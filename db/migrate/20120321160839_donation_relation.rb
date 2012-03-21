class DonationRelation < ActiveRecord::Migration
  def change
		add_column :donations, :donor_id, :integer
		add_column :donations, :seed_id, :integer
	end
end
