Rails.application.routes.draw do
  root to: 'home#index'
  # get '*path', to: 'home#index'
  get '/signup', to: 'home#index'
  get '/signin', to: 'home#index'
  get '/create', to:  'home#index'
  get '/edit/:id', to: 'home#index'
  get '/user/:id', to: 'home#index'

  namespace :api do
    resources :coffees, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:index, :show, :create, :update, :destroy]
    post 'signup', controller: :users, action: :create
    post 'signin', controller: :sessions, action: :create
    delete 'signin', controller: :sessions, action: :destroy
    post 'refresh', controller: :refresh, action: :create
  end
end
