require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'POST /create' do
    let(:like) { FactoryBot.create(:like) }
    let(:user) { like.user }
    let(:post) { like.post }

    it 'creates a new Like' do
      expect do
        like.save
      end.to change(Like, :count).by(1)
    end
  end
end
