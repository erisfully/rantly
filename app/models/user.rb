class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_many :favorites

  validates :username, :first_name, :last_name, :password, :bio, :frequency, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {minimum: 8}

  def most_favorites
    rants.sort_by{|rant| rant.favorites_count}.reverse
  end
end
