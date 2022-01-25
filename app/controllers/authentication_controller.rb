class AuthenticationController < ApplicationController
  def login
     user = User.find_by(username: params[:username])
      if (!user)
        render( json: {error: "Invalid Username"}, status: :unauthorized)
      end
      if user.authenticate(params[:password])
        render json: {message: "Correct password"}
      else
        render json: {message: "incorrect password"}
      end
  end
end
