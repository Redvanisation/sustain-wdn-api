class Api::V1::UsersController < ApplicationController
  before_action except: [:create] do 
    authenticate_user_cookie
  end

  def index
    user = User.all
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: 'Error registering', status: 400
    end
  end


  private

  def user_params
    params.permit(:name, :email, :education_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale, :active_pathway, :facilitator_id, :image, :password)
  end

  def authenticate_user_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by_email(decoded_token["user_email"])
      # debugger
    end
    if user then return true else render json: 'Unauthorized', status: 401 end
  end
end