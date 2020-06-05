class Facilitator < ApplicationRecord

  has_secure_password

  has_many :users


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest

end
