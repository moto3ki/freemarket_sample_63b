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
  
  resources :items, only: [:new, :show, :create]
  resources :users, only: [:index, :edit, :update]

end
