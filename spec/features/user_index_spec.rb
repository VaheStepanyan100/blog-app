require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  let(:users) do
    [
      User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Teacher from Poland.', posts_counter: 0),
      User.create(name: 'Ali', photo: 'https://unsplash.com/photos/abc123',
                  bio: 'Engineer from USA.', posts_counter: 2),
      User.create(name: 'Alice', photo: 'https://unsplash.com/photos/xyz456',
                  bio: 'Artist from France.', posts_counter: 5)
    ]
  end

  before do
    users
    visit users_path
  end

  scenario 'I can see the username, profile picture, and number of posts for each user' do
    users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.posts_counter)
    end
  end
end
