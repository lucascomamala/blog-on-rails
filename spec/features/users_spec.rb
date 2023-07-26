require 'rails_helper'

RSpec.describe 'Users' do
  describe 'User #index' do
    let!(:user) { FactoryBot.create(:user) }

    before do
      visit users_path
    end
    
    it 'Should render Lucas in the index page' do
      expect(page).to have_content('Lucas')
    end

    it 'Should be able to view profile pictures' do
      expect(page).to have_css('img')
    end

    it 'Should render the number of posts' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'Should load user#show when you click on that user' do
      click_on 'Lucas'
      expect(page).to have_current_path(user_path(user))
    end
  end

  describe 'User #show' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, author: user) }
    let!(:post2) { FactoryBot.create(:post, author: user, title: 'abc') }
    let!(:post3) { FactoryBot.create(:post, author: user, title: 'def') }
    let!(:post4) { FactoryBot.create(:post, author: user, title: 'ghi') }

    before do
      visit user_path(user)
      @users = Post.all
    end

    it 'can see the user\'s profile picture' do
      expect(page).to have_css("img[src*='']")
    end

    it 'can see the user\'s username' do
      expect(page).to have_content('Lucas')
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'can see the user\'s bio' do
      expect(page).to have_content('Self-taught web developer with over')
    end

    it 'can see the user\'s first 3 posts' do
      expect(page).to have_content(post4.title)
      expect(page).to have_content(post3.title)
      expect(page).to have_content(post2.title)
    end

    it 'can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click a \'s post, it redirects me to that post\'s show page' do
      click_on post4.title
      expect(page).to have_current_path(user_post_path(user, post4))
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
      click_on 'See all posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
