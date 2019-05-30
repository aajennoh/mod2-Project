Rails.application.routes.draw do

get "/recipes/budget", to: "recipes#budget", as: "budget"
patch '/cart', to:"cart#update" 
get "/welcome", to: "users#welcome", as: "welcome"
get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'

resources :foods
resources :recipes
resources :users
resources :recipe_foods


get "/welcome", to: "users#welcome"
get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'



end
