class User < ApplicationRecord
  has_many :posts, dependent: :delete_all, foreign_key: 'author_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'author_id'

  def most_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
