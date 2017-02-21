class User < ApplicationRecord
  validates :email,  presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
