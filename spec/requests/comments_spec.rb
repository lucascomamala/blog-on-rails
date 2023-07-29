require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'POST /create' do
    let(:comment) { FactoryBot.create(:comment) }
    let(:user) { comment.user }
    let(:post) { comment.post }

    it 'creates a new Comment' do
      expect do
        comment.save
      end.to change(Comment, :count).by(1)
    end
  end
end
