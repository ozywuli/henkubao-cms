Rails.application.routes.draw do
  get 'home/index'
  get '/settings', to: 'settings#index'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/admin', to: 'admin#index'
  get '/admin/settings', to: 'settings#index'

  resources :settings
  resources :posts, param: :slug
  resources :users

  root 'home#index'
  
  # Ember
  # get "/guides/:name'", to: redirect('/guides/%{name}')
  # Catch all for HTML 5 history routing. This must be the last route.
  # get '/*path', to: 'guides#index', format: false
end
