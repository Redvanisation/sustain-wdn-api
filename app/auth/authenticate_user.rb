class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_email: user.email) if user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = find_user
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end

  def find_user
    return User.find_by(email: email) if User.find_by(email: email)
    return Facilitator.find_by(email: email) if Facilitator.find_by(email: email)
    return Organization.find_by(email: email) if Organization.find_by(email: email)
  end
end