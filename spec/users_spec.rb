# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'correct Inputs' do
    let(:user) do
      User.new(
        name: 'Tonny',
        photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
        posts_counter: 0,
        bio: 'programmer'
      )
    end

    it 'name input should not be blank' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'post conter to be >= 0' do
      user.posts_counter = -3
      expect(user).not_to be_valid
    end

    it 'post counter must be an integer' do
      user.posts_counter = 'string'
      expect(user).not_to be_valid
    end
  end
end
