require 'rails_helper'
RSpec.describe SessionsController



describe "GET users#index" do
  before do
    post '/signup', params: { "user": {
      "email": "test@makers.uk",
      "name": "test",
      "password": "asdfg",
      "password_confirmation": "asdfg"
      }
    }
    post '/signup', params: { "user": {
      "email": "test2@makers.uk",
      "name": "test2",
      "password": "asdfg",
      "password_confirmation": "asdfg"
      }
    }
    get '/users'
  end

    it 'returns all users' do
      expect(JSON.parse(response.body)['users'].size).to eq(2)
    end
end

describe "GET users#show" do
  before do
    user = User.create(
      email: "test@makers.uk",
      name: "test",
      password: "asdfg",
      password_confirmation: "asdfg"
    )
    get "/users/#{user.id}"
  end

  it 'returns all users' do
    expect(JSON.parse(response.body)['user']['name']).to eq("test")
  end
end
