class User < ApplicationRecord
  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  # Attributes
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :post_counter, :integer, default: 0

  # Methods
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
