Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"

  resources :items, only: [:new, :create]
  resources :users, only: [:index, :edit]
end
