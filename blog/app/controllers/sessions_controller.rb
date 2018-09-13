class SessionsController < ApplicationController
    def new
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

    def destroy
    session[:user_id] = nil
    redirect_to users_path
    end

end
