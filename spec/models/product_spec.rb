require 'rails_helper'

RSpec.describe Product, type: :model do
  # Association test
  # ensure a product record belongs to a brand
  it { should belong_to(:brand) }
  # ensure a product record belongs to a category
  it { should belong_to(:category) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:quantity) }
end
