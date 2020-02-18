class CalendarController < ApplicationController
  def index
    @posts = Post.where(user_id: @current_user.id)
  end

  def date_index
    @posts = Post.where(user_id: @current_user.id)
    @date = params[:date]
  end
end
