class ApplicationController < ActionController::API
  include ActionController::Cookies

  # def authenticate_cookie(user, decoded_token)
  #   # token = cookies.signed[:jwt]
  #   # decoded_token = CoreModules::JsonWebToken.decode(token)
  #   if decoded_token
  #     # user = User.find_by_email(decoded_token["user_email"]) || Facilitator.find_by_email(decoded_token["facilitator_id"]) || Organization.find_by_email(decoded_token["organization_id"])
  #     # debugger
  #   end
  #   if user then return true else render json: {status: 'unauthorized', code: 401} end
  # end


  def current_user
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by_email(decoded_token["user_email"]) || Facilitator.find_by_email(decoded_token["user_email"]) || Organization.find_by_email(decoded_token["user_email"])  
    end
    if user then return user else return false end
  end
end
