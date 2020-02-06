class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password_digest: params[:password])
    if @user.save
      # flash[:notice] = "登録完了"
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      # flash[:notice] = "登録失敗"
      render ("users/new")
    end
  end

  def login

  end

  def home
    
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
