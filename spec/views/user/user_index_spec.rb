require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  let!(:user1) { User.create(name: 'Menen', photo: 'menen.jpg', postcounter: 3) }
  let!(:user2) { User.create(name: 'Gelila', photo: 'gelila.jpg', postcounter: 1) }

  before do
    visit users_path
  end

  it 'it should display usernames' do
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'it show the post counter of each user' do
    expect(page).to have_content("Number of posts : #{user1.postcounter}")
    expect(page).to have_content("Number of posts : #{user2.postcounter}")
  end

  it 'it show the profile picture of the user' do
    expect(page).to have_css("img[src*='menen.jpg']")
    expect(page).to have_css("img[src*='gelila.jpg']")
  end

  it 'provides links to user show pages' do
    expect(page).to have_link(user1.name, href: user_path(user1))
    expect(page).to have_link(user2.name, href: user_path(user2))
  end
end
