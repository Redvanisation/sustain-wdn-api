class Api::V1::UsersController < ApplicationController
  
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
end