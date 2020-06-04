class Facilitator < ApplicationRecord

  has_secure_password

  has_many :users

  validates_presence_of :name, :email, :password_digest

end
