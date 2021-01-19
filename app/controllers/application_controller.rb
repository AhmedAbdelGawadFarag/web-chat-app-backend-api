class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def logged_in
    userid = JWT.decode(cookies.signed[:jwt_token], nil, false)
    user = User.find(userid[0]["data"])

  rescue Exception => e
    render json: { error: e.message }
  end

end
