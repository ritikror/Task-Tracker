Rails.application.routes.draw do
  
  root "tasks#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :timers
  get "start_timer/:id", to: "timers#start_timer", as: 'start_timer'

  resources :tasks do 
    get '/page/:page', action: :index, on: :collection
  end
  
  resource :users
  get "signin", to: "users#signin"
  post "login", to: "users#login"
  
  
end
