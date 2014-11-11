class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rant

  validates :comment, :presence => true
end