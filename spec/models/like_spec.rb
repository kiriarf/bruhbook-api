require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(email: "test@user.com", name: "testuser", password: "1234") }
  let(:post) { Post.new(text_content: "hey i am testing", user_id: user.id)}

  it 'likes a post' do
    like = post.likes.new(user_id: user.id)
    expect(like).to be_valid
  end

end
