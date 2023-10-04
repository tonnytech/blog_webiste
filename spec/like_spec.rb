require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', photo: 'TonnyPhoto', bio: 'TonnyBio')
    @post = Post.create(title: 'postTitle', text: 'postText', author_id: @user.id)
  end

  it 'initial like counter to be nil' do
    expect(@post.likes_counter).to eq(0)
  end
end
