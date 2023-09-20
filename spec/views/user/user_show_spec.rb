require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  include Rails.application.routes.url_helpers
  let!(:user) { User.create(name: 'Menen', photo: 'menen.jpg', postcounter: 5) }

  let!(:post) do
    Post.create(title: 'test2', text: 'second post', author: user)
  end
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
    user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'displays the button to see all posts' do
    expect(page).to have_link('See All Posts')
  end
  it 'redirects to the post show page when a user post is clicked' do
    click_link(post.title)

    expect(page).to have_current_path(user_post_path(user, post))
  end

  it 'redirects to the post index page when see all post link is clicked' do
    click_link('See All Posts')

    expect(page).to have_current_path(user_posts_path(user))
  end
end
