require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET root, ' do
    before :each do
      get '/'
    end

    it 'show status 200' do
      expect(response).to have_http_status(:success)
    end

    it 'display the index template' do
      expect(response).to render_template(:index)
    end

    it 'the responce body has the correct content' do
      expect(response.body).to include('Index of the users')
    end
  end

  describe 'GET individual users' do
    before :each do
      get '/users/:id'
    end

    it 'return status 200 responce' do
      expect(response.status).to eq(200)
    end

    it 'should display the show tempalate' do
      expect(response).to render_template(:show)
    end

    it 'show contain the contents fo the show file' do
      expect(response.body).to include('Show users ')
    end
  end
end
