class Category < ApplicationRecord
  # model association
  has_many :brand
  has_many :product

  # validations
  validates_presence_of :name
end
