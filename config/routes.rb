Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users, only: [:index, :show, :new, :edit, :create]

  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end

  resources :categories, only: [:index, :show]

  resources :prefectures, only: [:index, :show]

  resources :newposts, only: [:index, :show]
end
