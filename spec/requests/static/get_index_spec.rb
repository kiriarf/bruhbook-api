require 'rails_helper'
RSpec.describe StaticController

describe "POST sessions#create" do

    before do
      get '/'
    end

    it 'returns status I am working' do
      expect(JSON.parse(response.body)['status']).to eq("I am working!")
    end
end