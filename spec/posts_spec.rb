# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', photo: 'TonnyPhoto', bio: 'TonnyBio', posts_counter: 0)
    @post = Post.create(title: 'PostTitle', text: 'PostText', author_id: @user.id)
    @firstcomment = Comment.create(text: 'firstcomment', author_id: @user.id, post_id: @post.id)
    @secondcomment = Comment.create(text: 'secondcomment', author_id: @user.id, post_id: @post.id)
    @thirdcomment = Comment.create(text: 'thirdcomment', author_id: @user.id, post_id: @post.id)
    @fourthcomment = Comment.create(text: 'fourthComment', author_id: @user.id, post_id: @post.id)
    @fifthcomment = Comment.create(text: 'fifthComment', author_id: @user.id, post_id: @post.id)
    @sixthcomment = Comment.create(text: 'sixthComment', author_id: @user.id, post_id: @post.id)
  end

  it 'Title should not be empty' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'Title should be <= 250 characters' do
    @post.title = 'a' * 251
    @post.comments_counter = 0
    @post.likes_counter = 0
    expect(@post).to_not be_valid
  end

  it 'Comments counter to be an integer' do
    @post.comments_counter = 'a'
    expect(@post).to_not be_valid
  end

  it 'Comments counter >= 0' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'Likes counter to be an integer' do
    @post.likes_counter = 'a'
    expect(@post).to_not be_valid
  end

  it 'Likes counter >= 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
end
