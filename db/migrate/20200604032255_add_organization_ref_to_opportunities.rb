class AddOrganizationRefToOpportunities < ActiveRecord::Migration[6.0]
  def change
    add_reference :opportunities, :organization, foreign_key: true
  end
end
