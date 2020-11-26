class LikesController < ApplicationController
  include CurrentUserConcern
  before_action :find_post

  def create
    if !already_liked?
      like = @post.likes.create(user_id: @current_user.id)
      render json: {
        status: :created,
        like: like
      }
    end
  end


  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: @current_user.id, post_id: params[:post_id]).exists?
  end

end
