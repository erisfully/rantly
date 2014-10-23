class Follow < ActiveRecord::Base
  belongs_to :user, foreign_key: :follower_id
  belongs_to :user, foreign_key: :followee_id

  validates :follower_id, :followee_id, :presence => true
  validates_uniqueness_of :follower_id, scope: :followee_id
end