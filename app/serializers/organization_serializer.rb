class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :description, :industry, :interships, :other_opportunities, :jobs, :related_subjects, :related_activities, :related_soft_skills, :updated_at

  def updated_at
    object.updated_at.to_date
  end
end
