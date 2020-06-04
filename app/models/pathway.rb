class Pathway < ApplicationRecord

  has_and_belongs_to_many(:users)

  validates_presence_of :title, :subtitle, :description, :education_levels, :subjects,
                        :activities, :soft_skills, :support_types
end
