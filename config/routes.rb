Rails.application.routes.draw do

resources :foods
resources :recipes
resources :users
resources :recipe_foods



get "/welcome", to: "users#welcome"
get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'




end
