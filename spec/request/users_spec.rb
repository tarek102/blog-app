require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'GET #index' do
    before(:example) do
      get '/users'
    end

    it 'response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it "correct 'index' template rendered" do
      expect(response).to render_template('index')
    end

    it "response body includes correct placeholder text, 'List of all Users'" do
      expect(response.body).to include('List of all Users')
    end
  end

  describe 'GET #show' do
    before(:example) do
      get '/users/192'
    end

    it 'response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template(:show)
    end

    it "response body includes correct placeholder text, 'Number of posts'" do
      expect(response.body).to include('Number of posts')
    end
  end
end
