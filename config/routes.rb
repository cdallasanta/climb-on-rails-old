Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'elements#index'

  #  will get rid of some of these
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'
  # get '/auth/:provider/callback', to: 'sessions#create'

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update]

  resources :elements, only: [:index, :show, :edit, :update] do
    resources :ropes, only: [:new, :create, :update]
    resources :preuse_inspections, only: [:index, :create, :edit, :update]
    resources :periodic_inspections, only: [:new, :create, :show, :edit, :update]
  end

  resources :comments, only: [:index]
end
