Rails.application.routes.draw do

  root 'pages#index'

  namespace :api do
    namespace :v1 do
      get 'home/index'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  namespace :api do
    namespace :v1 do
      resources :items
      resources :categories
      resources :businesses
      resources :offers
      # mount_devise_token_auth_for 'Business', at: 'auth', skip: [:omniauth_callbacks]
    end
  end
  namespace :api do
      mount_devise_token_auth_for 'Business', at: 'auth'
  end

end
