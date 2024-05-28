Rails.application.routes.draw do
  # 階層表示機能のため
  # root 'new_categories#new'
  resources :new_categories, only:[:new]

  # ユーザー管理機能のため
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'user_profiles', to: 'users/registrations#new_user_profile'
    post 'user_profiles', to: 'users/registrations#create_user_profile'
  end

  # トップページ表示のため
  root "items#index"
    

  resources :items do
    resources :orders
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  
end
  
