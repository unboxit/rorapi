# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create('id' => 1, 'name' => 'Electronics')
Category.create('id' => 2, 'name' => 'Sporting Goods')
Brand.create('name' => 'Apple', 'category_id' => 1)
Brand.create('name' => 'Samsung', 'category_id' => 1)
Brand.create('name' => 'Dell', 'category_id' => 1)
Brand.create('name' => 'Adidas', 'category_id' => 2)
Brand.create('name' => 'Nike', 'category_id' => 2)
Brand.create('name' => 'Reebok', 'category_id' => 2)
Product.create('name' => 'Mac Minis', 'status' => 'Available', 'quantity' => 2, 'category_id' => 1, 'brand_id' => 1)
Product.create('name' => 'Samsung Phones', 'status' => 'Available', 'quantity' => 5, 'category_id' => 1, 'brand_id' => 2)
Product.create('name' => 'Dell PCs', 'status' => 'Available', 'quantity' => 3, 'category_id' => 1, 'brand_id' => 3)
Product.create('name' => 'Adidas Shirts', 'status' => 'Available', 'quantity' => 6, 'category_id' => 2, 'brand_id' => 4)
Product.create('name' => 'Nike Shorts', 'status' => 'Available', 'quantity' => 3, 'category_id' => 2, 'brand_id' => 5)
Product.create('name' => 'Reebok Shoes', 'status' => 'Available', 'quantity' => 1, 'category_id' => 2, 'brand_id' => 6)
