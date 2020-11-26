require 'rails_helper'
RSpec.describe PostsController

describe "DELETE posts#destroy" do
  before do
    user = User.create(email: "test@user.com", name: "testuser", password: "1234")
    post = Post.create(text_content: "ahahah", user_id: user.id)
    delete "/posts/#{post.id}"
  end

  it 'returns status deleted' do
    expect(JSON.parse(response.body)['status']).to eq('deleted')
  end

end