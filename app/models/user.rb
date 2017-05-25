class User < ActiveRecord::Base
  validates :first_name,:last_name,:username, presence: true
  validates :username, uniqueness: true

  has_secure_password
end
