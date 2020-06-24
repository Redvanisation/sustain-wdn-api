class CreateFacilitatorService
  def initialize(params)
    @params = params
    @facilitator = Facilitator.new(@params)
  end

  def call
    if @params[:image] && !file?(@params[:image])
      delete_image if @facilitator.image.attached?
      @params.delete(:image)
    end

    @facilitator.save ? @facilitator.image.attach(@params[:image]) : false
  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def delete_image
    @facilitator.image.purge
  end
end