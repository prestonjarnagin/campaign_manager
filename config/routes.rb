Rails.application.routes.draw do
  resources :users
  get '/', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  resources :users, only: [:new, :create]
end
