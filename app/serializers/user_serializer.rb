class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :email, :education_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale, :active_pathway, :facilitator_id, :updated_at, :image

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
