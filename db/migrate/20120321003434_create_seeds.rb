class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :family
      t.string :variety
      t.integer :quantity

      t.timestamps
    end
  end
end
