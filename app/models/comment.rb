class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_post_comments_counter
  before_destroy :update_comments_before_destroy

  private

  def update_post_comments_counter
    post.increment!(:commentscounter)
  end

  def update_comments_before_destroy
    post.decrement!(:commentscounter)
  end
end
