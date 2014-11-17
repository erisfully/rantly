class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :comment, :user_id, :commentable_id, :presence => true
end