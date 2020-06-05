class Api::V1::FacilitatorsController < ApplicationController
  
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
end
