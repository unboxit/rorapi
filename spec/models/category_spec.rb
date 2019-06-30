require 'rails_helper'

RSpec.describe Category, type: :model do
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
