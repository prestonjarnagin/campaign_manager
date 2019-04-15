Rails.application.routes.draw do
  resources :users
  get '/', to: 'sessions#new'
  get 'login', to: 'sessions#new'

  get '/dashboard', to: 'dashboard#show'

  post 'login', to: 'sessions#create'

  resources :users, only: [:new, :create]
  resources :contacts, only: [:index, :new, :create, :show]
  resources :campaigns, only: [:index, :new, :create, :show]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
