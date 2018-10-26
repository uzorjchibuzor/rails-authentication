Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  resources :sessions
end
