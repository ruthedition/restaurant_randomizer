Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "application#index"
  
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create", as: "session"
  delete '/sessions', to: "sessions#destroy", as: "logout"

  get '/auth/facebook/callback' => 'sessions#omni_create'

  resources :users
  resources :restaurants
  
  resources :food_types, only: [:index, :show] do 
    resources :restaurants, only: [:index, :new], controller: 'food_types/restaurants'
  end

  resources :users, only: [:show] do 
    resources :restaurants, only: [:index, :new], controller: 'users/restaurants'
  end 

end



