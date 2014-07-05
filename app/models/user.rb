class User < ActiveRecord::Base
  has_secure_password

  # Validation macros
  USERNAME_FORMAT = /\A[a-z0-9\-_]+\Z/i
  validates :username, presence: true
  validates :username, format: { with: USERNAME_FORMAT }
  validates :username, length: { in: 3..25 }
  validates :username, uniqueness: { case_sensitive: false }

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT }
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 5 }
end
