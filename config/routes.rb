Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"

  resources :sell, only: [:new]
  resources :users, only: [:index]
end
