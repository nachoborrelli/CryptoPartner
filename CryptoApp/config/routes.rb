Rails.application.routes.draw do
  resources :wallet_coins
  get 'home/index'
  get '/wallets/add', to: 'wallet_coins#create', as: 'add_wallet_coin'
  get '/wallets/add_usd', to: 'wallet_coins#add_usd', as: 'add_usd_wallet_coin'
  resources :coins
  resources :wallets
  resources :transactions

  
  root to: "home#index"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
