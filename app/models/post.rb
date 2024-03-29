class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'post_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'post_id'

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end
end
