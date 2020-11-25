class StaticController < ApplicationController
  def home
    render json: { status: "I am working!" }
  end
end