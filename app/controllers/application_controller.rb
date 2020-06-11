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
  # include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
