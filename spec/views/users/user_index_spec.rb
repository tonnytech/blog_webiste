require 'rails_helper'

RSpec.feature 'users/index.html.erb', type: :feature do
    before :each do
        @user = User.create(name: 'Tonny', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'programmer', posts_counter: 0)
        @user2 = User.create(name: 'Tei', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'transcripsion', posts_counter: 0)
        @user3 = User.create(name: 'Ajema', photo: 'https://unsplash.com/photos/-xa9XSA7K9k', bio: 'coding', posts_counter: 0)

        Post.create(author: @user, title: 'Night', text: 'Good night')

        Post.create(author: @user2, title: 'Morning', text: 'Morning guys')

        Post.create(author: @user2, title: 'Afternoon', text: 'Afternoon guys')
        visit root_path
    end

  it 'I can see the username of all other users' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  
  it 'I can see the profile picture for each user' do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
    expect(page).to have_css("img[src*='https://unsplash.com/photos/-xa9XSA7K9k']")
  end

  it 'I can see the number of posts each user has written' do
    expect(page).to have_content("Number of posts:#{@user.posts_counter}")
    expect(page).to have_content("Number of posts:#{@user2.posts_counter}")
    expect(page).to have_content("Number of posts:#{@user3.posts_counter}")
  end

  it "When I click on a user, I am redirected to that user's show page" do
    click_link @user.name
    expect(current_path).to eq(user_path(@user))
  end

end