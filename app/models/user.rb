class User < ApplicationRecord
  has_many :posts, dependent: :delete_all, foreign_key: 'author_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def most_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
