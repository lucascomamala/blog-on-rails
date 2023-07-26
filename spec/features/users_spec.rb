require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'User #index' do
    let!(:user) { FactoryBot.create(:user) }

    before(:each) do
      visit users_path
    end

    it 'Should render Lucas in the index page' do
      expect(page).to have_content('Lucas')
    end

    it 'Should be able to view profile pictures' do
      expect(page).to have_css('img')
    end
  end
end
