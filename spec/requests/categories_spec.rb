# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    let(:category_1) { FactoryBot.create(:category, name: 'Category 1') }
    let(:category_2) { FactoryBot.create(:category, name: 'Category 2') }
    it 'retuns a list of categories' do
      allow(request).to receive(:get).and_return([category_1, category_2])
      get '/categories'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json.length).to eq(2)
    end
  end

  describe 'GET /categories/:category_id' do
    let(:category_1) { FactoryBot.create(:category, id: 1, name: 'Category 1') }
    it 'retuns a category by id' do
      allow(request).to receive(:get).and_return(category_1)
      get '/categories/1'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json['id']).to eq(1)
      expect(json['name']).to eq('Category 1')
    end
  end


  describe 'POST /categories' do
    let(:category_new) { FactoryBot.create(:category, name: 'New Category') }
    let(:params) { { name: 'New Category' } }
    it 'retuns a new category' do
      allow(request).to receive(:post).and_return(category_new)

      post '/categories', params: params
      json = JSON.parse(response.body)

      # test for the 201 status-code
      expect(response).to have_http_status(201)

      # check to make sure the right amount of messages are returned
      expect(json['name']).to eq('New Category')
    end
  end
end
