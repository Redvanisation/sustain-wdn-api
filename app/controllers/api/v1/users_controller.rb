class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:index, :create]
  before_action :check_user, except: [:index, :create, :show]
  # before_action :get_facilitator, only: [:index]

  skip_before_action :authorize_request, only: [:create, :show]


  def index
    # debugger
    users = User.all.with_attached_image

    render json: users
  end

  def create
    user = CreateUserService.new(user_params).call
    if user
      render json: 'Success!'
    else
      render json: 'Error registering', status: 400
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: 'Unable to find the user', status: 400
    end
  end

  def update
    # debugger
    if @user.update(user_params)
      render json: @user
    else
      # debugger
      render json: 'Unable to update the user', status: 400
    end
  end

  def destroy
    @user.destroy
    render json: 'User deleted successfully!'
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

  # Permitting the user's params
  def user_params
    params.permit(:name, :email, :bio, :greatest_assets, :greatest_challenges, :education_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale, :active_pathway, :life_dream, :community_dream, :world_dream, :facilitator_id, :image, :password, :bio_worksheet, :development_worksheet, :sustainability_worksheet, :college_prep_worksheet, :five_years_worksheet)
  end

end