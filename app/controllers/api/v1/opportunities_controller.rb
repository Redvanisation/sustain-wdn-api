class Api::V1::OpportunitiesController < ApplicationController
  # before_action :authenticate_organization_cookie, except: [:index, :show]
  before_action :set_organization, except: [:index, :show]
  before_action :check_user, except: [:index, :show]
  before_action :set_opportunity, except: [:index, :create]

  def index
    opportunities = Opportunity.all

    render json: opportunities
  end

  def create
    opportunity = @user.opportunities.build(opportunity_params)

    if opportunity.save
      render json: opportunity
    else
      render json: 'Error adding the opportunity', status: 400
    end
  end

  def show
    if @opportunity
      render json: @opportunity
    else
      render json: 'Error getting the opportunity', status: 400
    end
  end
  
  def update
    if @opportunity.update(opportunity_params)
      render json: @opportunity
    else
      render json: 'Error updating the opportunity', status: 400
    end
  end

  def destroy
    @opportunity.destroy
    render json: 'Opportunity deleted successfully!'
  end

  private

  def opportunity_params
    params.permit(:name, :description, :type, :related_field, :organization_id)
  end

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  # Get the user from the url
  def set_organization
    @user = Organization.find(current_user.id)
  end

  # Check if the user got from the url is the same as the current_user otherwise throw an error
  def check_user
    render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id
  end

  # def authenticate_organization_cookie
  #   token = cookies.signed[:jwt]
  #   decoded_token = CoreModules::JsonWebToken.decode(token)
  #   if decoded_token
  #     user = Organization.find_by_email(decoded_token["user_email"])
  #   end
  #   if user then return true else render json: 'Unauthorized', status: 401 end
  # end
end
