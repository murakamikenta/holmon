class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :create_access_token
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 2 }
    
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
    
  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_token)
    end
    
    def create_access_token
      self.access_token = User.encrypt(User.new_token)
    end
    
end
