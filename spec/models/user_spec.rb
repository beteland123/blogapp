require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'alex', photo: 'photo.url', bio: 'his bio', postcounter: 0) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'post counter should be greater than 0' do
    subject.postcounter = -1
    expect(subject).not_to be_valid
  end

  it 'post counter should be valid numericality' do
    subject.postcounter = 'not_an_integer'
    expect(subject).not_to be_valid
  end

  describe 'associations' do
    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
    end

    it 'has many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
    end

    it 'has many likes' do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
    end
  end
  describe User do
    describe '#recent_posts' do
      it 'returns the most recent posts for the user' do
        user = User.create(name: 'John', photo: 'photo.url', bio: 'his bio', postcounter: 3)

        post1 = user.posts.build(title: 'First Post', text: 'This is the first post', created_at: Time.now)
        post1.save

        post2 = user.posts.build(title: 'Second Post', text: 'This is the second post', created_at: Time.now)
        post2.save

        post3 = user.posts.build(title: 'Third Post', text: 'This is the third post', created_at: Time.now)
        post3.save

        recent_posts = user.recent_posts

        expect(recent_posts).to eq([post3, post2, post1])
      end
    end
  end
end
