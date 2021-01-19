class AuthController < ApplicationController
  before_action :checkparams

  def checkparams

    if !params.has_key?(:user) || !params[:user].has_key?(:name) || !params[:user].has_key?(:password)
      render json: { error: "user name or password cannot be blank" }, status: :conflict
    end

  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user == nil || !user.authenticate(params[:user][:password])
      render json: { error: "email or password is incorrect" }, status: :unauthorized
    else
      payload = { data: user.id, exp: 24.hour.from_now.to_i }
      jwttoken = JWT.encode(payload, nil, 'none')

      cookies.signed[:jwt_token] = { value: jwttoken, httponly: true, expires: 24.hour }

      render json: { user: user, token: jwttoken }, status: :ok
    end

  end

end