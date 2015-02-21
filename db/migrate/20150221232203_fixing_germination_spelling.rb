class FixingGerminationSpelling < ActiveRecord::Migration
  def up
  remove_column :dispensals, :germenation_rate
  add_column :dispensals, :germination_rate, :float
  end

  def down
  end
end
