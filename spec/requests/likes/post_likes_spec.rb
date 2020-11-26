require 'rails_helper'
RSpec.describe LikesController

describe 'POST likes #create' do
  before do
    user = User.create(email: "test@user.com", name: "testuser", password: "1234")

    # post '/login', params: { "user": {
    #   "email": "test@user.com",
    #   "password": "1234"
    #   }
    # }
    p user.id
    session[:user_id] = user.id

    post = Post.create(text_content: "test", user_id: user.id)

    post '/likes', params: {
      "post_id": "#{post.id}"
    }
  end
  it 'returs status created' do
    expect(JSON.parse(response.body)['status']).to eq('created')
  end



end
