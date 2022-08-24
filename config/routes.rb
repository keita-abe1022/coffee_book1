Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    resources :coffees, only: [:index, :show, :create, :update, :destroy]
    post 'signup', controller: :users, action: :create
    post 'signin', controller: :sessions, action: :create
    delete 'signin', controller: :sessions, action: :destroy
    post 'refresh', controller: :refresh, action: :create
  end
end
