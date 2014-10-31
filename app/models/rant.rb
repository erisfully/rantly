class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  validates :topic, :rant, :user_id, :presence => true
  validates :topic, length: {maximum: 50}
  validates :rant, length: {minimum: 140}
end