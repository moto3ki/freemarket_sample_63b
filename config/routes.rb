Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  resources :signup, only: [:create] do 
    collection do
      get 'member_info'
      get 'tel_no'
    end
  end
  
  resources :items, only: [:new, :show, :create]
  resources :users, only: [:index, :edit]

end
