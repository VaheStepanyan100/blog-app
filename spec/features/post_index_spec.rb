require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', bio: 'He is a good programmer') }

  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }

  let!(:comment1) { Comment.create(author: user, post:, text: 'first comment') }

  let!(:comment2) { Comment.create(author: user, post:, text: 'secend comment') }

  let!(:comment3) { Comment.create(author: user, post:, text: 'third comment') }

  let!(:like1) { Like.create(author: user, post:) }

  scenario "see user's profile picture, username, number of posts and interactions" do
    visit user_posts_path(user)

    expect(page).to have_content('Tom')

    expect(page).to have_css("img[alt='Tom']", count: 1)

    expect(page).to have_content('1 post')

    expect(page).to have_content('Comments: 3')

    expect(page).to have_content('Likes: 1')
  end
  scenario "see some of the post's title, body and first comment" do
    visit user_posts_path(user)

    expect(page).to have_content('first text')

    expect(page).to have_content('first comment')

    expect(page).to have_content("first post's title")
  end
end
