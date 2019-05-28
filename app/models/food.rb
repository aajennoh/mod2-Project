class Food < ApplicationRecord
has_many :recipes, through: :meals
has_many  :recipe_foods



end
