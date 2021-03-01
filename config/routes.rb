Rails.application.routes.draw do
  devise_for :users
  root to: 'accounts#index'
  resources :accounts do
    resources :assets, only: :create
    resources :movements, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
