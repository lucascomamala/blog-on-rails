require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before :each do
      get users_path
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render users/index view' do
      expect(response).to render_template(:index)
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Users#index')
    end
  end

  describe 'GET /users/:user_id' do
    before :each do
      get '/users/:user_id'
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render users/show view' do
      expect(response).to render_template(:show)
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Users#show')
    end
  end
end
