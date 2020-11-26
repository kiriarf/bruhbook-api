require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
    user = User.new(email: "test@makers.com", password: "asdfgh", name: "test")

    expect(user).to be_valid
  end


  it "is not valid without a name" do
        user = User.new(email: "test@makers.com", password: "asdfgh")

      expect(user).to_not be_valid
  end

  it "is not valid without a email" do
      user = User.new(password: "asdfgh", name: "test")

      expect(user).to_not be_valid
  end

  it "is not valid without uniq email" do
    user = User.new(email: "test@makers.com", password: "asdfgh", name: "test")

    user2 = User.new(email: "test@makers.com", password: "asdfgh", name: "test2")

      expect(user2.id).to eq nil
  end
end
