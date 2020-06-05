class SessionsController < ApplicationController
  before_action only: [:destroy] do 
    authenticate_cookie
  end

  def create
    email = params["email"]
    password = params["password"]
    if email && password
      login_hash = User.handle_login(email, password)
      if login_hash
        cookies.signed[:jwt] = {value:  login_hash[:token], httponly: true}
        render json: {
          user: login_hash
        }
      else
        render json: 'incorrect email or password', status: 400 
      end
    else
      render json: 'specify email address and password', status: 400
    end
  end

  def destroy
    user = current_user
    if user  
      cookies.delete(:jwt)
      render json: 'Logged out successfully'
    else
      render json: 'session not found', status: 404
    end
  end
end
