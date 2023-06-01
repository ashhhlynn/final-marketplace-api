Rails.application.routes.draw do
  resources :orders
  resources :order_items
  resources :products
  resources :users

  root "products#index"

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/charges', to: 'charges#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
