class Api::V1::OrganizationsController < ApplicationController
  before_action :authenticate_organization_cookie, except: [:create]
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create]

  def index
    organization = Organization.all
    render json: organization
  end

  def create
    organization = CreateOrganizationService.new(organization_params).call

    if organization
      render json: 'Success!'
    else
      render json: 'Unable to register the organization', status: 400
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: 'Unable to find the organization', status: 400
    end
  end

  def update
    if @user.update(organization_params)
      render json: @user
    else
      render json: 'Unable to update the organization', status: 400
    end
  end

  def destroy
    @user.destroy
    render json: 'User deleted successfully!'
  end

  private

  def organization_params
    params.permit(:name, :email, :password, :description, :industry, :interships, :other_opportunities, :jobs, :related_subjects, :related_activities, :related_soft_skills)
  end

  # Get the user from the url
  def set_user
    @user = Organization.find(params[:id])
  end

  # Check if the user got from the url is the same as the current_user otherwise throw an error
  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id
  end

  def authenticate_organization_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Organization.find_by_email(decoded_token["user_email"])
    end
    if user then return true else render json: 'Unauthorized', status: 401 end
  end
  
end
