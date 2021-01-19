class UsersController < ApplicationController
  before_action :logged_in, except: [:create]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :conflict
    end
  end

  def user_params
    params.require("user").permit(:name, :password)
  end
end