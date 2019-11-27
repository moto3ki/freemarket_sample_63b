Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  resources :signup, only: [:create] do 
    collection do
      get 'step1'
    end
  end
  
  resources :items, only: [:new, :create]
  resources :users, only: [:index, :edit]

end
