require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'programmer',
                        posts_counter: 3)
    @post1 = Post.create(author: @user, title: 'Hello', text: 'There')

    Post.create(author: @user, title: 'Morning', text: 'There')

    Post.create(author: @user, title: 'Night', text: 'There')
    visit users_path(@user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
  end
  it "I can see the user's username" do
    expect(page).to have_content('Tonny')
  end
  it 'I can see the number of posts' do
    expect(page).to have_content("Number of posts:#{@user.posts_counter}")
  end
  it "I can see the user's bio" do
    expect(@user.bio).to have_content('programmer')
  end
  it "I can see the user's first 3 posts." do
    expect(page).to have_content('Number of posts:3')
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_content('Number of posts:3')
  end
end
