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
      post '/login', params: { "user": {
        "email": "test@makers.uk",
        "password": "asdfg"
        }
      }
    end

    it 'returns status is created' do
      expect(JSON.parse(response.body)['status']).to eq('created')
    end

    it 'returns logged in is true' do
      expect(JSON.parse(response.body)['logged_in']).to eq(true)
    end
end