Rails.application.routes.draw do
  resources :users
  get 'home/about'
  root 'home#index'
end
