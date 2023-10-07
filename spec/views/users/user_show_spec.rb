# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'programmer')
    @post1 = Post.create(title: 'Hello', text: 'There', author: @user)
    visit user_posts_path(@user)
    Post.create(title: 'Morning', text: 'There', author: @user)
    visit user_posts_path(@user)
    Post.create(title: 'Night', text: 'There', author: @user)
    visit user_path(@user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
  end
  it "I can see the user's username" do
    expect(page).to have_content('Tonny')
  end
  it 'I can see the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end
  it "I can see the user's bio" do
    expect(@user.bio).to have_content('programmer')
  end
  it "I can see the user's first 3 posts." do
    expect(page).to have_content('Number of posts: 3')
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'has the title of the post' do
    expect(@post1.likes_counter).to have_content(0)
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_content('See all posts')
  end

  it "When I click a user's post, it redirects me to that post's show page" do
    # expect(page).to have_content('There')
    link = all('h2.user_post a').first
    link.click
    expect(page).to have_content('There')
  end

  it "When I click to see all posts, it redirects me to the user's post's index page" do
    click_on('See all posts')
    expect(current_path).to eq(user_posts_path(user_id: @user))
    expect(page).to have_content('Hello')
    expect(page).to have_content('There')
  end
end
