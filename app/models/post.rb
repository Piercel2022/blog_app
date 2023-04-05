class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'post_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'post_id'

  after_commit :update_posts_counter

  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    post.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
