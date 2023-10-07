require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'Programmer')
    @post1 = Post.create(title: 'First post', text: 'This is first text', author: @user)
    Post.create(title: 'Second post', text: 'This is second text', author: @user)
    Post.create(title: 'Third post', text: 'This is third text', author: @user)
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
    expect(page).to have_content('First post')
  end
  it "I can see some of the post's body" do
    expect(page).to have_content('This is first text')
  end

  it 'I can see the first comments on a post' do
    expect(page).to have_content('Firt comment')
    expect(page).to have_content('second commen')
  end

  it 'I can see how many comments a post has' do
    expect(page).to have_content("Comments:#{@post1.comments_counter}")
  end
  it 'I can see how many likes a post has' do
    expect(page).to have_content("Likes : #{@post1.likes_counter}")
  end
  it 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('Pagination')
  end
  it "When I click on a post, it redirects me to that post's show page" do
    click_on('First post')
    expect(current_path).to eq(user_post_path(user_id: @user, id: @post1))
  end
end
