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

  def show
    @datum = Datum.find_by(id: params[:id])
  end
  
  def edit
    @datum = Datum.find_by(id: params[:id])
  end

  def update
    @datum = Datum.find_by(id: params[:id])
    @datum.fish_tank_name = params[:fish_tank_name]
    @datum.fish_tank_size = params[:fish_tank_size]
    @datum.filter = params[:filter]
    @datum.light = params[:light]
    @datum.water_change = params[:water_change]
    @datum.number_of_fish = params[:number_of_fish]
    @datum.co2 = params[:co2]
    @datum.memo = params[:memo]

    if @datum.save
      #保存できた
      #タイムラインにリダイレクト
      redirect_to("/rearing_data/#{@datum.id}")
    else
      #保存できなかった
      #投稿ページにrender、一度入力した内容は再表示するため
      render ("/rearing_data/#{@datum.id}/edit")
    end
  end

  def destroy
    @datum = Datum.find_by(id: params[:id])
    @datum.destroy
    redirect_to("/rearing_data/index")
  end
end
