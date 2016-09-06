class User < ApplicationRecord

  has_many :surveys
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :username, :presence => true, :uniqueness => true
  #TODO: Implement email confirmation
  # validates :email, :presence => true, :format => EMAIL_REGEX

  #TODO: Encrypt passwords
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true
  validates_length_of :password, :in => 6..20, :on => :create
end
