class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Returns the 5 most recent comments for the post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
