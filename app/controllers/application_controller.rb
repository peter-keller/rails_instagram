class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
    
    def logged_in?
        if current_user
            true
        else
            redirect_to root_path
        end
    end
end
