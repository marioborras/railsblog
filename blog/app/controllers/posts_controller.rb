class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(params[:post])

        if @post.save
            flash[:notice] = "Post created!"
            redirect to @post
        else
            render 'new'
        end
    end

        flash[:notice] = "Post created!"
        #add a redirect later
    end

    def edit
        post = Post.find(params[:id])
        post.update(params[:post])
        flash[:notice] = "Updated post."
        #add a redirect later
    end

    def destory
    Post.find(params[:id]).destory
    flash[:notice] = "Post deleted"
    #add a redirect later
    end

end
