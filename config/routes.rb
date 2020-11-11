Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # ゲストログイン用の記述
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'posts#index'

  resources :users, only: [:index, :show, :new, :edit, :create, :update] do
    get :followings, on: :member
    get :followers, on: :member
    get :mypagePosts, on: :collection
  end

  resources :relationships, only: [:create, :destroy]


  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: :create

    resources :clips, only: [:create, :destroy]

  end

  resources :categories, only: [:index, :show]

  resources :prefectures, only: [:index, :show]

  resources :newposts, only: [:index, :show]

  resources :rooms, only: [:index, :create, :show]
  
  resources :messages, only: [:create, :edit, :update, :destroy]

  resources :notifications, only: :index
end
