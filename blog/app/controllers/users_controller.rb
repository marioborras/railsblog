class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    def index
        signed_out_signin_path
        @user = User.all
        @current_user = current_user
    end

    #GET request users/new
    def new
        signed_in_users_path
        @user = User.new
    end

    # this action looks empty, but it’s not, because of the before_action.
    def show
        signed_out_signin_path
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User created!"
            redirect_to @user
        else
            render 'new'
        end
    end

    #GET request /users/:id/edit
    # this action looks empty, but it’s not, because of the before_action.
    def edit
        signed_out_signin_path
        @current_user = current_user
    end

    #PUT request users/:id
    def update
        signed_out_signin_path
        @user.update(user_params)
        if @user.update(user_params)
            flash[:notice] = "Account updated!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    

    def destroy
        @user.destroy
        @user.comments.destroy_all
        @user.posts.destroy_all
        session[:user_id] = nil
        flash[:notice] ="Account deleted!"
        redirect_to root_path
    end

#defintes the current user as the user signed in. used later for  all pages.
def current_user
    if session[:user_id]
        User.find(session[:user_id])
    end
end
private 
#helper methods
    def user_params
        params.require(:user).permit(:username,:email, :password)
    end

    def find_user
        @user =User.find(params[:id])
    end
end
