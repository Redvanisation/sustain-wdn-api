class Organization < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :opportunities

  validates_presence_of :name, :email, :password_digest, :description, :industry,
                        :interships, :jobs, :other_opportunities, :related_subjects,
                        :related_activities, :related_soft_skills
end
