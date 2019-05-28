Rails.application.routes.draw do

resources :foods
resources :recipes
resources :users


resources :recipe_foods


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
