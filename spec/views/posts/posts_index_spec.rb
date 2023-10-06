require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'Programmer',
                        posts_counter: 0)
    @post1 = Post.create(author: @user, title: 'First post', text: 'This is first text')
    Post.create(title: 'Second post', text: 'This is second text', comments_counter: 0, likes_counter: 0, author: @user)
    Post.create(title: 'Third post', text: 'This is third text', comments_counter: 0, likes_counter: 0, author: @user)
    Comment.create(text: 'Firt comment', author: @user, post: @post1)
    Comment.create(text: 'second comment', author: @user, post: @post1)
    visit user_posts_path(user_id: @user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
  end

  it "I can see the user's username" do
    expect(page).to have_content('Tonny')
  end

  it 'I can see the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it "I can see a post's title" do
    expect(page).to have_content('Tonny')
  end
end
