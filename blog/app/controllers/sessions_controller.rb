class SessionsController < ApplicationController
    def new
    end
    def login
        signed_in_users_path
    end

    def create
     user = User.where(email: params[:email]).first

    if user.present? && user.password == params[:password]
    session[:user_id] = user.id
    flash[:notice] = "Logged in!"
    redirect_to users_path
    else
    flash[:notice] = "Email or password didn't match"
    redirect_to new_session_path
    end
end

def signed_out_signin_path
    if !session[:user_id]
        redirect_to signin_path
    end
end

    def destroy
    session[:user_id] = nil
    redirect_to root_path
    end
end
