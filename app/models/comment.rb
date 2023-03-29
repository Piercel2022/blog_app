class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_commit :comments_counter

  def update_coments_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
