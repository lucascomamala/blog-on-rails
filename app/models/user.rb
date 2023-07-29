class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attribute :posts_counter, default: 0

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'user_id'

  validates_presence_of :name
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Returns the 3 most recent posts for the user
  def recent_posts
    posts.order(updated_at: :desc).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
