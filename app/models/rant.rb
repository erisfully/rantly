class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :topic, :rant, :user_id, :presence => true
  validates :topic, length: {maximum: 50}
  validates :rant, length: {minimum: 140}

  def self.mentions(user)
    Rant.where('rant LIKE ?', '%@' + user.username + '%')
  end

  def self.search(search)
    joins(:user).where('users.username = ? OR
      users.first_name = ? OR
      users.last_name = ? OR
      rants.rant LIKE ? OR
      rants.topic LIKE ?',
      search, search, search, '%' + search + '%', '%' + search + '%')
  end
end