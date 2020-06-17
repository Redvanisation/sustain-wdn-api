class Api::V1::FacilitatorUsersController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :check_user, except: [:index, :create]
  # before_action :get_facilitator, only: [:index]

  # skip_before_action :authorize_request, only: :create

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

  def show
    if @user
      render json: @user.pathways
    else
      render json: 'Unable to get the pathways', status: 400
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id
  end
end
