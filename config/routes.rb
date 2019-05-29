Rails.application.routes.draw do

resources :foods
resources :recipes
resources :users

get "/welcome", to: "users#welcome"

# get "/tester/", to: "workouts#index"
#
# get "/workouts/new", to: "workouts#new"
# post "/workouts", to: "workouts#create"
#
# get "/workouts/:id/edit", to: "workouts#edit"
# patch "/workouts/:id", to: "workouts#update"
#
# get "/workouts/:id", to: "workouts#show"
# delete "workouts/:id", to: "workouts#delete"
#



resources :recipe_foods


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
