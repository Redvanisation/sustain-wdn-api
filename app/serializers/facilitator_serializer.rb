class FacilitatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :updated_at, :image

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