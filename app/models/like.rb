class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count + 1)
  end
end
