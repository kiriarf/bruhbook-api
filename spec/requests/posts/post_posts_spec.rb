require 'rails_helper'
RSpec.describe PostsController

describe "GET posts#index" do
  before do
    user = User.create(email: "test@user.com", name: "testuser", password: "1234")
    post '/posts', params: { "post": {
      "text_content": "yeet",
      "user_id": user.id 
      }
    }
  end

  it 'returns status created' do
    expect(JSON.parse(response.body)['status']).to eq('created')
  end

  it 'returns the post' do
    expect(JSON.parse(response.body)['post']['text_content']).to eq('yeet')
  end

  it 'returns status unprocessable entity' do
    user = User.create(email: "test123@user.com", name: "testuser123", password: "1234")
    post '/posts', params: { "post": {
      "user_id": user.id 
      }
    }
    expect(JSON.parse(response.body)['status']).to eq('unprocessable_entity')
  end

end