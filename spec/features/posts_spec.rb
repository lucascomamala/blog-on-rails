require 'rails_helper'

RSpec.describe 'Posts' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, author: user) }
  let!(:post2) { FactoryBot.create(:post, author: user, title: 'abc') }
  let!(:comment) { FactoryBot.create(:comment, post:, text: '123') }
  let!(:comment2) { FactoryBot.create(:comment, post:) }
  let!(:comment3) { FactoryBot.create(:comment, post:) }
  let!(:comment4) { FactoryBot.create(:comment, post:) }
  let!(:comment5) { FactoryBot.create(:comment, post:) }
  let!(:comment6) { FactoryBot.create(:comment, post:, text: 'holahola') }

  describe 'Post #index' do
    before do
      visit user_posts_path(user)
    end

    it "I can see the user's profile picture." do
      expect(page).to have_css("img[src*='']")
    end

    it "I can see the user's username." do
      expect(page).to have_content(user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end

    it "I can see a post's title." do
      expect(page).to have_content(post.title)
      expect(page).to have_content(post2.title)
    end

    it "I can see some of the post's body." do
      expect(page).to have_content(post.text[0...20])
      expect(page).to have_content(post2.text[0...20])
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content(comment6.text)
      expect(page).to have_content(comment5.text)
      expect(page).to have_content(comment4.text)
      expect(page).to have_content(comment3.text)
      expect(page).to have_content(comment2.text)
      expect(page).to_not have_content(comment.text)
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it "When I click on a post, it redirects me to that post's show page. " do
      click_on post.title
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end

  describe 'Post #show' do
    before do
      visit user_post_path(user, post)
    end

    it "I can see the post's title." do
      expect(page).to have_content(post.title)
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content(user.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'I can see the post body.' do
      expect(page).to have_content(post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content(comment.user.name)
      expect(page).to have_content(comment2.user.name)
      expect(page).to have_content(comment3.user.name)
      expect(page).to have_content(comment4.user.name)
      expect(page).to have_content(comment5.user.name)
      expect(page).to have_content(comment6.user.name)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(comment.text)
      expect(page).to have_content(comment2.text)
      expect(page).to have_content(comment3.text)
      expect(page).to have_content(comment4.text)
      expect(page).to have_content(comment5.text)
      expect(page).to have_content(comment6.text)
    end

    it 'When I click on author\'s name it take me to user\'s profile' do
      click_on user.name
      expect(page).to have_current_path(user_path(user))
    end

    it 'When I click the like button it increases the likes counter by 1' do
      expect(page).to have_content("Likes: 0")
      click_on(class: 'like-btn')
      expect(page).to have_content("Likes: 1")
    end

    it 'When I click the dislike button it decreases the likes counter by 1' do
      expect(page).to have_content("Likes: 0")
      click_on(class: 'like-btn')
      click_on(class: 'like-btn')
      expect(page).to have_content("Likes: 0")
    end
  end
end
