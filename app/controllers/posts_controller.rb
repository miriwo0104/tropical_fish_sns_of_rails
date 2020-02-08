cd class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    #入力されたツイート本文と飼育環境リンクを新規ツイートとして作成
    @post = Post.new(content: params[:content],
                     link: params[:link]
    )
    
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
end
