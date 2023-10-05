require 'rails_helper'

RSpec.feature 'users/index.html.erb', type: :feature do

    before :each do
        @user = User.create(name: 'Koppai', photo: 'https://picsum.photos/id/23/200', bio: 'Micronaut', posts_counter: 0)
        @user2 = User.create(name: 'Luke', photo: 'https://picsum.photos/id/23/201', bio: 'Micronaut', posts_counter: 0)
        @user3 = User.create(name: 'Blue', photo: 'https://picsum.photos/id/23/202', bio: 'Micronaut', posts_counter: 0)
        Post.create(author: @user, title: 'Hello', text: 'ladadee')

        Post.create(author: @user2, title: 'Hello', text: 'ladadee')

        Post.create(author: @user2, title: 'Hello', text: 'ladadee')
        visit root_path
    end

  it 'I can see the username of all other users' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

end