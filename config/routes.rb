Rails.application.routes.draw do
  root to: 'elements#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update]

  #TODO probably not all I need
  resources :sites, only: [:show] do
    resources :elements, only: [:index, :show]
  end

  resources :elements do #TODO what routes do I need?
    resources :preuse_inspections
    resources :periodic_inspections
  end
end
