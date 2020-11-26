class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: {
      posts: @posts
    }
  end

  def show
    render json:  {
      post: @post
    }
  end

  def create
    post = Post.new(
      text_content: params['post']['text_content'],
      user_id: params['post']['user_id']
    )

    if post.save
      render json: {
        status: :created,
        post: post
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
