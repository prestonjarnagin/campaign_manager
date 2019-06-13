Rails.application.routes.draw do
  get '/', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'

  get '/dashboard', to: 'dashboard#show'

  post 'login', to: 'sessions#create'
  post 'messagesend', to: 'message_send#update'

  resources :users, only: [:new, :create]
  resources :contacts, only: [:index, :new, :create, :show, :edit, :update]
  resources :campaigns, only: [:index, :new, :create, :show]

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
end
