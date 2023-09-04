Rails.application.routes.draw do
  resources :tasks
  resource :users
  post "user/login", to: "users#login"
end
