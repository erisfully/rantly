class User < ActiveRecord::Base
  has_secure_password

  validates :username, :first_name, :last_name, :password, :bio, :frequency, :presence => true
  validates :username, :uniqueness => true
end
