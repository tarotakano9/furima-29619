Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :user
  resources :items
end
