class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id

  validates :username, :first_name, :last_name, :password, :bio, :frequency, :presence => true
  validates :username, :uniqueness => true
end
