require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
    before(:example) do
      get '/users/311/posts/'
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end

    it "correct 'index' template rendered" do
      expect(response).to render_template('index')
    end

    it "response body includes correct placeholder text, 'List all posts'" do
      expect(response.body).to include('List all posts')
    end
  end

  describe 'GET #index' do
    before(:example) do
      get '/users/311/posts/105'
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end

    it "response body includes correct placeholder text, 'list posts'" do
      expect(response.body).to include('list posts')
    end
  end
end
