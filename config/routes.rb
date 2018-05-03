Rails.application.routes.draw do
  resources :settings
  resources :posts, param: :slug

  get 'home/index'
  get 'settings/index'
  
  root 'home#index'
end
