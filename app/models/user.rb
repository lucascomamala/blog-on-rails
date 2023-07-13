class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes

  validates_presence_of :name
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal_to: 0

  # Returns the 3 most recent posts for the user
  def recent_posts
    posts.order(updated_at: :desc).limit(3)
  end
end
