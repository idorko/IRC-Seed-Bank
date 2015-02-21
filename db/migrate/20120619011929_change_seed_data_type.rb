class ChangeSeedDataType < ActiveRecord::Migration
  def up
		remove_index :donations, :name => 'donations_index'
		remove_index :dispensals, :name => 'dispensals_index' 	
		add_index :donations, [:id, :updated_at, :donor_id, :seed_id], :name => 'donations_index'
		add_index :dispensals, [:id, :updated_at, :farmer_id, :seed_id], :name => 'dispensals_index'
		change_table :seeds do |t|
			t.change :quantity, :float
		end
		change_table :donations do |t|
			t.change :quantity, :float
		end
		change_table :dispensals do |t|
			t.change :quantity, :float
		end
  end

  def down
		change_table :seeds do |t|
			t.change :quantity, :integer
		end
		change_table :donations do |t|
			t.change :quantity, :integer
		end
		change_table :dispensals do |t|
			t.change :quantity, :integer
		end
  end
end
