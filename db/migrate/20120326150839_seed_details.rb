class SeedDetails < ActiveRecord::Migration
  def change
		add_column :seeds, :spacing, :integer
		add_column :seeds, :maturity, :string
		add_column :seeds, :common_names, :string
		add_column :seeds, :description, :string

		add_column :donors, :contact_name, :string
		add_column :donors, :contact_email, :string
		add_column :donors, :contact_phone, :string

		add_column :donations, :value, :float
		
		add_column :farmers, :language, :string
		add_column :farmers, :country, :string
		add_column :farmers, :farm_site, :string

	end
end
