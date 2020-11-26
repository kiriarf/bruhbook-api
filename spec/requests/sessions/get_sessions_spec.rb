require 'rails_helper'
RSpec.describe SessionsController

describe "POST sessions#create" do

    before do
      post '/signup', params: { "user": {
        "email": "test@makers.uk",
        "name": "test",
        "password": "asdfg",
        "password_confirmation": "asdfg"
        }
      }
    end

    it 'returns logged in is true' do
      get '/logged_in'
      expect(JSON.parse(response.body)['logged_in']).to eq(true)
    end

    it 'returns logged in is false if no session' do
      delete '/logout'
      get '/logged_in'
      expect(JSON.parse(response.body)['logged_in']).to eq(false)
    end
end