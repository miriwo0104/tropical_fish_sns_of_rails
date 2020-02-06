Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
  get "/about" => "home#about"

  get "/users/create" => "users#new"
  get "/users/login" => "users#login"
  get "/users/user_home" => "users#home"
  
end
