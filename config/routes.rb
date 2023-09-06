# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :comments
    end
  end
end
