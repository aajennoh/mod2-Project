class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price, :default => 0
      t.integer :protein, :default => 0
      t.integer :calories, :default => 0
      t.boolean :gluten
      t.timestamps
    end
  end
end
