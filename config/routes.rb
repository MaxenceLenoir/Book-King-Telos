Rails.application.routes.draw do
  devise_for :sellers
  devise_for :buyers
  root to: 'pages#home'
  
  resources :books
  resources :carts, only: :show
  resources :cart_elements, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
