class OrganizationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :email, :description, :industry, :interships, :other_opportunities, :jobs, :related_subjects, :related_activities, :related_soft_skills, :updated_at, :image

  def image
    return unless object.image.attached?

    object.image.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(object.image)
  end


  def updated_at
    object.updated_at.to_date
  end
end
