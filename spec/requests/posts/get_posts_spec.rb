require 'rails_helper'
RSpec.describe PostsController

describe "GET posts#index" do
  before do
    user1 = User.create(email: "test@user.com", name: "testuser", password: "1234")
    post1 = Post.create(text_content: "hey i am testing", user_id: user1.id)
    user2 = User.create(email: "test2@user.com", name: "testuser2", password: "1234")
    post2 = Post.create(text_content: "hey i am testing too", user_id: user2.id)
    get '/posts'
  end

    it 'returns all posts' do
      expect(JSON.parse(response.body)['posts'].size).to eq(2)
    end
end

describe "GET posts#show" do
  before do
    user = User.create(email: "test3@user.com", name: "testuser3", password: "1234")
    post = Post.create(text_content: "hey i am testing three", user_id: user.id)
    get "/posts/#{post.id}"
  end

  it 'returns all users' do
    expect(JSON.parse(response.body)['post']['text_content']).to eq("hey i am testing three")
  end
end
