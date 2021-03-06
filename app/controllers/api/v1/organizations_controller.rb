class Api::V1::OrganizationsController < ApplicationController
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create]

  skip_before_action :authorize_request, only: :create

  def index
    # debugger
    organization = Organization.all.with_attached_image
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
    # debugger
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
    params.permit(:name, :email, :password, :image, :description, :industry, :interships, :other_opportunities, :jobs, :related_subjects, :related_activities, :related_soft_skills)
  end

  # Get the user from the url
  def set_user
    @user = Organization.find(params[:id])
  end

  # Check if the user got from the url is the same as the current_user otherwise throw an error
  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id
  end

end
