Rails.application.routes.draw do
  root to: 'elements#index'

  get '/login', to: 'users#new'
  post '/users', to: 'users#create'
end
