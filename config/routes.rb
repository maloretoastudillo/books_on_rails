Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books do
    resources :products, except: %i[ index ] do
      resources :messages, except: %i[ index ]
    end
  end
  get '/products/', to: 'products#index'
  get '/messages/', to: 'messages#index'
  get '/dashboard/', to: 'homes#dashboard'
  get '/message/:user_id/book/:book_id', to: 'messages#book_messages', as: 'book_messages'

  devise_for :users

  root 'homes#index'
end
