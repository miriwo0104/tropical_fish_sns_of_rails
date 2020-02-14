Rails.application.routes.draw do
  get 'posts/index'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
  get "/about" => "home#about"
  
  #登録の第一歩
  get "/signup" => "users#new"
  get "/signin" => "users#login_form"
  get "/logout" => "users#logout"
  get "/users/user_home" => "users#home"
  post "/users/create" => "users#create"
  post "/users/login" => "users#login"
  get "/users/send_mail" => "users#send_mail"
  #メールに記載しているlink
  get "/users/input_id" => "users#input_id"
  #初回登録情報を登録するcontrollerにpostする
  post "/users/input_id" => "users#create"
  post "/users/input_address" => "users#input_address"
  get "/users/password_recovery" => "users#password_recovery"
  post "/users/password_recovery" => "users#password_recovery_send_mail"
  get "/users/password_reset" => "users#password_reset"
  post "/users/password_reset" => "users#password_reset_input"
  get "/users/password_reset_main" => "users#password_reset_main"
  post "/users/password_reset_main" => "users#password_reset_main_input"
  get "/users/:id/edit" => "users#edit"
  post "users/:id/edit" => "users#update"
  get "/users/:id" => "users#show"
  
  get "/posts/index" => "posts#index"
  get "/posts/new" => "posts#new"
  get "/posts/:id/edit" => "posts#edit"
  post "/posts/:id/edit" => "posts#update"
  post "/posts/new" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/posts/:id" => "posts#show"

  get "rearing_data/:id/index" => "rearing_data#index"
  get "rearing_data/new" => "rearing_data#new"
  post "rearing_data/new" => "rearing_data#create"
end
