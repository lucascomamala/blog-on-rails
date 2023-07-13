require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }

  let(:post) { Post.create(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: user) }

  describe '#increment_comments_counter' do
    it 'increments the comments_counter of the post' do
      Comment.create(text: 'Content', post:, user:)
      expect(post.comments_counter).to eq(1)
    end
  end

  describe '#decrement_comments_counter' do
    it 'decrements the comments_counter of the post' do
      comment = Comment.create(text: 'Content', post:, user:)
      comment.destroy
      expect(post.comments_counter).to eq(0)
    end
  end
end
