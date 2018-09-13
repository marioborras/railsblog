class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    def index
        @user = User.all
    end

    #GET request users/new
    def new
        @user = User.new
    end

    # this action looks empty, but it’s not, because of the before_action.
    def show
    end
    

    #GET request /users/:id/edit
    # this action looks empty, but it’s not, because of the before_action.
    def edit
    end

    #PUT request users/:id
    def update
        @user.update(user_params)
        if @post.update(post_params)
            flash[:notice] = "Account updated!"
            redirect to @post
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(params[post_params])
        if @user.save
            flash[:notice] = "User created!"
            redirect to @user
        else
            render 'new'
        end
    end

    def destroy
        @user.destory
        flash[:notice] ="Account deleted!"
        redirect_to root_path
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
