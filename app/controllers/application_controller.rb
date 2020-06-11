class ApplicationController < ActionController::API
  include ActionController::Cookies

  def the_token
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    decoded_token
  end
  
  def the_user
    token = the_token()
    user = User.find_by_email(token["user_email"]) if User.find_by_email(token["user_email"])
    user = Facilitator.find_by_email(token["user_email"]) if Facilitator.find_by_email(token["user_email"])
    user = Organization.find_by_email(token["user_email"]) if Organization.find_by_email(token["user_email"])
    user
  end

  def authenticate_cookie
    decoded_token = the_token()
    if decoded_token
      # debugger
      user = the_user()
    end
    if user then return true else render json: {status: 'unauthorized', code: 401} end
  end

  def current_user
    decoded_token = the_token()
    if decoded_token
      user = the_user()
    end
    if user then return user else return false end
  end
end
