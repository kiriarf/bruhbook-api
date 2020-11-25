class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: {
      posts: @posts
      }
  end

  def show
    @post = Post.find(params['id'])

      render json:  {
        post: @post
      }
  end

  def create
    @post = Post.create(
      text_content: params['text_content'],
      user_id: params['user_id']
    )
    render json:  {
      post: @post
    }
  end

  def update
    @post = Post.find(params['id'])
    @post.update(
      text_content: params['text_content'],
      user_id: params['user_id']
    )
    render json:  {
      post: @post
    }
  end

  def destroy
    @posts = Post.all
    @post = Post.find(params['id'])
    @post.destroy
    render json:  {
      post: @posts
    }
  end


end
