class Organization < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :opportunities


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest, :description, :industry,
                        :interships, :jobs, :other_opportunities, :related_subjects,
                        :related_activities, :related_soft_skills
end
