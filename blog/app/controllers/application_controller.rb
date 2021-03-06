class ApplicationController < ActionController::Base
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end
end
def signed_in_users_path
    if session[:user_id]
        redirect_to posts_path
    end
end
def signed_out_signin_path
    if !session[:user_id]
        redirect_to root_path
    end
end