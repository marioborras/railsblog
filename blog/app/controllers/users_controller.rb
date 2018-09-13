class UsersController < ApplicationController
    #GET request users/new
    def new
        @user = User.new
    end
    def show
        @user = User.find(params[:id])
    end
    def index
    @user = User.all

    #GET request /users/:id/edit
    def edit
        @user =User.find(params[:id])
    end

    #PUT request users/:id
    def update
    user = User.find(params[:id])
    user.update(params[:user]
    redirect_to user
    end

    def create
        user = User.create(params[:user])
        redirect_to user
    end

    def destory
        User.find(params[:id]).destory
    end
end
