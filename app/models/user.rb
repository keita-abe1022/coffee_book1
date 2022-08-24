class User < ApplicationRecord
  VALID_EMAIL_REGAX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { email.downcase! }
  validates :user_name, presence: true
  validates :email, presence: true,
                          format: { with: VALID_EMAIL_REGAX },
                          uniqueness: { case_sensitive: false }
  has_secure_password
end
