cd class PostsController < ApplicationController
def index
  @posts = Post.all
  #ユーザ新規登録時、ログイン時に格納したsessionの値から現在ログイン中のユーザを特定する
  @user = User.find(session[:user_id])
end

def show
  @post = Post.find_by(id: params[:id])
end

def new
  @post = Post.new
end

def create
  #入力されたツイート本文と飼育環境リンクを新規ツイートとして作成
  @user = User.find(session[:user_id])
  @post = Post.new(content: params[:content],
                  link: params[:link],
                  user_id: @current_user.id
  )

  if params[:image]
    file_name = SecureRandom.hex(16)
    @post.img = "#{file_name}.jpg"
    image = params[:image]
    File.binwrite("public/tweet_images/#{@post.img}", image.read)
  end

    #保存可否分岐
    if @post.save
      #保存できた
      #タイムラインにリダイレクト
      redirect_to("/posts/index")
    else
      #保存できなかった
      #投稿ページにrender、一度入力した内容は再表示するため
      render ("posts/new")
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :text, :img)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if params[:image]
      file_name = SecureRandom.hex(16)
      @post.img = "#{file_name}.jpg"
      image = params[:image]
      File.binwrite("public/tweet_images/#{@post.img}", image.read)
    end

    if @post.save
      # flash[:notice] = "更新完了"
      redirect_to("/posts/#{@post.id}")
    else
      # flash[:notice] = "更新失敗"
      render("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
