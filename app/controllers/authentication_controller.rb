class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      render json: { auth_token: auth_token, user: find_user }
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end

    def find_user
      return User.handle_login(User.find_by_email(auth_params[:email])) if User.find_by_email(auth_params[:email])
      return Facilitator.handle_login(Facilitator.find_by_email(auth_params[:email])) if Facilitator.find_by_email(auth_params[:email])
      return Organization.handle_login(Organization.find_by_email(auth_params[:email])) if Organization.find_by_email(auth_params[:email])
    end
end
