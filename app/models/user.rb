class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  validates :name, presence: true
  validates :postcounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_one_attached :photo  # New field for user's photo
  attribute :bio, :text    # New field for user's bio

  def admin?
    role == 'admin'
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
