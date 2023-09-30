class LikesController < ApplicationController
    def create
        @post = Post.find(params[:user_id])
        @like = Like.new(author: current_user, post: @post)

        if @like.save
        redirect_to user_posts_path(user_id: current_user)
        else
        flash.now[:error] = 'Error: Like could not be saved'
        end
    end
end