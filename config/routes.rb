# frozen_string_literal: true

Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  unauthenticated :user do
    root "splash#index", as: :root_for_non_logged_in
  end

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end

end
