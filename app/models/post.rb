class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :increment_user_posts_count
  before_destroy :update_post_counter_before_destroy

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def increment_user_posts_count
    author.increment!(:postcounter)
  end

  def update_post_counter_before_destroy
    author.decrement!(:postcounter)
  end
end
