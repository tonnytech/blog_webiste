# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get /index' do
    let(:user) do
      User.create(
        name: 'Tonny',
        photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
        posts_counter: 0,
        bio: 'programmer'
      )
    end
    it 'should return a status 200' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end
    it 'display the index file' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template('index')
    end
    it 'display index file content' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('posts of the user')
    end
    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'should returns http success' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response body should include the correct placeholder test' do
      expect(response.body).to include('Show posts of the user')
    end
  end
end
