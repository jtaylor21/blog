class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  # / start of regex
  # \A match start of string
  # [\w+\-.]+ at lease one word character, plus, hyphen or dot
  # @ literal "at sign"
  # [a-z\d\-.]+ at least one leter, diit, hyphen, or dot
  # \. literal dot
  # [a-z]+ at least one letter
  # \z match end of a string
  # / end of regex
  # i case insensitive
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email, :password
  
  validates_confirmation_of :password
  
  validates_length_of :name, :maximum => 50
  
  validates_length_of  :password, :within => 6..40
  
  validates_uniqueness_of :email, :case_sensitive => false
  
  validates_format_of :email, :with => email_regex
  
  # TODO create database validation to ensure uniqueness of email, reference Hartl Ch.6
  
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

    def self.authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      return nil if user.nil?
      return user if user.salt == cookie_salt
    end
  
  private
  
  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
 
  

  
  
end