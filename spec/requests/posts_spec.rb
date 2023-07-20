require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before :each do
      get '//users/:user_id/posts'
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render post/index view' do
      expect(response).to render_template(:index)
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Posts#index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render post/show view' do
      expect(response).to render_template(:show)
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Posts#show')
    end
  end
end
