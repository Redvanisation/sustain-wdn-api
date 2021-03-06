class Api::V1::UserPathwaysController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :check_user, except: [:index, :show]
  # before_action :get_facilitator, only: [:index]

  skip_before_action :authorize_request, only: [:show]


  def index
    # debugger
    pathways = current_user.pathways

    render json: pathways
  end

  def create
    pathway = Pathway.find(params[:id])
    @user.active_pathway = pathway.title
    
    # debugger
    if @user.save
      render json: @user
    else
      render json: 'Error setting active pathway', status: 400
    end
  end
  
  # def show
  #   if @user
  #     render json: @user
  #   else
  #     render json: 'Unable to find the user', status: 400
  #   end
  # end
  
  def update
    pathway = Pathway.find(params[:id])
    # debugger

    if @user.pathways.exclude?(pathway)  
      @user.pathways << pathway
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
    # debugger
    params.permit(:id)
  end

  # Get the user from the url
  def set_user
    # debugger
    @user = User.find(params[:user_id])
  end

  # Check if the user got from the url is the same as the current_user otherwise throw an error
  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id || @user.facilitator_id == current_user.id || current_user.admin
  end

end
