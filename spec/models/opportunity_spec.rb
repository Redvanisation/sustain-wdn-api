require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  context 'checks associations' do
    it { should belong_to(:organization) }
  end
  
  context 'checks for validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:related_field) }
    it { should validate_presence_of(:organization_id) }
  end
end
