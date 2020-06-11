# class ApplicationController < ActionController::API
#   include ActionController::Cookies

#   def the_token
#     token = cookies.signed[:jwt]
#     decoded_token = CoreModules::JsonWebToken.decode(token)
#     decoded_token
#   end
  
#   def the_user
#     token = the_token()
#     return User.find_by_email(token["user_email"]) if User.find_by_email(token["user_email"])
#     return Facilitator.find_by_email(token["user_email"]) if Facilitator.find_by_email(token["user_email"])
#     return Organization.find_by_email(token["user_email"]) if Organization.find_by_email(token["user_email"])
#   end

#   def authenticate_cookie
#     decoded_token = the_token()
#     if decoded_token
#       # debugger
#       user = the_user()
#     end
#     if user then return true else render json: {status: 'unauthorized', code: 401} end
#   end

#   def current_user
#     decoded_token = the_token()
#     if decoded_token
#       user = the_user()
#     end
#     if user then return user else return false end
#   end
# end


class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authenticate_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Facilitator.find_by(id: decoded_token["user_id"])
    end
    if user then return true else render json: {status: 'unauthorized', code: 401} end
  end

  def current_user
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Facilitator.find_by(id: decoded_token["user_id"])
    end
    if user then return user else return false end
  end
end
