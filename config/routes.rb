Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books do
    resources :products, except: %i[ index ] do
      resources :messages, only: %i[ new create show]
    end
  end
  get '/products/', to: 'products#index'
  get '/messages/', to: 'messages#index'
  get '/dashboard/', to: 'homes#dashboard'


  devise_for :users

  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
