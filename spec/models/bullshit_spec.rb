require 'rails_helper'

RSpec.describe Bullshit, type: :model do
  let(:user) { User.create(email: "test@user.com", name: "testuser", password: "1234") }
  let(:post) { Post.new(text_content: "hey i am testing", user_id: user.id)}

  it 'bullshits a post' do
    bullshit = post.bullshits.new(user_id: user.id)
    expect(bullshit).to be_valid
  end
end
