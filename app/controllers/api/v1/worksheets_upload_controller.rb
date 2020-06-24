class Api::V1::WorksheetsUploadController < ApplicationController
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create, :show]
  # before_action :get_facilitator, only: [:index]

  skip_before_action :authorize_request, only: [:create, :show]

  def update
    # worksheets = [:bio_worksheet, :development_worksheet, :sustainability_worksheet, :college_prep_worksheet, :five_years_worksheet]
    

    if params[:bio_worksheet]
      @user.bio_worksheet.attach(params[:bio_worksheet])
      render json: @user
    
    elsif params[:development_worksheet]
      @user.development_worksheet.attach(params[:development_worksheet])
      render json: @user
    
    elsif params[:sustainability_worksheet]
      @user.sustainability_worksheet.attach(params[:sustainability_worksheet])
      render json: @user
    
    elsif params[:college_prep_worksheet]
      @user.college_prep_worksheet.attach(params[:college_prep_worksheet])
      render json: @user
    
    elsif params[:five_years_worksheet]
      @user.five_years_worksheet.attach(params[:five_years_worksheet])
      render json: @user
    
    else
      render json: "Can't attach document", status: 400
    end


  end

  private

    # Get the user from the url
    def set_user
      @user = User.find(params[:id])
    end
  
    def get_facilitator
      set_user
      # debugger
      @facilitator = Facilitator.find(@user.facilitator_id)
    end
  
    # Check if the user got from the url is the same as the current_user otherwise throw an error
    def check_user
      render json: 'You are unauthorized!', status: 401 unless @user.id == current_user.id || @user.facilitator_id == current_user.id
    end

    def worksheet_params
      params.permit(:bio_worksheet, :development_worksheet, :sustainability_worksheet, :college_prep_worksheet, :five_years_worksheet)
    end
end
