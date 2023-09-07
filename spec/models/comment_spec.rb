require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    let(:user) { User.create(name: 'John', photo: 'http/lkk', bio: 'John bio', postcounter: 0) }

    let(:post) { user.posts.create(title: 'my first post', likescounter: 0, commentscounter: 0) }

    subject { Comment.new(author: user, text: 'wow', post:) }
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe ' like counter' do
    user = User.create(name: 'Lidiya', bio: 'Student from Eth')
    post = Post.create(author: user, title: 'SW ', text: 'Happy coding!')
    comment = Comment.new(author: user, text: 'wow', post:)

    it 'should increase comments_counter after creatation ' do
      expect { comment.save }.to change { post.commentscounter }.by(1)
    end

    it 'should decrease likes_counter after destroy' do
      expect { comment.destroy }.to change { post.reload.commentscounter }.by(-1)
    end
  end
end
