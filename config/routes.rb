Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :deliveries, only: [:create]
  end

  resources :deliveries, only: [:edit, :update, :destroy] do
    resources :tags, only: [:create]
  end

  resources :tags, only: [:edit, :update, :destroy]
end
