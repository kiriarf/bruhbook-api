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

    it 'returns status is created' do
      post '/login', params: { "user": {
        "email": "test@makers.uk",
        "password": "asdfg"
        }
      }
      expect(JSON.parse(response.body)['status']).to eq('created')
    end

    it 'returns logged in is true' do
      post '/login', params: { "user": {
        "email": "test@makers.uk",
        "password": "asdfg"
        }
      }
      expect(JSON.parse(response.body)['logged_in']).to eq(true)
    end

    it 'returns 401 if no session' do
      post '/login', params: { "user": {
        "email": "wrongemail@makers.uk",
        "password": "asdfgh"
        }
      }
      expect(JSON.parse(response.body)['status']).to eq(401)
    end

end