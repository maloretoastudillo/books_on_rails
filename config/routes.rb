Rails.application.routes.draw do
  resources :products
  resources :books
  devise_for :users

  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
