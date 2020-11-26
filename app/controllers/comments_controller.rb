class CommentsController < ApplicationController
  include CurrentUserConcern
  before_action :find_post

  def create
      comment = @post.comments.create(user_id: @current_user.id)
      render json: {
        status: :created,
        comment: comment
      }
  end


  private
  def find_post
    @post = Post.find(params[:post_id])
  end

end
