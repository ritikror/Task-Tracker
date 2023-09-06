Rails.application.routes.draw do
  resources :timers
  resources :tasks
  resource :users
  post "user/login", to: "users#login"
  
end
