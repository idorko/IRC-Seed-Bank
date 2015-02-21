class AddColumnsToDispensals < ActiveRecord::Migration
    def change
    add_column :dispensals, :comments, :string
    add_column :dispensals, :tissue_samples,:string
    add_column :dispensals, :planting_date, :date
    add_column :dispensals, :harvest_date, :date
    add_column :dispensals, :water_usage, :float
    add_column :dispensals, :soil_test_zone, :integer
    add_column :dispensals, :row_feet,  :integer
    add_column :dispensals, :germenation_rate, :float
  end
end
