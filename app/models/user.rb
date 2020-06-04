class User < ApplicationRecord

  belongs_to :facilitator
  has_and_belongs_to_many :pathways
  has_and_belongs_to_many :organizations

  has_one_attached :image

  validates_presence_of :name, :email, :password_digest
  # :educartion_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale
end
