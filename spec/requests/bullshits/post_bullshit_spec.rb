require 'rails_helper'
RSpec.describe BullshitsController

describe 'POST bullshits#create' do
  before do
    user = User.create(email: "test@user.com", name: "testuser", password: "1234")

    post '/login', params: { "user": {
      "email": "test@user.com",
      "password": "1234"
      }
    }

    post = Post.create(text_content: "test", user_id: user.id)

    post '/bullshits', params: {
      "post_id": "#{post.id}"
    }
  end
  it 'returns status created' do
    expect(JSON.parse(response.body)['status']).to eq('created')
  end
end