Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get '/signup', to: 'users#new'
  get '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'models_visible#index', as: 'home'
  resources :users
end