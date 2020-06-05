class FacilitatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :updated_at

  def updated_at
    object.updated_at.to_date
  end
end
