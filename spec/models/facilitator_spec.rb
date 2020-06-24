require 'rails_helper'

RSpec.describe Facilitator, type: :model do

  context 'checks associations' do
    it { should have_many(:users) }
  end

  context 'checks  for validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
