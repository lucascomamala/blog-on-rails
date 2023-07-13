class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates_presence_of :text
  validates_numericality_of :comments_counter, :likes_counter, only_integer: true, greater_than_or_equal_to: 0

  # Returns the 5 most recent comments for the post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
