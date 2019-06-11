Rails.application.routes.draw do
  root to: 'elements#index'

  get '/login', to: 'users#login'
end
