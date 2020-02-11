class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show, :home]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}
  
  def new
    @user = User.new
  end

  def input_address
    #random_idをそのまま登録時のURLにしたかったためユーザ識別をメールアドレスではなくrandom_idにした
    #32桁のランダムな文字列を発生発生させる
    random_id = SecureRandom.hex(16)
    #addressesテーブルに新規レコード追加して入力アドレスと16桁のランダムな文字列を格納する準備
    @user_address = Address.new(address: params[:email], random_id: random_id)
    
    #メール送信メーラーへの命令、メールには登録フォームのリンクと16桁のランダムな文字列を添付する予定、←まだ未実施
    if @user_address.save
      # flash[:notice] = "登録完了"
      redirect_to("/users/send_mail")
      NoticeMailer.initial_registration(@user_address).deliver_now
    else
      # flash[:notice] = "登録失敗"
      #登録失敗時にパスワード以外の入力値をそのままに新規登録画面を再表示
      render ("users/new")
    end
    #受信ボックスを見ろと表示するページに飛ばす
  end

  def input_id
    @user = User.new
  end
  
  def create
    #addressesテーブルからメール添付のIDを元に当該レコードを取得
    @user_address = Address.find_by(random_id: params[:random_id])
    #入力値を元にusersテーブルに新規レコードを作成
    @user = User.new(name: params[:name], email: @user_address.address, password_digest: params[:password])

    if @user.save
      # flash[:notice] = "メールアドレス登録完了"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      # flash[:notice] = "メールアドレス登録失敗"
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
