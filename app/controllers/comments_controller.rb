class CommentsController < ApplicationController
    def new
      @comment = Comment.new
  
      respond_to do |format|
        format.html { render :new }
      end
    end
  
    def create
      @comment = Comment.new(params.require(:comment).permit(:text))
      @comment.post = Post.find(params[:id])
      @comment.author = current_user
  
      respond_to do |format|
        format.html do
          if @comment.save
            redirect_to user_posts_path(user_id: current_user)
          else
            render :new
          end
        end
      end
    end
  end