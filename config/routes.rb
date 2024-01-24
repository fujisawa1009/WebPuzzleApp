Rails.application.routes.draw do
  root 'welcome#start'
  get 'start', to: 'welcome#start'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/activation_help', to: 'users#activation_help'
  # post 'users/authenticate', to: 'users#authenticate'
  # /users/:uuid/authenticate に対するルーティング
  post '/users/:id/authenticate', to: 'users#authenticate', as: 'user_authenticate'

  resources :users, only: [:show]
end

