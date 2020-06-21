require 'rails_helper'

RSpec.describe Pathway, type: :model do
  
  context 'checks associations' do
    it { should have_and_belong_to_many(:users) }
  end
  
  context 'checks  for validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:responsibilities) }
    it { should validate_presence_of(:qualifications) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:education_levels) }
    it { should validate_presence_of(:subjects) }
    it { should validate_presence_of(:activities) }
    it { should validate_presence_of(:soft_skills) }
  end
end
