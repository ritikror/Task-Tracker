Rails.application.routes.draw do
  root "users#new"

  resources :timers
  get "start_timer", to: "timers#start_timer"
  resources :tasks
  resource :users
  get "signin", to: "users#signin"
  post "login", to: "users#login"
  
end
