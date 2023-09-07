# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', postcounter: 0) }
  let(:post) { Post.new(title: 'Test Post', author: user) }

  it 'is not valid without a title' do
    post.title = ''
    expect(post).not_to be_valid
  end

  it 'is not valid if the title exceeds 250 characters' do
    post.title = 'a' * 251
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments counter' do
    post.commentscounter = -1
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes counter' do
    post.likescounter = -1
    expect(post).not_to be_valid
  end

  it 'belongs to an author' do
    expect(post.author).to eq(user)
  end

  it 'has many comments' do
    expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
  end

  it 'has many likes' do
    expect(Post.reflect_on_association(:likes).macro).to eq(:has_many)
  end

  it 'increments author\'s post counter after creation' do
    expect {
      post.save
    }.to change { user.reload.postcounter }.by(1)
  end

  it 'decrements author\'s post counter before destruction' do
    post.save
    expect {
      post.destroy
    }.to change { user.reload.postcounter }.by(-1)
  end

  describe 'Show 5 recent comments' do
    it 'will show 5 recent comments' do
      user = User.create(name: 'John', bio: 'Software developer')
      post = Post.create(title: 'Ruby', text: 'Data migration', author: user)
      Comment.create(author: user, post:)
      Comment.create(author: user, post:)
      Comment.create(author: user, post:)
      Comment.create(author: user, post:)
      Comment.create(author: user, post:)
      Comment.create(author: user, post:)
      
      recent_comments = post.recent_comments(5)
      expect(recent_comments.count).to eq(5)
    end
  end
end