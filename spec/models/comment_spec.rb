require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(email: "test@user.com", name: "testuser", password: "1234") }
  let(:post) { Post.new(text_content: "hey i am testing", user_id: user.id)}

  it 'comments a post' do
    comment = post.comments.new(user_id: user.id)
    expect(comment).to be_valid
  end
end
