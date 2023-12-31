require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Welcome', author: User.create(name: 'Vahe')) }

  before { subject.save }

  describe 'validation tests' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should be less than 251 chars' do
      subject.title = 'Lorem ipsum dolor sit amet,
      consectetuer adipiscing elit. Aenean commodo ligula
      eget dolor. Aenean massa. Cum sociis natoque penatibus
      et magnis dis parturient montes, nascetur ridiculus mus.
      Donec quam felis, ultricies neln ea'
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be integer' do
      subject.comments_counter = 'hi'
      expect(subject).to_not be_valid
    end

    it 'comments_coounter should be greater than or equal to zero' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
      subject.comments_counter = 0
      expect(subject).to be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      subject.likes_counter = -2
      expect(subject).to_not be_valid
      subject.likes_counter = 0
      expect(subject).to be_valid
    end
  end

  describe '#update_user_posts_counter' do
    it 'updates the user posts_counter attribute' do
      # Arrange
      user = User.create(name: 'Vah')
      Post.create(title: 'Hi', author: user)

      # Assert
      expect(user.reload.posts_counter).to eq(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'returns the 5 most recent comments' do
      # Arrange
      user = User.create(name: 'Vahe')
      comment1 = Comment.create(author: user, post: subject, text: 'comment 1', created_at: 5.days.ago)
      comment2 = Comment.create(author: user, post: subject, text: 'comment 2', created_at: 4.days.ago)
      comment3 = Comment.create(author: user, post: subject, text: 'comment 3', created_at: 3.days.ago)
      comment4 = Comment.create(author: user, post: subject, text: 'comment 4', created_at: 2.days.ago)
      comment5 = Comment.create(author: user, post: subject, text: 'comment 5', created_at: 1.days.ago)

      # Act
      recent_comments = subject.five_most_recent_comments

      # Assert
      expect(recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
    end
  end
end
