class Food < ApplicationRecord
has_many :recipes, through: :recipe_foods
has_many  :recipe_foods
validates :protein, :calories, :price, :presence => true


end
