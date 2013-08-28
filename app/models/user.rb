class User < ActiveRecord::Base
  rolify
  has_many :qanotes
  has_many :tasks
  attr_accessible :email, :password, :password_confirmation, :role_id, :remember_me
  attr_accessor :password,:password_confirmation
  before_save :encrypt_password
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, 
            :uniqueness=> true, :presence=> true
  validates_presence_of :roles, :on => :create
  before_create { generate_token(:auth_token) }
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      User.all
    end
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
