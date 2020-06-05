class Api::V1::OrganizationsController < ApplicationController
  before_action except: [:create] do 
    authenticate_organization_cookie
  end

  def index
    organization = Organization.all
    render json: organization
  end

  def create
    organization = Organization.new(organization_params)
    # debugger
    if organization.save
      render json: organization
    else
      render 'Unable to register as an organization', status: 400
    end
  end

  private

  def organization_params
    params.permit(:name, :email, :password, :description, :industry, :interships, :other_opportunities, :jobs, :related_subjects, :related_activities, :related_soft_skills)
  end

  def authenticate_organization_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Organization.find_by_email(decoded_token["user_email"])
      # debugger
    end
    if user then return true else render json: 'Unauthorized', status: 401 end
  end
  
end
