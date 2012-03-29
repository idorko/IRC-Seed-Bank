class Indexes < ActiveRecord::Migration
  def change
		add_index :seeds, [:family, :id]
		add_index :donors, [:id, :name]
		add_index :farmers, [:id, :name]
		add_index :donations, [:id, :updated_at, :donor_id, :seed_id]
		add_index :dispensals, [:id, :updated_at, :farmer_id, :seed_id]
	end
end