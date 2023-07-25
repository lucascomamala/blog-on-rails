require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    let(:user) { FactoryBot.create(:user) }

    before :each do
      get user_posts_path(user.id)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render post/index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
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

  describe 'GET new' do
    let(:post) { FactoryBot.create(:post) }
    let(:user) { post.author }

    before :each do
      get new_user_post_path(user.id)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render posts/new view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:posty) { FactoryBot.create(:post) }
    let(:user) { posty.author }

    it 'creates a new Post' do
      expect do
        posty.save
      end.to change(Post, :count).by(1)
    end
  end
end
