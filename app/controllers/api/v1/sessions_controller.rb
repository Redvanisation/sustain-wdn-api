# class SessionsController < ApplicationController
#   before_action only: [:destroy] do 
#     authenticate_cookie
#   end

#   before_action :get_login_hash, only: [:create]

#   def create
#     if @login_hash
#       cookies.signed[:jwt] = { value: @login_hash[:token], httponly: true }
#       # debugger
#       render json: {
#         user: @login_hash
#       }
#     else
#       render json: 'incorrect email or password', status: 400
#     end
#   end

#   def destroy
#     # debugger
#     if current_user
#       cookies.delete(:jwt)
#       render json: 'Logged out successfully'
#     else
#       render json: 'session not found', status: 404
#     end
#   end

#   private

#   def get_login_hash
#     email = params["email"]
#     password = params["password"]

#     # if email && password
#       if User.handle_login(email, password)
#         @login_hash = User.handle_login(email, password)
#       elsif Facilitator.handle_login(email, password)
#         @login_hash = Facilitator.handle_login(email, password)
#       elsif Organization.handle_login(email, password)
#         @login_hash = Organization.handle_login(email, password)
#       end
#     # else
#     #   render json: 'specify email address and password', status: 400
#     # end
#   end
# end

class Api::V1::SessionsController  < ApplicationController
  before_action only: [:destroy] do 
    authenticate_cookie
  end

  def destroy
    user = current_user
    if user  
      cookies.delete(:jwt)
      render json: {status: 'OK', code: 200}
    else
      render json: {status: 'session not found', code: 404}
    end
  end

  def create
    email = params["email"]
    password = params["password"]
    
    if email && password
      login_hash = Facilitator.handle_login(email, password)
      # debugger
      if login_hash
        cookies.signed[:jwt] = {value:  login_hash[:token], httponly: true}
        render json: { 
          user_id: login_hash[:user_id],
          name: login_hash[:name],
        }
      else
        render json: {status: 'incorrect email or password', code: 422}  
      end
    else
      render json: {status: 'specify email address and password', code: 422}
    end
  end
end