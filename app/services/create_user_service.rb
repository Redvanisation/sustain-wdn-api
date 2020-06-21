class CreateUserService
  def initialize(params)
    @params = params
    @user = User.new(@params)
  end
  # debugger
  def call
    # debugger
    if @params[:image] && !file?(@params[:image])
      delete_image if @user.image.attached?
      @params.delete(:image)
    end

    
    @user.save ? @user.image.attach(@params[:image]) : false
  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def delete_image
    @user.image.purge
  end
end