Rails.application.routes.draw do
  root "tasks#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :timers
  get "start_timer", to: "timers#start_timer"
  resources :tasks
  resource :users
  get "signin", to: "users#signin"
  post "login", to: "users#login"
  
  
end
