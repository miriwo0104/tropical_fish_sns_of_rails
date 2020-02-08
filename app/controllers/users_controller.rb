class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show, :home]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password_digest: params[:password])
    if @user.save
      # flash[:notice] = "登録完了"
      session[:user_id] = @user.id
      #redirect_to("/users/#{@user.id}")
      redirect_to("/users/send_mail")
    else
      # flash[:notice] = "登録失敗"
      render ("users/new")
    end
  end

  def login
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスかパスワードが間違っています。"
      @email = params[:email]
      render("users/login_form")
    end
  end

  def login_form

  end

  def logout
    session.delete(:user_id)
    redirect_to("/signin")
  end

  def home
    
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
