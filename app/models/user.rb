class User < ActiveRecord::Base
  has_many(
  :goals,
  :class_name => "Goal",
  :foreign_key => :user_id,
  :primary_key => :id
  )
  
  
  validates :username, :password_digest, :session_token, presence: true
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password)
    user
  end
  
  def password= (password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
    
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token    
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
end
