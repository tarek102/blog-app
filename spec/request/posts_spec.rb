require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
    before(:example) do
      get '/users/192/posts/'
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

  describe 'GET #show' do
    before(:example) do
      get '/users/192/posts/316'
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end

    it "response body includes correct placeholder text, 'Half of a yellow sun'" do
      expect(response.body).to include('Half of a yellow sun')
    end
  end
end
