cd class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #入力されたツイート本文と飼育環境リンクを新規ツイートとして作成
    p params[:image]
    p content: params[:content]
    if params[:image]
      file_name = SecureRandom.hex(16)
      @post = Post.new(content: params[:content],
                      link: params[:link],
                      img: "#{file_name}.jpg"
      )
      image = params[:image]
      File.binwrite("public/tweet_images/#{@post.img}", image.read)
    else
      @post = Post.new(content: params[:content],
                      link: params[:link],
      )
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
end
