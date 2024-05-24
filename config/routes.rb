Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_profiles', to: 'users/registrations#new_user_profile'
    post 'user_profiles', to: 'users/registrations#create_user_profile'
  end

  root "items#index"
    

  resources :items do
    resources :orders
    resource :likes, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  
end
  
