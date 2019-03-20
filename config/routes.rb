Rails.application.routes.draw do
  resources :users
  get '/', to: 'sessions#new'
  get '/dashboard', to: 'dashboard#show'

  post 'login', to: 'sessions#create'

  resources :users, only: [:new, :create]
  resources :contacts, only: [:index, :new, :create]
  resources :campaigns, only: [:index, :new, :create]
end
