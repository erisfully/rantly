class User < ActiveRecord::Base
  before_create :create_confirmation_token

  has_secure_password
  has_many :rants
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_many :favorites
  has_many :comments, as: :commentable, foreign_key: :commentable_id

  validates :username, :first_name, :last_name, :password, :bio, :frequency, :avatar, :email, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {minimum: 8}

  mount_uploader :avatar, AvatarUploader

  def most_favorites
    rants.sort_by{|rant| rant.favorites_count}.reverse
  end

  def self.authenticate_user(email, password)
    user = find_by_email(email)
    if user && user.authenticate(password)
      user if user.email_confirmed
    else
      nil
    end
  end

  def create_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

end
