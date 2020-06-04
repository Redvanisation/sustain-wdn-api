class Facilitator < ApplicationRecord

  has_many :users

  validates_presence_of :name, :email, :password_digest, :admin

end
