class User < ApplicationRecord
  
  belongs_to :facilitator
  has_and_belongs_to_many :pathways
  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :opportunities
  
  has_one_attached :image
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest
  # :educartion_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale

  def self.handle_login(user)
    user_info = Hash.new
    user_info[:user_id] = user.id
    user_info[:name] = user.name.capitalize
    user_info[:email] = user.email.downcase
    user_info[:role] = user.role
    user_info[:facilitator_id] = user.facilitator_id

    return user_info
  end

end
