Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants

  resources :food_types, only: [:index] do 
    resources :restaurants, only: [:index], controller: 'food_types/restaurants'
  end

end
