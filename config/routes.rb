Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:show]

  resources :deliveries, only: [:create]

  resources :deliveries, only: [:edit, :update, :destroy] do
    resources :tags, only: [:create]
  end

  resources :tags, only: [:edit, :update, :destroy]
end
