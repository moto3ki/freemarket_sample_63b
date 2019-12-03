Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  resources :signup, only: [:create] do 
    collection do
      get 'member_info'
      get 'tel_no'
      get 'address'
    end
  end
  
  resources :items, only: [:new, :show, :create, :destroy, :edit, :update] do
    resources :purchases, only: [:new, :create]

    member do
      get 'own_show'
    end
  end
  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'logout'
      get 'selling_items'
      get 'sold_items'
    end
    
  end
  resources :registers, only: [:new]
end
