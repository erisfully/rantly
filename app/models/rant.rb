class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :topic, :rant, :user_id, :presence => true
  validates :topic, length: {maximum: 50}
  validates :rant, length: {minimum: 140}

  def self.mentions(user)
    Rant.where('rant LIKE ?', '%@' + user.username + '%')
  end
end