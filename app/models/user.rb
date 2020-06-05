class User < ApplicationRecord
  has_secure_password

  belongs_to :facilitator
  has_and_belongs_to_many :pathways
  has_and_belongs_to_many :organizations

  has_one_attached :image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest
  # :educartion_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale
end
