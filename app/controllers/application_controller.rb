class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
        @today = Time.current.to_s.slice(0..10)
    end
end
