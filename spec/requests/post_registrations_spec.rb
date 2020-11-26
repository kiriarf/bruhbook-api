require 'rails_helper'
RSpec.describe RegistrationsController

describe "POST registrations#create" do

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
    expect(JSON.parse(response.body)['status']).to eq('created')
  end

end
