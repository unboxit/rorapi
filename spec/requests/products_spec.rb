# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_test) { FactoryBot.create(:brand, category_id: category_test.id) }
    let(:product_1) { FactoryBot.create(:product, brand_id: brand_test.id, category_id: category_test.id) }
    let(:product_2) { FactoryBot.create(:product, brand_id: brand_test.id, category_id: category_test.id) }
    it 'retuns a list of products' do
      allow(request).to receive(:get).and_return([product_1, product_2])
      get '/products'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json.length).to eq(2)
    end
  end

  describe 'GET /products/:product_id' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_test) { FactoryBot.create(:brand, category_id: category_test.id) }
    let(:product_1) do
      FactoryBot.create(:product,
                        id: 1,
                        name: 'Product 1',
                        brand_id: brand_test.id,
                        category_id: category_test.id)
    end
    it 'retuns a product by id' do
      allow(request).to receive(:get).and_return(product_1)
      get '/products/1'
      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to have_http_status(200)

      # check to make sure the right amount of messages are returned
      expect(json['id']).to eq(1)
      expect(json['name']).to eq('Product 1')
    end
  end

  describe 'POST /products' do
    let(:category_test) { FactoryBot.create(:category) }
    let(:brand_test) { FactoryBot.create(:brand, category_id: category_test.id) }
    let(:product_new) do
      FactoryBot.create(:product,
                        name: 'New Product',
                        brand_id: brand_test.id,
                        category_id: category_test.id)
    end
    let(:params) { { name: 'New Product', brand_id: brand_test.id, category_id: category_test.id } }
    it 'retuns a new product' do
      allow(request).to receive(:post).and_return(product_new)

      post '/categories', params: params
      json = JSON.parse(response.body)

      # test for the 201 status-code
      expect(response).to have_http_status(201)

      # check to make sure the right amount of messages are returned
      expect(json['name']).to eq('New Product')
    end
  end
end
