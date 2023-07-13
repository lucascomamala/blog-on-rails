require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }

  let(:post) { Post.create(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: user) }

  describe '#increment_likes_counter' do
    it 'increments the likes_counter of the post' do
      Like.create(user:, post:)
      expect(post.likes_counter).to eq(1)
    end
  end

  describe '#decrement_likes_counter' do
    it 'decrements the likes_counter of the post' do
      like = Like.create(user:, post:)
      like.destroy
      expect(post.likes_counter).to eq(0)
    end
  end
end
