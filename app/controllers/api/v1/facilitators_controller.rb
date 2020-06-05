class Api::V1::FacilitatorsController < ApplicationController
  before_action :authenticate_facilitator_cookie, except: [:create] 
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create]

  
  def index
    facilitator = Facilitator.all
    render json: facilitator
  end

  def create
    facilitator = CreateFacilitatorService.new(facilitator_params).call

    if facilitator
      render json: 'Success!!'
    else
      render json: 'Unable to register as a facilitator', status: 400
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: 'Unable to find the facilitator', status: 400
    end
  end

  def update
    if @user.update(facilitator_params)
      render json: @user
    else
      render json: 'Unable to update the facilitator', status: 400
    end
  end

  def destroy
    @user.destroy
    render json: 'User deleted successfully!'
  end

  private

  def facilitator_params
    params.permit(:name, :email, :password, :image)
  end

    # Get the user from the url
    def set_user
      @user = Facilitator.find(params[:id])
    end
  
    # Check if the user got from the url is the same as the current_user otherwise throw an error
    def check_user
      render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id
    end

  def authenticate_facilitator_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Facilitator.find_by_email(decoded_token["user_email"])
    end
    if user then return true else render json: 'Unauthorized', status: 401 end
  end
end
