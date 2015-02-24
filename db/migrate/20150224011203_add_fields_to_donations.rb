class AddFieldsToDonations < ActiveRecord::Migration
  def change
	add_column :donations, :seed_age, :integer
	add_column :donations, :is_donation, :boolean
  end
end
