class SpacingType < ActiveRecord::Migration
  def change
		change_column :seeds, :spacing, :string
	end
end
