class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :type, :related_field, :organization_id, :updated_at

  def updated_at
    object.updated_at.to_date
  end
end
