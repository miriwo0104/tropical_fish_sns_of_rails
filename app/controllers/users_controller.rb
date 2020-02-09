class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show, :home]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}
  
  def new
    @user = User.new
  end

  def input_address
    #random_idをそのまま登録時のURLにしたかったためユーザ識別をメールアドレスではなくrandom_idにした
    #@@random_id = SecureRandom.hex(16)
    @user = User.new(email: params[:email], name: "default")
    #@user = User.new(email: params[:email], secure_id: @@random_id)
    @user.save
    NoticeMailer.initial_registration(@user).deliver_now
    redirect_to("/users/send_mail")
  end
  
  def create
    @user = User.find_by(secure_id: @@random_id)
    @user.name = params[:name]
    @user.password_digest = params[:password]
    if @user.save
      # flash[:notice] = "登録完了"
      session[:user_id] = @user.id
      #登録メールアドレス確認メール送信処理
      redirect_to("/users/send_mail")
      #受信ボックスを確認する画面を表示
    else
      # flash[:notice] = "登録失敗"
      #登録失敗時にパスワード以外の入力値をそのままに新規登録画面を再表示
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
