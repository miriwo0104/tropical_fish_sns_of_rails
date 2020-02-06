Rails.application.routes.draw do
  get 'posts/index'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
  get "/about" => "home#about"

  get "/signup" => "users#new"
  get "/signin" => "users#login_form"
  get "/logout" => "users#logout"
  get "/users/user_home" => "users#home"
  post "/users/create" => "users#create"
  post "/users/login" => "users#login"
  get "/users/:id" => "users#show"
  
  get "/posts/index" => "posts#index"
  get "/posts/show" => "posts#show"
end
