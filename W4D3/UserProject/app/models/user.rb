class User < ActiveRecord::Base

  validates :username, :session_token, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_tokens

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && BCrypt::Password.new(password_digest).is_password?(password)
      return user
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_tokens
    self.session_token ||= User.generate_session_token
  end
end