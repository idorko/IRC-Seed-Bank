class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :family
      t.string :variety
      t.integer :quantity

      t.timestamps
    end
  end
end
