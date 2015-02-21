class AddCommentsToSeed < ActiveRecord::Migration
  def change
    add_column :seeds, :comments, :string
  end
end
