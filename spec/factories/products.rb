# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'ProductName' }
    status { 'ProductStatus' }
    brand { nil }
    category { nil }
  end
end
