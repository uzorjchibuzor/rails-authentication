Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  post '/posts/new', to: 'posts#create'
  root "posts#index"
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  resources :sessions
  resources :posts, only: [:new, :create, :index]
end
