require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', photo: 'Tonnyphoto', bio: 'TonnyBio')
    @post = Post.create(title: 'Posttitle', text: 'PostText', author_id: @user.id)
  end

  it 'initial count to be nil' do
    expect(@post.comments_counter).to eq(0)
  end
end
