require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    let(:user) { FactoryBot.create(:user) }
    
    before :each do
      get user_posts_path(1)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render post/index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts/:post_id' do
    let(:post) { FactoryBot.create(:post) }
    let(:user) { post.author }

    before :each do
      get user_post_path(user.id, post.id)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render posts/show view' do
      user_post_path(1, 1)
      expect(response).to render_template(:show)
    end
  end
end
