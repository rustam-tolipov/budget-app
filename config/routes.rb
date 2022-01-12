Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'welcome/info'
  get 'welcome/start'

  root to: 'welcome#index'

  # devise_scope :user do
  #   authenticated :user do
  #     root 'users', as: :authenticated_root
  #   end
  #   unauthenticated { root 'welcome#start', as: :unauthenticated_root }
  # end

  resources :welcome, only: %i[index info start]
  resources :users, only: [:show]

  resources :groups, only: %i[index show new create destroy] do
    resources :group_users, only: %i[create destroy]
  end
end
