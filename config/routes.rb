Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users, only: [:index, :show, :new, :edit, :create]

  resources :posts do
    resources :comments, only: :create
  end

  resources :categories, only: [:index, :show]

  resources :prefectures, only: [:index, :show]
end
