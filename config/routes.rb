Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  resources :signup, only: [:create] do 
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
    end
  end
  
  resources :items, only: [:new, :show, :create] do
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'logout'
    end
  end
  
  resources :registers, only: [:new]
end
