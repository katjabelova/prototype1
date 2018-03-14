Rails.application.routes.draw do

  root 'models_visible#index', as: 'home'

  get 'sessions/new'
  get 'users/new'
  get '/signup', to: 'users#new'
  get '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/about', to: 'models_visible#about'
  get '/usecase', to: 'models_visible#use_case'
  get '/modelslist', to: 'modelslist#show'
  get '/model', to: 'model#show'
  post '/model', to: 'model#show'
  put '/model', to: 'model#show'

  post '/post_request', to: 'model#post_request'
  get '/button', to: 'model#post_request', as: 'button'
  get '/button1', to: 'model#prepost_request', as: 'button1'

  resources :users
end