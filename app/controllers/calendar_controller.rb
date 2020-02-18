class CalendarController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(session[:user_id])
#    @posts = Post.find_by(user_id: params[:id])
  end
end
