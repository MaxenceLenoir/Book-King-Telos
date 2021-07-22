Rails.application.routes.draw do
  devise_for :sellers
  devise_for :buyers
  root to: 'pages#home'
  
  resources :books
  resources :carts, only: :show
  get '/cart_payment/pay', to: 'carts#cart_payment', as: :cart_payment
  resources :cart_elements, only: %i[create destroy]

  namespace :dashboard do
    resources :books, only: :index
  end
end
