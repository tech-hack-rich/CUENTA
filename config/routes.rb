Rails.application.routes.draw do
  devise_for :users
  root to: 'accounts#index'
  resources :accounts do
    resources :assets, only: [:create, :destroy]
    resources :movements, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
