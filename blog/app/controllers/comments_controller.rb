class CommentsController < ApplicationController

    before_action :find_comment, 
    only: [:show, :edit, :update, :destroy]

    def index
        #pending
    end

    def new
        @comment = Comment.new
    end
    # this action looks empty, but it’s not, because of the before_action.
    def show
    end

    def create
        # @post = Post.find(params[:post_id])
        # @comment = @post.comment.create(params[:comment].permit(:comment))
        # @comment.user_id = session[:user_id]
        @comment =Comment.create(comment_params)
        @comment.user_id = session[:user_id]
        redirect_to "/"
        # @comment.post_id =Post.find(params[:id])
        # if @comment.save
        #     flash[:notice] = "Comment created!"
        #     redirect to '/'
        # else
        #     render 'new'
        # end
    end


    def update
        if @comment.update(comment_params)
            flash[:notice] = "Comment updated!"
            redirect_to @comment
        else
            render 'edit'
        end

    end

    def destroy
        @comment.destroy
        flash[:notice]= "Comment deleted!"
        redirect_to root_path
    end
private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :post_id)
    end

    def find_comment
        @comment =Comment.find(params[:id])
    end

end
