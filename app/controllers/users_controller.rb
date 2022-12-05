class UsersController < ApplicationController
  user = User.find_by(username: params[:username])
  if params[:password] == user.password
    session[:user_id] = user.id
    render json: user, status: :created
  else
    render json: { error: "Invalid username or password" }, status: :unauthorized
  end
end
