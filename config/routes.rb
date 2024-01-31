Rails.application.routes.draw do
  root 'welcome#start'
  get 'start', to: 'welcome#start'
  resources :users, only: [:index, :create, :show]
  get 'users/activation_help', to: 'users#activation_help'
  post '/users/:id/authenticate', to: 'users#authenticate', as: 'user_authenticate'
  resources :posts, only: [:index, :new]
  post '/posts/:id/new', to: 'posts#create', as: 'create_post'
end

