class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
        @today = Time.current.to_s.slice(0..10)
    end

    def authenticate_user
        if @current_user == nil
            #flash[:notice] = "ログインが必要です。"
            redirect_to("/signin")
        end
    end

    def forbid_login_user
        if @current_user != nil
            #flash[:notice] = "すでにログインしています"
            redirect_to("/posts/index")
        end
    end
end
