module CoreModules::JsonWebToken
  require 'jwt'

  # ENV['SECRET_KEY_BASE']

  # Rails.application.secrets.secret_key_base

  SECRET_KEY = ENV['SECRET_KEY_BASE']

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    begin
    body = JWT.decode(token, SECRET_KEY)
      if body then HashWithIndifferentAccess.new body[0] else return false end
    rescue JWT::ExpiredSignature, JWT::VerificationError => e
      return false
    rescue JWT::DecodeError, JWT::VerificationError => e
      return false
    end
  end
end