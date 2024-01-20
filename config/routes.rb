Rails.application.routes.draw do
  get 'start', to: 'welcome#start'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/activation_help', to: 'users#activation_help'
  post 'users/authenticate', to: 'users#authenticate'

  resources :users, only: [:show]
end

