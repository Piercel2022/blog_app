class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_commit :likes_counter

  def likes_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
