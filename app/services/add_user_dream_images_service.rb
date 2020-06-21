class AddUserDreamImagesService

  def initialize(params)
    @params = params
    # debugger
    @user = User.find(@params[:id])
  end

  # debugger
  def call
    if @params[:blue_image] 
      unless file?(@params[:blue_image])
        @user.blue_image.purge if @user.blue_image.attached?
        @params.delete(:blue_image)
      end
      @user.save ? @user.blue_image.attach(@params[:blue_image]) : false
      
    elsif @params[:green_image]
      unless file?(@params[:green_image])
        @user.green_image.purge if @user.green_image.attached?
        @params.delete(:green_image)
      end
      @user.save ? @user.green_image.attach(@params[:green_image]) : false
    
    elsif @params[:orange_image]
      unless file?(@params[:orange_image])
        @user.orange_image.purge if @user.orange_image.attached?
        @params.delete(:orange_image)
      end
      @user.save ? @user.orange_image.attach(@params[:orange_image]) : false
    end

  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

end