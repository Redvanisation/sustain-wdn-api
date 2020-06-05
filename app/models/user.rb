class User < ApplicationRecord
  
  belongs_to :facilitator
  has_and_belongs_to_many :pathways
  has_and_belongs_to_many :organizations
  
  has_one_attached :image
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: false}

  validates :name, presence: true, uniqueness: true

  validates_presence_of :password_digest
  # :educartion_level, :fav_subjects, :fav_activities, :soft_skills, :support_types, :eager_scale

  def self.handle_login(email, password)
    user = User.find_by(email: email.downcase)
    # debugger
    if user && user.authenticate(password)
      user_info = Hash.new
      user_info[:token] = CoreModules::JsonWebToken.encode({user_email: user.email}, 4.hours.from_now)
      user_info[:user_id] = user.id
      user_info[:name] = user.name.capitalize
      user_info[:email] = user.email.downcase
      user_info[:education_level] = user.education_level ? user.education_level.downcase : nil
      user_info[:fav_subjects] = user.fav_subjects ? user.fav_subjects.downcase : nil
      user_info[:fav_activities] = user.fav_activities ? user.fav_activities.downcase : nil
      user_info[:soft_skills] = user.soft_skills ? user.soft_skills.downcase : nil
      user_info[:support_types] = user.support_types ? user.support_types.downcase : nil
      user_info[:eager_scale] = user.eager_scale ? user.eager_scale.downcase : nil
      user_info[:active_pathway] = user.active_pathway ? user.active_pathway.downcase : nil
      user_info[:facilitator_id] = user.facilitator_id

      return user_info
    else
      return false
    end
  end

end
