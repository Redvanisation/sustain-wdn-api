class Opportunity < ApplicationRecord

  belongs_to :organization

  validates_presence_of :name, :description, :type, :related_field, :organization_id
end
