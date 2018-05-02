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
  get '/view', to: 'model_view#show'
  post '/view', to: 'model_view#show'
  put '/view', to: 'model_view#show'

 # post '/post_request', to: 'model_view#post_request'
  get '/button', to: 'model_view#post_request', as: 'button'
  get '/button1', to: 'model_view#prepost_request', as: 'button1'

  get '/graph', to: 'model_view#show_graph'
  get '/questionnaire', to: 'model_view#show_questionnaire'
  get '/finish_questionnaire', to: 'model_view#finish_questionnaire'

  post '/subchoice', to: 'model_view#subchoice', as: 'subchoice'

  resources :users
end
