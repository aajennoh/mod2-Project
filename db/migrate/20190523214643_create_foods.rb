class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.integer :protein
      t.integer :calories
      t.boolean :gluten
      t.timestamps
    end
  end
end
