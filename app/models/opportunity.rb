class Opportunity < ApplicationRecord
  self.inheritance_column = :sti_disabled
  has_and_belongs_to_many :users
  belongs_to :organization


  validates_presence_of :name, :description, :type, :related_field, :organization_id
end
