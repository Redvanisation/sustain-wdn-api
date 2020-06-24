require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'checks associations' do
    it { should have_and_belong_to_many(:users) }
    it { should have_many(:opportunities) }
  end
  
  context 'checks for validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
