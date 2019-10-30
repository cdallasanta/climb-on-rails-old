Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  root to: 'elements#index'

  resources :users, only: [:show]

  resources :elements, only: [:index, :show, :edit, :update] do
    resources :ropes, only: [:new, :create, :update]
    resources :preuse_inspections, only: [:index, :create, :edit, :update]
    resources :periodic_inspections, only: [:new, :create, :show, :edit, :update]
  end

  resources :comments, only: [:index]
end
