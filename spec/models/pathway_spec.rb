require 'rails_helper'

RSpec.describe Pathway, type: :model do
  
  it { should have_and_belong_to_many(:users) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:subtitle) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:education_levels) }
  it { should validate_presence_of(:subjects) }
  it { should validate_presence_of(:activities) }
  it { should validate_presence_of(:soft_skills) }
  it { should validate_presence_of(:support_types) }
end
