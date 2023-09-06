class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_post_comments_counter
  before_destroy :update_post_comments_counter_before_destroy

  def update_post_comments_counter
    post.increment!(:commentscounter)
  end

  def update_post_comments_counter_before_destroy
    post.decrement!(:commentscounter)
  end
end
