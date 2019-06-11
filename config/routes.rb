Rails.application.routes.draw do
  root to: 'elements#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :elements do #TODO what routes do I need?
    resources :preuse_inspections
    resources :periodic_inspections
  end
end
