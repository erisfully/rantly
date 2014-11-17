class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_many :favorites
  has_many :comments, as: :commentable, foreign_key: :commentable_id

  validates :username, :first_name, :last_name, :password, :bio, :frequency, :avatar, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {minimum: 8}

  mount_uploader :avatar, AvatarUploader

  def most_favorites
    rants.sort_by{|rant| rant.favorites_count}.reverse
  end

end
