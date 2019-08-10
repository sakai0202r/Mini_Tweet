Rails.application.routes.draw do
  root 'home#home'
  get '/home',     to: 'home#home'
  get '/about',    to: 'home#about'
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
