class Rant < ActiveRecord::Base
  belongs_to :user

  validates :topic, :rant, :user_id, :presence => true
end