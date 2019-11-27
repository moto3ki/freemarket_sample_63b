Rails.application.routes.draw do
  devise_for :users
  
  resources :signup do
    collection do
      get 'step1'
    end
  end

  root "users#index"
  resources :users, only: [:index]
end
