class PostsController < ApplicationController
    #To make the “find_post” helper methods available to the Controller action
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all.reverse
    end
    
    def new
        @post = Post.new
    end

    # this action looks empty, but it’s not, because of the before_action.
    def show
        # @comments = Comments.where(params[:post_id])
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = session[:user_id]
        if @post.save
            flash[:notice] = "Post created!"
            redirect_to '/'
        else
            render 'new'
        end
    end
    # this action looks empty, but it’s not, because of the before_action.
    def edit       
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "Post updated!"
            redirect_to @post
            
        else
            render 'edit'
        end
    end

    def destroy
    @post.destroy
    flash[:notice] = "Post deleted!"
    redirect_to root_path
    end

private
#helper methods
    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end

    def find_post
        @post =Post.find(params[:id])
    end
end
