Rails.application.routes.draw do
  devise_for :sellers
  devise_for :buyers
  root to: 'pages#home'
  
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
