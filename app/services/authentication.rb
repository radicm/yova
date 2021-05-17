require "bcrypt"

class Authentication
  include BCrypt

  EXPIRE_TIME = 10.days

  # @param [String] email
  # @param [String] password
  # @return [String]
  def self.create_session(email, password)
    user = User.find_by(email: email)

    return unless user.present? && user.authenticate(password)

    token = SecureRandom.hex
    user.sessions.destroy_all
    user.sessions.create(token: token, expires_at: DateTime.now + EXPIRE_TIME)

    token
  end

  # @param [String] token
  # @return [Boolean]
  def self.destroy_session(token)
    User.joins(:sessions).where(sessions: { token: token }).destroy_all
  end

  # @param [String] token
  # @return [User]
  def self.fetch_user_by_session_token(token)
    User.joins(:sessions).where("sessions.token = ? AND sessions.expires_at > ? ", token, DateTime.now).first
  end
end
