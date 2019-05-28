class Recipe < ApplicationRecord
belongs_to :user, required: false
has_many  :recipe_foods
has_many :foods, through: :recipe_foods



def info_fill
  self.total_cost
  self.total_gains
  self.total_cals
  self.gluten?
end




def total_cost
  total = 0
  self.foods.each {|food| total += food.price }
  self.total_price = total
end

def total_gains
  total = 0
  self.foods.each {|food| total += food.protein }
  self.total_protein = total
end

def total_cals
  total = 0
  self.foods.each {|food| total += food.calories }
  self.total_calories = total
end

def gluten?
  byebug
  self.foods.gluten.sum >= 1
end





end
