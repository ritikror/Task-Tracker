Rails.application.routes.draw do
  resources :timers
  get "start_timer", to: "timers#start_timer"
  resources :tasks
  resource :users
  post "user/login", to: "users#login"
  
end
