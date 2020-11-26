class RegistrationsController < ApplicationController
  def create
    puts "hi"
    user = User.new(
      email: params['user']['email'],
      name: params['user']['name'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )
    
    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      puts "hey"
      render json: { status: 500 }
    end

  end
end