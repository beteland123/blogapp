require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
    include Rails.application.routes.url_helpers
    let!(:user) { User.create(name: 'Menen', photo: 'menen.jpg', postcounter: 5) }
    
    before do
        visit user_path(user)
    end

    it 'show user profile picture' do
        expect(page).to have_css("img[src*='menen.jpg']")
      end
    it 'show the users username' do 
        expect(page).to have_content(user.name)
    end

    it 'showthe number of posts the user has written.' do
        expect(page).to have_content("Number of posts : #{user.postcounter}")
    end

    it 'show the bio of the user' do 
        expect(page).to have_content(user.bio)
    end

    it 'shows the user first three posts' do
        user.posts.limit(3).each do |post|
          expect(page).to have_content(post.title)
        end
    end
    
end