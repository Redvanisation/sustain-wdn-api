class Organization < ApplicationRecord
  has_secure_password
  
  has_and_belongs_to_many :users
  has_many :opportunities

  has_one_attached :image


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest, :description, :industry, :related_subjects,
                        :related_activities, :related_soft_skills

  def self.handle_login(user)
    user_info = Hash.new
    user_info[:user_id] = user.id
    user_info[:name] = user.name.capitalize
    user_info[:email] = user.email.downcase
    user_info[:role] = user.role

    return user_info
  end
end
