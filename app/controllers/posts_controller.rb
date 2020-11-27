class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    posts_and_users = []

    @posts.each do |post|
      user = User.find(post.user_id)
      posts_and_users << {post: post, name: user.name}
    end

    render json: {
      posts: posts_and_users
    }
  end

  def show
    render json:  {
      post: @post
    }
  end

  def create
    user = User.find(params['post']['user_id'])
    post = Post.new(
      text_content: params['post']['text_content'],
      user_id: params['post']['user_id']
    )

    if post.save
      render json: {
        status: :created,
        post: post,
        name: user.name
      }
    else
      render json: { 
        errors: post.errors, 
        status: :unprocessable_entity 
      }
    end 
  end

  def update
    if @post.update(
        text_content: params['post']['text_content'],
      )
      render json: {
        status: :ok,
        post: @post
      }
    else
      render json: { 
        errors: @post.errors, 
        status: :unprocessable_entity 
      }
    end 
  end

  def destroy  
    @post.destroy
    render json:  {
      status: :deleted
    }
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
