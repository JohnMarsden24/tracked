
Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'about', to: 'pages#about'

  resources :users, only: [:show] do
    resources :deliveries, only: [:destroy]
  end

  resources :deliveries, only: [:create]

  resources :deliveries, only: [:edit, :update, :destroy] do
    resources :tags, only: [:create]
  end

  resources :tags, only: [:edit, :update, :destroy]

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
