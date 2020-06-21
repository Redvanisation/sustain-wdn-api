class Pathway < ApplicationRecord

  has_and_belongs_to_many :users

  validates_presence_of :title, :description, :responsibilities, :qualifications, :salary, :education_levels, :subjects, :activities, :soft_skills
end
