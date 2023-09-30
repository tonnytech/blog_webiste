class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(user_id: current_user)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @user_post = @user.posts.find(params[:id])
  end
end
