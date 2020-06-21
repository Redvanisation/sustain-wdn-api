class CreateOrganizationService
  def initialize(params)
    @params = params
    @organization = Organization.new(@params)
  end

  def call
    if @params[:image] && !file?(@params[:image])
      delete_image if @organization.image.attached?
      @params.delete(:image)
    end

    @organization.save ? @organization.image.attach(@params[:image]) : false
  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def delete_image
    @organization.image.purge
  end
end