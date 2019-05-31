class Recipe < ApplicationRecord
belongs_to :user, required: false
has_many  :recipe_foods
has_many :foods, through: :recipe_foods
accepts_nested_attributes_for :foods, allow_destroy: true

validates :name, presence: true
validates :description, presence: true

def info_fill
  self.total_cost
  self.total_gains
  self.total_cals
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
  self.foods.select {|food| food.gluten}
end

def self.search(search)
  if search
    byebug
    budget = Recipe.select{|recipe| recipe.total_cost <= search.to_f}
    if budget.nil?
      budget = Recipe.all
    end
  else
    budget = Recipe.all
  end
  budget
end



end
