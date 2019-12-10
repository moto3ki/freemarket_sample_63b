Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root "home#index"
  
  resources :signup, only: [:create] do 
    collection do
      get 'member_info'
      get 'tel_no'
      get 'address'
      post 'credit'
      post 'pay', to: 'signup#pay'      
    end
  end

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'paymethod_show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  
  resources :items, only: [:new, :show, :create, :destroy, :edit, :update] do
    resources :purchases, only: [:new, :create]

    member do
      get 'own_show'
    end
  end
  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'logout'
      get 'selling_items'
      get 'sold_items'
    end
    
    resources :real_address, only: [:new, :create]
  end
  
  resources :prefectures, only: [:show]
  resources :categories, only: [:index]
  
end
