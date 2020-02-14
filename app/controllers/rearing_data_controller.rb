class RearingDataController < ApplicationController
  def index
    @data = Datum.all
  end

  def new
    @datum = Datum.new
  end

  def create
    @datum = Datum.new(fish_tank_name: params[:fish_tank_name], 
                      fish_tank_size: params[:fish_tank_size],
                      filter: params[:filter],
                      light: params[:light],
                      water_change: params[:water_change],
                      number_of_fish: params[:number_of_fish],
                      co2: params[:co2],
                      memo: params[:memo]
    )

    if @datum.save
      #保存できた
      #タイムラインにリダイレクト
      redirect_to("/rearing_data/#{@current_user.id}/index")
    else
      #保存できなかった
      #投稿ページにrender、一度入力した内容は再表示するため
      render ("/rearing_data/new")
    end
  end
end
