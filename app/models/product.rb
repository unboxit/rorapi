class Product < ApplicationRecord
  # model association
  belongs_to :brand
  belongs_to :category

  # validations
  validates_presence_of :name, :status, :quantity
end
