class CreateDispensals < ActiveRecord::Migration
  def change
    create_table :dispensals do |t|
      t.string :family
      t.string :variety
      t.integer :quantity

      t.timestamps
    end
  end
end
