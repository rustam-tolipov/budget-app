Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'users/:id', to: 'users#show', as: 'user'
  root to: 'users#show'

  resources :users, only: [:show]
end
