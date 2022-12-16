require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Promise', email: 'promise@mail.com', password: '12345678') }
  let(:food) { user.foods.create(name: 'Rice', measurement_unit: 'kg', price: 100) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_food_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
