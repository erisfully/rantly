class Favorite < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :rant, foreign_key: :rant_id, counter_cache: true

  validates_uniqueness_of :user_id, :scope => :rant_id
end