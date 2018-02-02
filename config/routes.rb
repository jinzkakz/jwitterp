Rails.application.routes.draw do
  root to: 'articles#index'

  get 'sessions/new'

  resources :users
  resources :articles
  resources :sessions  

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end
