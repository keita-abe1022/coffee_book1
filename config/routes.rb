Rails.application.routes.draw do
  root to: 'home#index'
  resources :coffees, only: [:index]
  namespace :api do
    resources :coffees, only: [:show]
  end
end
