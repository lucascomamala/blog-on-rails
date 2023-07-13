require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations tests' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', posts_counter: 0)
      expect(user).to be_valid
    end
    it 'is not valid without a name' do
      user = User.new(name: nil, posts_counter: 0)
      expect(user).to_not be_valid
    end
    it 'is not valid with an empty posts_counter' do
      user = User.new(name: 'John Doe', posts_counter: nil)
      expect(user).to_not be_valid
    end
    it 'is not valid with negative posts_counter' do
      user = User.new(name: 'John Doe', posts_counter: -1)
      expect(user).to_not be_valid
    end
    it 'is not valid with non-integer posts_counter' do
      user = User.new(name: 'John Doe', posts_counter: 1.5)
      expect(user).to_not be_valid
    end
  end

  context 'Methods tests' do
    describe '#recent_posts' do
      it 'returns the 3 most recent posts for the user' do
        user = User.create(name: 'John Doe', posts_counter: 0)
        Post.create(title: 'Title1', text: 'Content1', comments_counter: 0, likes_counter: 0, author: user)
        Post.create(title: 'Title2', text: 'Content2', comments_counter: 0, likes_counter: 0, author: user)
        post3 = Post.create(title: 'Title3', text: 'Content3', comments_counter: 0, likes_counter: 0, author: user)
        post4 = Post.create(title: 'Title4', text: 'Content4', comments_counter: 0, likes_counter: 0, author: user)
        post5 = Post.create(title: 'Title5', text: 'Content5', comments_counter: 0, likes_counter: 0, author: user)
        expect(user.recent_posts).to match_array([post5, post4, post3])
      end
    end
  end
end
