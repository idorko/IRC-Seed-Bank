class FarmerRelations < ActiveRecord::Migration
  def change
		add_column :dispensals, :farmer_id, :integer
		add_column :dispensals, :seed_id, :integer
	end
end
