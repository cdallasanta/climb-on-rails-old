Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'elements#index'

  resources :users, only: [:show]

  resources :elements, only: [:index, :show, :edit, :update] do
    resources :ropes, only: [:new, :create, :update]
    resources :preuse_inspections, only: [:new,  :create, :edit, :update]
    get '/preuse_inspections/:date', to: "preuse_inspections#show"
    resources :periodic_inspections, only: [:new, :create, :show, :edit, :update]
  end

  # TODO eventually remove this
  resources :comments, only: [:index]
end
