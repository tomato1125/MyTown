Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'posts#index'

  resources :users, only: [:index, :show, :new, :edit, :create, :update]

  resources :posts, shallow: true do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end

  resources :categories, only: [:index, :show]

  resources :prefectures, only: [:index, :show]

  resources :newposts, only: [:index, :show]
end
