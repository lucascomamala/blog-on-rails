require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author1) { User.create(name: 'John Doe', posts_counter: 0) }

  it 'is valid with valid attributes' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: author1)
    expect(post).to be_valid
  end
  it 'is not valid without a title' do
    post = Post.new(title: nil, text: 'Content', comments_counter: 0, likes_counter: 0, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with title exceeding 250 characters' do
    text = 'a' * 251
    post = Post.new(title: text, text: 'Mickey Mouse is a lie', comments_counter: 0, likes_counter: 0,
                    author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid without content' do
    post = Post.new(title: 'Title', text: nil, comments_counter: 0, likes_counter: 0, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with an empty comments_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: nil, likes_counter: 0, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with an empty likes_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: nil, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with negative comments_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: -1, likes_counter: 0, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with negative likes_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: -1, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with non-integer comments_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: 1.5, likes_counter: 0, author: author1)
    expect(post).to_not be_valid
  end
  it 'is not valid with non-integer likes_counter' do
    post = Post.new(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 1.5, author: author1)
    expect(post).to_not be_valid
  end

  context 'Methods tests' do
    describe '#recent_comments' do
      let!(:post) do
        Post.create(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: author1)
      end
      let!(:comment1) { Comment.create(text: 'Content1', post:, user: author1) }
      let!(:comment2) { Comment.create(text: 'Content2', post:, user: author1) }
      let!(:comment3) { Comment.create(text: 'Content3', post:, user: author1) }
      let!(:comment4) { Comment.create(text: 'Content4', post:, user: author1) }
      let!(:comment5) { Comment.create(text: 'Content5', post:, user: author1) }

      it 'returns the 5 most recent comments for the post' do
        expect(post.recent_comments).to match_array([comment5, comment4, comment3, comment2, comment1])
      end
    end

    describe '#increment_post_counter' do
      it 'increments the posts_counter of the author' do
        Post.create(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: author1)
        expect(author1.posts_counter).to eq(1)
      end
    end

    describe '#decrement_post_counter' do
      it 'decrements the posts_counter of the author' do
        post = Post.create(title: 'Title', text: 'Content', comments_counter: 0, likes_counter: 0, author: author1)
        post.destroy
        expect(author1.posts_counter).to eq(0)
      end
    end
  end
end
