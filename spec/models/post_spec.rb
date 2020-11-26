require 'rails_helper'

RSpec.describe Post, :type => :model do
  let(:user) { User.create(email: "test@user.com", name: "testuser", password: "1234") }

  it "is valid with valid attributes" do
    post = Post.new(text_content: "hey i am testing", user_id: user.id)

    expect(post).to be_valid
  end


  it "is not valid without a user id" do
    post = Post.new(text_content: "hey i am testing")

    expect(post).to_not be_valid
  end

  it "is not valid without text content" do
    post = Post.new(user_id: user.id)

    expect(post).to_not be_valid
  end
end
