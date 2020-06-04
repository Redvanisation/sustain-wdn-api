require 'rails_helper'

RSpec.describe Facilitator, type: :model do

  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:admin) }
end
