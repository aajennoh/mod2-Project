class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.float :total_price
      t.string :category
      t.integer :total_protein
      t.integer :total_calories
      t.integer :user_id
      t.timestamps
    end
  end
end
