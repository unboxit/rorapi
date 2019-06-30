# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Brands', type: :request do
  describe 'GET /brands' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_1) { FactoryBot.create(:brand, id: 1, category_id: category_test.id) }
    let(:brand_2) { FactoryBot.create(:brand, id: 2, category_id: category_test.id) }
    it 'retuns a list of brands' do
      allow(request).to receive(:get).and_return([brand_1, brand_2])
      get '/brands'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json.length).to eq(2)
    end
  end

  describe 'GET /brands/:brand_id' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_1) { FactoryBot.create(:brand, id: 1, name: 'Brand 1', category_id: category_test.id) }
    it 'retuns a brand by id' do
      allow(request).to receive(:get).and_return(brand_1)
      get '/brands/1'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json['id']).to eq(1)
      expect(json['name']).to eq('Brand 1')
    end
  end

  describe 'POST /brands?name=<brand_name>&category_id=<category_id>' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_new) { FactoryBot.create(:brand, name: 'New Brand', category_id: category_test.id) }
    let(:params) { { name: 'New Brand', category_id: category_test.id } }
    it 'retuns a new brand' do
      allow(request).to receive(:post).and_return(brand_new)

      post '/brands', params: params
      json = JSON.parse(response.body)

      # test for the 201 status-code
      expect(response).to have_http_status(201)

      # check to make sure the right amount of messages are returned
      expect(json['name']).to eq('New Brand')
      expect(json['category_id']).to eq(category_test.id)
    end
  end
end
