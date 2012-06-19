class ChangeSeedDataType < ActiveRecord::Migration
  def up
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
