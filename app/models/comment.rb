class Comment < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Attributes
  attribute :text, :text

  # Methods
  def update_post_comments_counter
    post.update(comments_counter: post.comments.count + 1)
  end
end
