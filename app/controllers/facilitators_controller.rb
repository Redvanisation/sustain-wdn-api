class Api::V1::FacilitatorsController < ApplicationController
  
  def index
    facilitator = Facilitator.all
    render json: facilitator
  end
end
