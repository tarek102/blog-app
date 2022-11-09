require 'rails_helper'
RSpec.describe 'User index', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        post_counter: 1)
    visit users_path
  end
  describe 'GET /users' do
    it 'display the correct username' do
      expect(page).to have_content('Tom')
    end
    it 'display the correct number of post' do
      expect(page).to have_content(@user.post_counter)
    end
    it 'display the correct photo' do
      expect(page.html).to include(@user.photo)
    end
    it 'makes sure that the user is redirected to that user\'s show page' do
      expect(page).to have_link('Tom', href: user_path(@user))
    end
  end
end
