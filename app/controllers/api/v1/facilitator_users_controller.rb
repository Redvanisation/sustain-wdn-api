class Api::V1::FacilitatorUsersController < ApplicationController
  before_action :set_user, except: [:index, :users_count]
  before_action :second_user, only: [:users_count]
  before_action :check_user, except: [:index, :create]


  def index
    initial_users = User.all.with_attached_image
    users = []
    
    initial_users.each do |user|
      if user.facilitator_id == @current_user.id
        users << user
      end
    end

    if users
      render json: users
    else
      render json: 'Unable to get the users', status: 400
    end
  end

  def users_count
    initial_users = User.all.with_attached_image
    users = []
    
    # debugger
    initial_users.each do |user|
      if user.facilitator_id == @user.id
        users << user
      end
    end

    if users
      render json: users
    else
      render json: 'Unable to get the users', status: 400
    end
  end

  def show
    if @user
      render json: @user.pathways
    else
      render json: 'Unable to get the pathways', status: 400
    end
  end


  private

  def the_params
    params.permit(:user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def second_user
    @user = Facilitator.find(params[:user_id])
  end

  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id || current_user.admin
  end
end
