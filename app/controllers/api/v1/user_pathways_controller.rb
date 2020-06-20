class Api::V1::UserPathwaysController < ApplicationController
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create, :show]
  # before_action :get_facilitator, only: [:index]

  skip_before_action :authorize_request, only: [:create, :show]


  def index
    # debugger
    pathways = current_user.pathways

    render json: pathways
  end

  # def create
  #   user = CreateUserService.new(user_params).call
  #   if user
  #     render json: 'Success!'
  #   else
  #     render json: 'Error registering', status: 400
  #   end
  # end

  # def show
  #   if @user
  #     render json: @user
  #   else
  #     render json: 'Unable to find the user', status: 400
  #   end
  # end

  def update
    debugger
    if @user.pathways << params[:pathway]
      render json: @user.pathways
    else
    #   # debugger
      render json: 'Unable to pathways to favorites', status: 400
    end
  end

  # def destroy
  #   @user.destroy
  #   render json: 'User deleted successfully!'
  # end


  private

  def user_pathways_params
    params.permit(:id)
  end

  # Get the user from the url
  def set_user
    @user = User.find(params[:id])
  end

  # Check if the user got from the url is the same as the current_user otherwise throw an error
  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id || @user.facilitator_id == current_user.id || current_user.admin
  end

end
