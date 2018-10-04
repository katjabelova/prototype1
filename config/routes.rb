Rails.application.routes.draw do
  #root 'models_visible#index', as: 'home'
  root 'first_screens#firstScreen', as: 'home'

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
  get '/view', to: 'model_view#show'
  post '/view', to: 'model_view#show'
  put '/view', to: 'model_view#show'

 # post '/post_request', to: 'model_view#post_request'
  get '/button', to: 'model_view#post_request', as: 'button'
  get '/button1', to: 'model_view#prepost_request', as: 'button1'

  get '/graph', to: 'model_view#show_graph'
  get '/graph2', to: 'model_view#show_graph2'
  get '/model_view/:id', to: 'model_view#show_graph3', as: 'graph3'
  get '/model_view/:id', to: 'model_view#show_graph4', as: 'graph4'
  post '/modelinfo', to: 'model_view#model_info', as: 'modelinfo'
#  get '/graph3', to: 'model_view#show_graph3'
  post '/subchoice', to: 'model_view#subchoice', as: 'subchoice'

  get '/admin_path', to: 'admin#admin_view'

  get '/edit', to: 'users#edit'

  resources :users
end
