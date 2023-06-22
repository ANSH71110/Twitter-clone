Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :tweets, only: :create

  get :dashboard, to: "dashboard#index"
  get "profile/:id", to: "profile#info", as: 'profile'
  resources :usernames, only: [:new, :update]

  get "/search", to:"dashboard#search"

  post "/profile/:id/follow", to:"profile#follow", as:"follow"
  post "/profile/:id/unfollow", to:"profile#unfollow", as:"unfollow"
  
  get "/profile/:id/followers", to:"profile#followers", as:"followers"
  get "/profile/:id/following", to:"profile#following", as:"following"

end