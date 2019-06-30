# frozen_string_literal: true

namespace :export do
  desc 'Prints Category.all in a seeds.rb way.'
  task seeds_format: :environment do
    Brand.order(:id).all.each do |brand|
      puts "Brand.create(#{brand.serializable_hash.delete_if { |key, _value| %w[created_at updated_at id].include?(key) }.to_s.gsub(/[{}]/, '')})"
    end
    Category.order(:id).all.each do |category|
      puts "Category.create(#{category.serializable_hash.delete_if { |key, _value| %w[created_at updated_at id].include?(key) }.to_s.gsub(/[{}]/, '')})"
    end
    Product.order(:id).all.each do |brand|
      puts "Product.create(#{brand.serializable_hash.delete_if { |key, _value| %w[created_at updated_at id].include?(key) }.to_s.gsub(/[{}]/, '')})"
    end
  end
end
