Rails.application.routes.draw do
  resources :settings
  resources :posts, param: :slug

  get 'home/index'
  get 'settings/index'
  
  root 'home#index'

  # Ember
  # get "/guides/:name'", to: redirect('/guides/%{name}')
  # Catch all for HTML 5 history routing. This must be the last route.
  get '/*path', to: 'guides#index', format: false

end
