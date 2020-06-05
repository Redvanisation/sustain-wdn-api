class Api::V1::OrganizationsController < ApplicationController

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
end
