class Api::V1::FacilitatorsController < ApplicationController
  before_action except: [:create] do 
    authenticate_facilitator_cookie
  end

  
  def index
    facilitator = Facilitator.all
    render json: facilitator
  end

  def create
    facilitator = Facilitator.new(facilitator_params)
    if facilitator.save
      render json: facilitator
    else
      render json: 'Unable to register as a facilitator', status: 400
    end
  end

  private

  def facilitator_params
    params.permit(:name, :email, :password, :image)
  end

  def authenticate_facilitator_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Facilitator.find_by_email(decoded_token["user_email"])
      # debugger
    end
    if user then return true else render json: 'Unauthorized', status: 401 end
  end
end
