class SessionsController < ApplicationController
  before_action only: [:destroy] do 
    authenticate_cookie
  end

  def create
    email = params["email"]
    password = params["password"]
    if email && password
      login_hash = get_login_hash(email, password)
      if login_hash
        cookies.signed[:jwt] = { value: login_hash[:token], httponly: true }
        # debugger
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
    # debugger
    if current_user
      cookies.delete(:jwt)
      render json: 'Logged out successfully'
    else
      render json: 'session not found', status: 404
    end
  end

  private

  def get_login_hash(email, password)
    login_hash = User.handle_login(email, password) if User.handle_login(email, password)
    login_hash = Facilitator.handle_login(email, password) if Facilitator.handle_login(email, password)
    login_hash = Organization.handle_login(email, password) if Organization.handle_login(email, password)
    login_hash
  end
end
