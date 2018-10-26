Rails.application.routes.draw do
  root "sessions#new"
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  resources :sessions
end
