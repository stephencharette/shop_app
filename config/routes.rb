Rails.application.routes.draw do
  resources :favorites, except: %i[show edit]
  resources :brands

  resources :items
  resources :users
  # devise_for :users
  devise_for :users, path: 'auth',
                     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register' }
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
