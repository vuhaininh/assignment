# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  # Attributes which are accessiable
  attr_accessible :email, :name, :password, :password_confirmation
  
  # Function support for authentication and password related issues
  has_secure_password 
 
 # Downcase the email to avoid case-sensitive when searching
  before_save { |user| user.email = email.downcase }
  
  # Create remember token for the cookies when signing in
  before_save :create_remember_token
  
  # Name should be filled, maximum length is 50 char
  validates :name, presence: true, length: { maximum: 50 }
  
  # Validate format for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }
					
   # Validate Password
   validates :password, length: { minimum: 6 }   
   validates :password_confirmation, presence: true
					
  # Function to create remember_token					
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64 # Generate token
    end
end
