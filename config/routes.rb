Rails.application.routes.draw do
  devise_for :users
  root "items#index"
    

  resources :items do
    resources :orders
    resource :likes, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  
end
  
