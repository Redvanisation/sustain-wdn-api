class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :email, :education_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale, :active_pathway, :facilitator_id, :updated_at


  def updated_at
    object.updated_at.to_date
  end
end
