require 'rails_helper'
RSpec.describe PostsController

describe "PATCH posts#update" do
  before do
    user = User.create(email: "test@user.com", name: "testuser", password: "1234")
    post = Post.create(text_content: "ahahah", user_id: user.id)
    patch "/posts/#{post.id}", params: { "post": {
      "text_content": "updated",
      "user_id": user.id 
      }
    }
  end

  it 'returns status ok' do
    expect(JSON.parse(response.body)['status']).to eq('ok')
  end

  it 'returns the post' do
    expect(JSON.parse(response.body)['post']['text_content']).to eq('updated')
  end

  it 'returns status unprocessable entity' do
    user = User.create(email: "test123@user.com", name: "testuser123", password: "1234")
    post = Post.create(text_content: "ahahah", user_id: user.id)
    patch "/posts/#{post.id}", params: { "post": {
      "user_id": user.id 
      }
    }
    expect(JSON.parse(response.body)['status']).to eq('unprocessable_entity')
  end

end