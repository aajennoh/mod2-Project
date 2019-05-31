Rails.application.routes.draw do

  #sorting index
  get "/recipes/index_breakfast", to: "recipes#breakfast"
  
  get "/recipes/index_snack", to: "recipes#snack"

  get "/recipes/index_dinner", to: "recipes#dinner"




get "/recipes/budget", to: "recipes#budget", as: "budget"
patch '/cart', to:"cart#update"
delete '/cart', to:'cart#destroy'
get "/welcome", to: "users#welcome", as: "welcome"
get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'

resources :foods
resources :recipes
resources :users
resources :recipe_foods




end
