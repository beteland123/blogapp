class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than: 0 }

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
