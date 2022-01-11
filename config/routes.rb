Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'welcome/info'
  get 'welcome/start'

  root to: 'welcome#index'

  resources :welcome, only: %i[index info start]
  resources :users, only: [:show]
end
