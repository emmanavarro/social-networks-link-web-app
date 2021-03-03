Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'home/about'
  root 'home#index'
end
