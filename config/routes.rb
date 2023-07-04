# frozen_string_literal: true

Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
  resources :categories, only: [:index, :new, :create]
end
