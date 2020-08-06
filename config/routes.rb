Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#new", as: "login"
  resources :restaurants
  resources :users, only: [:index, :new]
  resources :food_types, only: [:index] do 
    resources :restaurants, only: [:index, :new], controller: 'food_types/restaurants'
  end

end



