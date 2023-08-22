class User < ApplicationRecord
  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Attributes
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :post_counter, :integer, default: 0
end
