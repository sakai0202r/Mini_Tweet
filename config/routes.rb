Rails.application.routes.draw do
  root 'home#home'
  get 'home/home'
  get 'home/about'
end
