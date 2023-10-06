require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'Programmer', posts_counter: 0 )
    @user2 = User.create(name: 'Tei', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'Programmer', posts_counter: 0 )
    @user3 = User.create(name: 'Ajema', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'Programmer', posts_counter: 0 )
    @post1 = Post.create(title: 'Second post', text: 'This is second text', comments_counter: 0,likes_counter:0, author: @user)
    Comment.create( text: 'Firt comment', author: @user, post: @post1)
    Comment.create( text: 'second comment', author: @user, post: @post1)
    Comment.create( text: 'third comment', author: @user, post: @post1)
    visit user_post_path(user_id: @user, id: @post1)
  end

  it "I can see the post's title" do
    expect(page).to have_content('Second post')
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content('Second post')
  end

  it 'I can see how many comments it has' do
    expect(page).to have_content("Comments : #{@post1.comments_counter}")
  end

  it 'I can see how many likes it has' do
    expect(page).to have_content("Likes : #{@post1.likes_counter}")
  end

  it 'I can see the post body' do
    expect(page).to have_content(@post1.text.to_s)
  end

  it 'I can see how many likes it has' do
    expect(page).to have_content("Likes : #{@post1.likes_counter}")
  end
end